package youtrack;

use strict;
use Data::Dumper;
use LWP::UserAgent;
#use LWP::Protocol::https; # Required for https support
use JSON qw( encode_json decode_json );
use File::Temp qw ( tempdir );
use List::Util qw( first );
use File::Basename;
use Encode;
use utf8;

my $ua;
our $currentField;
our $currentIssue;
our $data;

sub new {
	my $class = shift;
	my %arg = @_;
	return unless $arg{Url};
	my $self;
	
	$ua = LWP::UserAgent->new;
	$ua->timeout(10);
	$ua->default_headers->header(
			'Content-Type'=>'application/json', 
			'Accept'=>'application/json', 
			'Authorization'=>'Bearer '.$arg{Token});

	my $response = $ua->get($arg{Url}.'/api/users/me');

	if ($response->is_success) {
		 	print "Logged to YT successfully\n" if ($arg{Verbose});
		 	print Dumper($response) if ($arg{Verbose});
			$self = { url => $arg{Url}, project => $arg{Project}, verbose => $arg{Verbose} };
	}
	else {
		die $response->status_line;
	}

	bless $self, $class;
}

# Downloads each attachment in the issue and stores it in tmp folder
sub downloadAttachments {
	my $self = shift;
	my %arg = @_;

	my $attachments = $self->sendRequestToYouTrack(
				Request => '/api/issues/'.$arg{IssueKey}.'/attachments?'.
											'fields='.
												'url,'.
												'name',
				ErrorMessage => "Got error while getting attachments\n");
	unless (defined $attachments) {
		return undef;
	}

	my @downloadedFilesPaths;
	# Safe old file name to fix attachments links in issues
	my %oldFileNamesDirectory;
	my $tempdir = tempdir();
	my $counter = 1;
	foreach my $attachment (@{$attachments}) {
		# Attachment URL includes 'youtrack/' word, remove it
		$attachment->{url} =~ s/youtrack\///;
		my $file = $ua->get($self->{url}.$attachment->{url});

		# Extract file extension if any
  		my ($filename, $dirs, $suffix) = fileparse($attachment->{name}, qr/\.[^.]*$/);

		my $localizedFileName = decode_utf8($attachment->{name});
		$oldFileNamesDirectory{$localizedFileName} = "attachment$counter$suffix";
		
		# Rename the file to avoid problems with exotic file names
		open my $fh, ">", "$tempdir/".$oldFileNamesDirectory{$localizedFileName};
		binmode $fh;
		print $fh $file->content;
		close $fh;
		push @downloadedFilesPaths, "$tempdir/".$oldFileNamesDirectory{$localizedFileName};
		$counter++;
	}
	return (\@downloadedFilesPaths, \%oldFileNamesDirectory);
}

# Returns the list of tag names for specific issue id
sub getWorkLog {
	my $self = shift;
	my %arg = @_;
	
	return $self->sendRequestToYouTrack(
				Request => '/api/issues/'.$arg{IssueKey}.'/timeTracking?'.
											'fields='.
												'workItems('.
													'text,'.
													'created,'.
													'duration('.
														'minutes'.
													'),'.
													'author('.
														'login'.
													')'.
												')',
				ErrorMessage => 'Got error while getting work log');
}

# Returns the list of tag names for specific issue id
sub getTags {
	my $self = shift;
	my %arg = @_;

	my $tagsRaw = $self->sendRequestToYouTrack(
				Request => '/api/issues/'.$arg{IssueKey}.'/tags?'.
											'fields='.
												'name',
				ErrorMessage => 'Got error while getting tags\n',
				CharacterSupport => 'true');
	unless (defined $tagsRaw) {
		return undef;
	}

	my @tags;
	foreach (@{$tagsRaw}) {
		push(@tags, $_->{name});
	}
	return @tags;
}

sub getIssueLinks {
	my $self = shift;
	my %arg = @_;

	return $self->sendRequestToYouTrack(
				Request => '/api/issues/'.$arg{IssueKey}.'/links?'.
											'fields='.
												'direction,'.
												'linkType(name),'.
												'issues(id)',
				ErrorMessage => "Got error while getting links\n",
				CharacterSupport => 'true');
}

sub getAllLinkTypes {
	my $self = shift;
	my %arg = @_;

	return $self->sendRequestToYouTrack(
				Request => '/api/issueLinkTypes?'.
											'fields='.
												'name',
				ErrorMessage => "Got error while getting link types\n",
				CharacterSupport => 'true');
}

sub getAllCustomFields {
	my $self = shift;
	my %arg = @_;
	
	my $customFields = $self->sendRequestToYouTrack(	
			Request => '/api/admin/projects/'.$self->{project}.'/customFields?'.
							'fields='.
								'field('.
									'instances('.
										'field('.
											'name'.
										'),'.
										'project('.
											'shortName'.
										'),'.
										'bundle('.
											'id,'.
											'values('.
												'name'.
											')'.
										')'.
									')'.
								')',
			ErrorMessage => "Cannot retrieve custom fields information from YouTrack.",
			CharacterSupport => 'true');

	my %fieldsWithValues;
	foreach my $fieldRef (@{$customFields}) {
		foreach my $customField (@{$fieldRef->{field}->{instances}}) {
			if($customField->{project}->{shortName} eq $self->{project}) {
				my @bundleNames = map ($_->{name}, @{$customField->{bundle}->{values}});
				$fieldsWithValues{$customField->{field}->{name}} = \@bundleNames;
			}
		}
	}

	return %fieldsWithValues;
}

sub exportIssues {
	my $self = shift;
	my %arg = @_;
	my $max = $arg{Max} || 100000;

	my $issues = $self->sendRequestToYouTrack(	
			Request => '/api/issues?'.
										'query=project:%20'.$arg{Project}.'%20&'.
										'$top='.$max.'&'.
										'fields='.
											'id,'.
											'idReadable,'.
											'created,'.
											'numberInProject,'.
											'summary,'.
											'description,'.
											'comments('.
												'author('.
													'login'.
												'),'.
												'text,'.
												'created'.
											'),'.
											'reporter('.
												'login'.
											'),'.
											'customFields('.
												'name,'.
												'value('.
													'name,'.
													# TextIssueCustomField
													'text,'.
													# PeriodIssueCustomField
													'presentation,'.
													'login'.
												')'.
											')',
				ErrorMessage => "Got error while exporting issues\n",
				CharacterSupport => 'true');

	my $file = './adf-converter/output/adf-dataset.json';
	open my $fh, '<', $file or die "Could not open '$file': $!";
	local $/;  # Enable 'slurp' mode
	my $json_text = <$fh>;
	close $fh;
	my $ytOverrideData = decode_json($json_text);

	foreach my $ytIssue (@{$issues}) {
		foreach my $field (@{$ytIssue->{customFields}}) {
			$ytIssue->{$field->{name}} = undef;
			next if (not($field->{value}));
			$ytIssue->{$field->{name}} = collectValuesFromCustomField($field);
		}

		foreach my $overrideTicket (@$ytOverrideData) {
			next if $overrideTicket->{key} ne $ytIssue->{idReadable};
			print "Overriding fields for issue ".$ytIssue->{idReadable}."\n";
			if (defined $overrideTicket->{description}) {
				#print "Overriding description for issue ".$ytIssue->{idReadable}."\n";
				$ytIssue->{description} = $overrideTicket->{description};
			}
			if (defined $overrideTicket->{'Release note'}) {
				#print "Overriding description for issue ".$ytIssue->{idReadable}." with release_note\n";
				$ytIssue->{'Release note'} = $overrideTicket->{'Release note'};
			}

			next if !defined $overrideTicket->{comments};
			next if !defined $ytIssue->{comments};
			foreach my $comment (@{$ytIssue->{comments}}) {
				foreach my $overrideComment (@{$overrideTicket->{comments}}) {
					if ($comment->{created} == $overrideComment->{created}) {
						#print "Overriding comment ".$overrideComment->{created}." for issue ".$ytIssue->{idReadable}."\n";
						$comment->{text} = $overrideComment->{body};
						last;
					}
				}
			}
			last;
		}
	}

	print "Print this list of issues directly exported from YouTrack to help with troubleshooting";
	#print Dumper($issues);

	return $issues;
}

sub sendRequestToYouTrack {
	my $self = shift;
	my %arg = @_;
	
	my $response = $ua->get($self->{url}."".$arg{Request});
	
	if ($response->is_success) {		
		# All languages support
		my $content = $response->decoded_content;
		if ($arg{CharacterSupport} eq "true") {
			$content = decode_utf8($content);
		}

		my $json = JSON->new;
		return $json->decode($content);
	} else {
		print $arg{ErrorMessage}."\n";
		print $response->decoded_content."\n" if ($self->{verbose});
		print $response->status_line."\n" if ($self->{verbose});
	}
	return undef;
}

my %periodType = (	'PeriodIssueCustomField' => 1);
my %simpleType = (	'SimpleIssueCustomField' => 1,  'DateIssueCustomField' => 1);
my %singleType = (	'SingleValueIssueCustomField'=> 1,  'StateIssueCustomField'=> 1,  
					'SingleBuildIssueCustomField'=> 1,  'SingleUserIssueCustomField'=> 1,  
					'SingleGroupIssueCustomField'=> 1,  'SingleVersionIssueCustomField'=> 1,  
					'SingleOwnedIssueCustomField'=> 1,  'SingleEnumIssueCustomField'=> 1,  
					'StateMachineIssueCustomField'=> 1);
my %multiType = (	'MultiValueIssueCustomField'=> 1,  'MultiBuildIssueCustomField'=> 1,  
					'MultiGroupIssueCustomField'=> 1,  'MultiVersionIssueCustomField'=> 1,  
					'MultiOwnedIssueCustomField'=> 1,  'MultiEnumIssueCustomField'=> 1,  
					'MultiUserIssueCustomField'=> 1);
my %textType = (	'TextIssueCustomField'=> 1);

sub collectValuesFromCustomField {
	my $customField = shift;

	my $fieldType = $customField->{'$type'};
	if ($periodType{$fieldType}) {

		return $customField->{value}->{presentation};

	} elsif ($textType{$fieldType}) {

		return $customField->{value}->{text};

	} elsif ($simpleType{$fieldType}) {

		return $customField->{value};

	} elsif ($singleType{$fieldType}) {

		if (defined $customField->{value}->{login}) {
			return $customField->{value}->{login};
		} else {
			return $customField->{value}->{name};
		}
	}
	elsif ($multiType{$fieldType}) {
		
		my @multiValuesList;
		foreach my $value (@{$customField->{value}}) {			
			if (defined $value->{login}) {
				push @multiValuesList, $value->{login};
			} else {
				push @multiValuesList, $value->{name};
			}
		}
		return \@multiValuesList;

	}
	else {
		print "\nCannot process ".$fieldType." type of custom field, will be skipped.\n";
	}

	return undef;
}

1;
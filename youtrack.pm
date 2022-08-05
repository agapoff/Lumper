package youtrack;

use strict;
use Data::Dumper;
require LWP::UserAgent;
use JSON qw( decode_json );
use File::Temp qw ( tempdir );
use List::Util qw'first';
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
		 	print "Logged to YT successfully\n" if ($arg{Debug});
		 	print Dumper($response) if ($arg{Debug});
			$self = { url => $arg{Url}, project => $arg{Project}, debug => $arg{Debug} };
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
				Request => 'api/issues/'.$arg{IssueKey}.'/attachments?'.
											'fields='.
												'url,'.
												'name',
				ErrorMessage => "Got error while getting attachments\n");
	unless (defined $attachments) {
		return undef;
	}

	my @downloadedFilesPaths;
	my $tempdir = tempdir();
	foreach my $attachment (@{$attachments}) {
		# Attachment URL includes 'youtrack/' word, remove it
		$attachment->{url} =~ s/youtrack\///;
		my $r = $ua->get($self->{url}.$attachment->{url});

		open my $fh, ">", "$tempdir/".$attachment->{name} or die "$! $attachment->{name}";
		binmode $fh;
		print $fh $r->content;
		close $fh;
		push @downloadedFilesPaths, "$tempdir/".$attachment->{name};
	}
	return \@downloadedFilesPaths;
}

# Returns the list of tag names for specific issue id
sub getTags {
	my $self = shift;
	my %arg = @_;

	my $tagsRaw = $self->sendRequestToYouTrack(
				Request => 'api/issues/'.$arg{IssueKey}.'/tags?'.
											'fields='.
												'name',
				ErrorMessage => 'Got error while getting attachments\n');
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
				ErrorMessage => "Got error while getting links\n");
}

sub getPredefinedCustomFieldValues {
	my $self = shift;
	my %arg = @_;
	my $searchedCustomFieldName = %arg{FieldName};
	
	my $customFields = $self->sendRequestToYouTrack(	
			Request => '/api/admin/customFieldSettings/customFields?'.
							'fields='.
								'id,'.
								'name,'.
								'fieldType(id),instances(project(shortName),bundle(id,values(name)))',
			ErrorMessage => "Cannot retrieve custom fields information from YouTrack.");
	my $customField = first { 	$searchedCustomFieldName eq $_->{name} and 
								first { $self->{Project} eq $_->{Project}->{ShortName} } @{ $_->{instances} } 
							} @{ $customFields };

	if (defined $customField && index $customField->{fieldType}->{id}, "enum" != -1) {
		my $bundle = first { $self->{Project} eq $_->{Project}->{ShortName} } @{ $customField->{instances} };
		
		unless (defined $bundle) {
			return undef;
		}
		return map { $_->{name} => 1 } @{$bundle->{bundle}->{values}};
	}
}

sub exportIssues {
	my $self = shift;
	my %arg = @_;
	my $max = $arg{Max} || 10000;

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
				ErrorMessage => "Got error while exporting issues\n");

	foreach my $issue (@{$issues}) {
		foreach my $field (@{$issue->{customFields}}) {	

			$issue->{$field->{name}} = undef;
			next if (not($field->{value}));

			$issue->{$field->{name}} = collectValuesFromCustomField(\%{$field});
		}
	}

	return $issues;
}

sub sendRequestToYouTrack {
	my $self = shift;
	my %arg = @_;
	
	my $response = $ua->get($self->{url}."".$arg{Request});
	
	if ($response->is_success) {		
		# All languages support
		my $utf8DecodedInput = decode_utf8($response->decoded_content);

		my $json = JSON->new;
		return $json->decode($utf8DecodedInput);
	} else {
		print $arg{ErrorMessage}."\n";
		print $response->decoded_content."\n" if ($self->{debug});
		print $response->status_line."\n" if ($self->{debug});
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
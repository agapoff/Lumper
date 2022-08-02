package youtrack;

use strict;
use Data::Dumper;
require LWP::UserAgent;
use JSON qw( decode_json );
use File::Temp qw ( tempdir );
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
			$self = { url => $arg{Url}, debug => $arg{Debug} };
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

	my $response = $ua->get($self->{url}.'/api/issues/'.$arg{IssueKey}.'/attachments?'.
											'fields='.
												'url,'.
												'name');

	if ($response->is_success) {
		my $json = JSON->new;
		my $attachments = $json->decode($response->decoded_content);

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
	} else {
		print "Got error while getting attachments\n";
		print $response->decoded_content."\n";
	}
}

# Returns the list of tag names for specific issue id
sub getTags {
	my $self = shift;
	my %arg = @_;

	my $response = $ua->get($self->{url}.'/api/issues/'.$arg{IssueKey}.'/tags?'.
											'fields='.
												'name');

	if ($response->is_success) {
		# All languages support
		my $utf8DecodedInput = decode_utf8($response->decoded_content);	

		my $json = JSON->new;
		my $tagsRaw = $json->decode($utf8DecodedInput);
		
		my @tags;
		foreach (@{$tagsRaw}) {
			push(@tags, $_->{name});
		}

		return @tags;
	} else {
		print "Got error while getting attachments\n";
		print $response->decoded_content."\n";
	}
}

sub getIssueLinks {
	my $self = shift;
	my %arg = @_;

	my $response = $ua->get($self->{url}.'/api/issues/'.$arg{IssueKey}.'/links?'.
											'fields='.
												'direction,'.
												'linkType(name),'.
												'issues(id)');

	if ($response->is_success) {
		my $json = JSON->new;
		my $links = $json->decode($response->decoded_content);
		
		return $links;
	} else {
		print "Got error while getting links\n";
		print $response->decoded_content."\n";
	}
}

sub exportIssues {
	my $self = shift;
	my %arg = @_;
	my $max = $arg{Max} || 10000;

	my $response = $ua->get($self->{url}.'/api/issues?'.
										'query=project:%20'.$arg{Project}.'%20&'.
										'$top='.$max.'&'.
										'fields='.
											'id,'.
											'idReadable,'.
											'created,'.
											'numberInProject,'.
											'comments(author(login),text,created),'.
											'summary,'.
											'description,'.
											'reporter(login),'.
											'customFields(name,value(name,login))');

	if ($response->is_success) {
		
		# All languages support
		my $utf8DecodedInput = decode_utf8($response->decoded_content);

		my $json = JSON->new;
		my $issues = $json->decode($utf8DecodedInput);

		foreach my $issue (@{$issues}) {
			foreach my $field (@{$issue->{customFields}}) {	

				$issue->{$field->{name}} = undef;
				next if (not($field->{value}));

				if($field->{'$type'} eq "SingleUserIssueCustomField") {
					$issue->{$field->{name}} = $field->{value}->{login};
				} elsif ($field->{'$type'} eq "MultiUserIssueCustomField") {
					my @listOfUsersInCustomField;
					foreach my $user (@{$field->{value}}) {
						push @listOfUsersInCustomField, $user->{login};
				}
					$issue->{$field->{name}} = \@listOfUsersInCustomField;
				} else {
					$issue->{$field->{name}} = $field->{value}->{name};
				}
			}
		}
		return $issues;
	} else {
		print "Got error while exporting issues\n";
		print $response->decoded_content."\n" if ($self->{debug});
		print $response->status_line."\n" if ($self->{debug});
	}
	return;
}

1;
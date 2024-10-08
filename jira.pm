package jira;

use strict;
use warnings;
use Data::Dumper;
use LWP::UserAgent;
use HTTP::Cookies::Netscape;
use JSON;
use MIME::Base64;

my $ua;
my $meta;

sub new {
	my $class = shift;
	my %arg = @_;
	return "No URL defined" unless $arg{Url};
	my $basic = encode_base64($arg{Login}.":".$arg{Password});
	my $cookie_jar;	
	my $self;

	if ($arg{CookieFile}) {
		print "Asked to use Cookie_file at $arg{CookieFile}\n" if ($self->{verbose});
		$cookie_jar = HTTP::Cookies::Netscape->new(
		file     => $arg{CookieFile},
		);
	}

	$ua = LWP::UserAgent->new;
	if ($arg{CookieFile}) {
		$ua->cookie_jar( $cookie_jar );
	}	
	$ua->timeout(30);
	my $response = $ua->get($arg{Url}.'/rest/auth/latest/session', Authorization => 'Basic '.$basic);
	if ($response->is_success) {
		print "Logged to Jira successfully\n" if ($self->{verbose});
		$self = { basic => $basic, url => $arg{Url}, verbose => $arg{Verbose} };
	} else {
		print "Login to Jira was unsuccessfull\n" if ($self->{verbose});;
		print $response->status_line if ($self->{verbose});
		return;
	}

	if ($arg{Project}) {
		print "Project is defined in constructor. So I am going to get the metadata for project $arg{Project}\n" if $arg{Verbose};
		my $response = $ua->get($arg{Url}.'/rest/api/latest/issue/createmeta?projectKeys='.$arg{Project}.'&expand=projects.issuetypes.fields', Authorization => 'Basic '.$basic);
		if ($response->is_success) {
			my $rawMeta = decode_json $response->decoded_content;	

			foreach my $project (@{$rawMeta->{projects}}) {
				if ($project->{key} eq $arg{Project}) {
					foreach my $issuetype (@{$project->{issuetypes}}) {
						foreach my $field (keys %{$issuetype->{fields}}) {
							$meta->{fields}->{$issuetype->{name}}->{$issuetype->{fields}->{$field}->{name}} = $field;
							$meta->{fieldtypes}->{$issuetype->{fields}->{$field}->{name}} = $issuetype->{fields}->{$field}->{schema}->{type};
						}
					}
				}
			}
			print Dumper($meta) if $arg{Verbose};
			$self->{meta} = $meta;
			$self->{project} = $arg{Project};
		} else {
			print 
				die "Cannot get meta for project ".$arg{Project}." (".$response->status_line.")\n";
		}
	}

	bless $self, $class;
}

sub getMeta {
	return $meta;
}

sub getUser {
	my $self = shift;
	my %arg = @_;
	my $response = $ua->get($self->{url}.'/rest/api/latest/user?accountId='.$arg{Id}, Authorization => 'Basic '.$self->{basic});
	if ($response->is_success) {
		return decode_json $response->decoded_content;
	}
	return;
}

sub getAllIssues {
	my $self = shift;
	my %arg = @_;
	my $response = $ua->get($self->{url}.'/rest/api/latest/search?maxResults='.$arg{Max}.'&jql=project="'.$arg{Project}.'"', Authorization => 'Basic '.$self->{basic});
	if ($response->is_success) {
		return decode_json $response->decoded_content;
	} else {
		print "Got error while getting issues\n";
		print $response->status_line;
	}
}

sub getAllLinkTypes {
	my $self = shift;
	my %arg = @_;
	my $response = $ua->get($self->{url}.'/rest/api/2/issueLinkType', Authorization => 'Basic '.$self->{basic});
	if ($response->is_success) {
		return \@{decode_json($response->decoded_content)->{issueLinkTypes}};
	} else {
		print "Got error while getting issues\n";
		print $response->status_line;
	}
}

sub getAllPriorities {
	my $self = shift;
	my %arg = @_;
	my $response = $ua->get($self->{url}.'/rest/api/2/priority', Authorization => 'Basic '.$self->{basic});
	if ($response->is_success) {
		return \@{decode_json($response->decoded_content)};
	} else {
		print "Got error while getting priorities\n";
		print $response->status_line;
	}
}

sub getAllStatuses {
	my $self = shift;
	my %arg = @_;

	my ($issues) = @{getAllIssues($self, Project => $self->{project}, Max => 1)->{issues}};
	unless (defined $issues->{key}) {
		return [];
	}
	
	my $response = $ua->get($self->{url}.'/rest/api/latest/issue/'.$issues->{key}.'/transitions?expand=transitions.fields', Authorization => 'Basic '.$self->{basic});
	
	if ($response->is_success) {
		return \@{decode_json($response->decoded_content)->{transitions}};
	} else {
		print "Got error while getting statuses\n";
		print $response->status_line;
	}
}

sub getAllResolutions {
	my $self = shift;
	my %arg = @_;
	my $response = $ua->get($self->{url}.'/rest/api/2/resolution', Authorization => 'Basic '.$self->{basic});
	if ($response->is_success) {
		return \@{decode_json($response->decoded_content)};
	} else {
		print "Got error while getting resolutions\n";
		print $response->status_line;
	}
}

sub addWorkLog {
	my $self = shift;
	my %arg = @_;
	my %workLog = %{$arg{WorkLog}};
	my $content = encode_json \%workLog;

	my $basic = ($arg{Login} && $arg{Password}) ? encode_base64($arg{Login}.":".$arg{Password}) : $self->{basic}; 
	my $response = $ua->post($self->{url}.'/rest/api/latest/issue/'.$arg{Key}.'/worklog', 
								Authorization => 'Basic '.$basic, 
								'Content-Type' => 'application/json', 
								'Content' => $content);

}

sub getIssue {
	my $self = shift;
	my %arg = @_;
	my $response = $ua->get($self->{url}.'/rest/api/latest/issue/'.$arg{Key}, Authorization => 'Basic '.$self->{basic});
	if ($response->is_success) {
		print $response->decoded_content if ($self->{verbose});
	} else {
		print "Got error while getting issue\n";
		print $response->status_line;
	}
}

sub deleteIssue {
	my $self = shift;
	my %arg = @_;
	my $response = $ua->delete($self->{url}.'/rest/api/latest/issue/'.$arg{Key}, Authorization => 'Basic '.$self->{basic});
	if ($response->is_success) {
		print "Issue ".$arg{Key}." deleted.\n";
		print $response->status_line."\n" if ($self->{verbose});
		print $response->decoded_content."\n" if ($self->{verbose});
		return 1;
	} else {
		print "Got error while deleting issue\n";
		print $response->status_line;
		return;
	}
}

sub createIssue {
	my $self = shift;
	my %arg = @_;
	my %data;
	$data{fields} = $arg{Issue};
	# Jira doesn't allow to post description longer than 32k
	$data{fields}->{description} = substr ($data{fields}->{description}, 0, 32766) if ($data{fields}->{description});
	# Jira doesn't allow to post summary longer than 255 bytes
	$data{fields}->{summary} = substr ($data{fields}->{summary}, 0, 254);
	# # Jira doesn't allow spaces in labels
	foreach (@{$data{fields}->{labels}}) {
		$_ =~ s/\s/_/g;
	}

	foreach my $customField (keys %{$arg{CustomFields}}) {
		my $fieldId = $self->{meta}->{fields}->{$arg{Issue}->{issuetype}->{name}}->{$customField};
		my $fieldType = $self->{meta}->{fieldtypes}->{$customField};
		
		if (defined $fieldId && defined $fieldType) {
			if ($fieldType eq 'string') {
				$data{fields}->{$fieldId} = $arg{CustomFields}->{$customField};
			} elsif ($fieldType eq 'option') {
				$data{fields}->{$fieldId}->{value} = $arg{CustomFields}->{$customField};
			} elsif ($fieldType eq 'array') {
				$data{fields}->{$fieldId}->[0]->{name} = $arg{CustomFields}->{$customField};
			} elsif ($fieldType eq 'resolution') {
				$data{fields}->{$fieldId}->{name} = $arg{CustomFields}->{$customField};
			} elsif ($fieldType eq 'datetime') {
				$data{fields}->{$fieldId} = $arg{CustomFields}->{$customField};
			}
		}
	}

	my $content = encode_json \%data;
	print $content."\n" if ($self->{verbose});
	my $basic = ($arg{Login} && $arg{Password}) ? encode_base64($arg{Login}.":".$arg{Password}) : $self->{basic};

	my $response = $ua->post($self->{url}.'/rest/api/latest/issue', Authorization => 'Basic '.$basic, 'Content-Type' => 'application/json', 'Content' => $content);
	if ($response->is_success) {
		print $response->status_line."\n" if ($self->{verbose});
		print $response->decoded_content."\n" if ($self->{verbose});
		my $answer = decode_json $response->decoded_content;
		print $answer->{key}."\n" if ($self->{verbose});
		return $answer->{key};
	} else {
		print "Got error while creating issues\n";
		print $response->status_line."\n";
		print $response->decoded_content."\n";
	}
	return;
}

sub changeFields {
	my $self = shift;
	my %arg = @_;
	my %data;

	foreach my $customField (keys %{$arg{Fields}}) {
	# Ugly but quick
		my $fieldId = $self->{meta}->{fields}->{Task}->{$customField} || $self->{meta}->{fields}->{Bug}->{$customField};
		my $fieldType = $self->{meta}->{fieldtypes}->{$customField};
		if (defined $fieldId && defined $fieldType) {
			if ($fieldType eq 'string') {
				$data{fields}->{$fieldId} = $arg{Fields}->{$customField};
			} elsif ($fieldType eq 'option') {
				$data{fields}->{$fieldId}->{value} = $arg{Fields}->{$customField};
			} elsif ($fieldType eq 'array') {
				$data{fields}->{$fieldId}->[0]->{name} = $arg{Fields}->{$customField};
			} elsif ($fieldType eq 'resolution' || $fieldType eq 'issuetype' || $fieldType eq 'priority' || $fieldType eq 'assignee') {
				$data{fields}->{$fieldId}->{name} = $arg{Fields}->{$customField};
			} elsif ($fieldType eq 'datetime') {
				$data{fields}->{$fieldId} = $arg{CustomFields}->{$customField};
			}
		}
	}
	#print Dumper (\%data);

	my $content = encode_json \%data;
	print $content."\n" if ($self->{verbose});
	my $basic = ($arg{Login} && $arg{Password}) ? encode_base64($arg{Login}.":".$arg{Password}) : $self->{basic};

	my $response = $ua->put($self->{url}.'/rest/api/latest/issue/'.$arg{Key}, Authorization => 'Basic '.$basic, 'Content-Type' => 'application/json', 'Content' => $content);
	if ($response->is_success) {
		print $response->status_line."\n" if ($self->{verbose});
		print $response->decoded_content."\n" if ($self->{verbose});
		return 1;
	} else {
		print "Got error while changing fields\n";
		print $response->status_line."\n";
		print $response->decoded_content."\n";
	}
	return;
}

sub doTransition {
	my $self = shift;
	my %arg = @_;
	my %data;

	my $transitionId;
	my $response = $ua->get($self->{url}.'/rest/api/latest/issue/'.$arg{Key}.'/transitions?expand=transitions.fields', Authorization => 'Basic '.$self->{basic});
	if ($response->is_success) {
		my $answer = decode_json $response->decoded_content;
		foreach (@{$answer->{transitions}}) {
			if ($_->{name} eq $arg{Status}) {
				$transitionId = $_->{id};
				print "Transition Id for Status ".$arg{Status}." is ".$transitionId."\n";
				last;
			}
		}
	} else {
		print "Got error while getting transitions\n";
		print $response->status_line;
	}

	return unless ($transitionId);

	$data{transition} = { "id" => $transitionId };
	my $content = encode_json \%data;
	print $content."\n" if ($self->{verbose});
	$response = $ua->post($self->{url}.'/rest/api/latest/issue/'.$arg{Key}.'/transitions', Authorization => 'Basic '.$self->{basic}, 'Content-Type' => 'application/json', 'Content' => $content);
	if ($response->is_success) {
		print $response->status_line."\n" if ($self->{verbose});
		return 1;
	} else {
		print "Got error while doing transition\n";
		print $response->status_line."\n";
		print $response->decoded_content."\n";
	}
}

sub createIssues {
	my $self = shift;
	my %arg = @_;
	my %data;
	foreach (@{$arg{Issues}}) {
		push @{$data{issueUpdates}}, { fields => $_ };
	}
	my $content = encode_json \%data;
	print $content."\n" if ($self->{verbose});
	my $response = $ua->post($self->{url}.'/rest/api/latest/issue/bulk', Authorization => 'Basic '.$self->{basic}, 'Content-Type' => 'application/json', 'Content' => $content);
	if ($response->is_success) {
		print $response->status_line."\n" if ($self->{verbose});
		print $response->decoded_content if ($self->{verbose});
		my $answer = decode_json $response->decoded_content;
	} else {
		print "Got error while creating issue\n";
		print $response->status_line."\n";
		print $response->decoded_content."\n";

	}
}

sub createComment {
	my $self = shift;
	my %arg = @_;
	my %data;
	$data{body} = substr ($arg{Body}, 0, 32766); # Jira doesn't allow to post comments longer than 32k
		my $content = encode_json \%data;
	print $content."\n" if ($self->{verbose});
	my $basic = ($arg{Login} && $arg{Password}) ? encode_base64($arg{Login}.":".$arg{Password}) : $self->{basic}; 
	my $response = $ua->post($self->{url}.'/rest/api/latest/issue/'.$arg{IssueKey}.'/comment', Authorization => 'Basic '.$basic, 'Content-Type' => 'application/json', 'Content' => $content);
	if ($response->is_success) {
		return decode_json $response->decoded_content;
	} else {
		print "Got error while creating comment\n";
		print $response->status_line."\n";
		print $response->decoded_content."\n";
	}
	return;
}

sub createIssueLink {
	my $self = shift;
	my %arg = @_;
	my $content = encode_json $arg{Link};
	print $content."\n" if ($self->{verbose});
	my $response = $ua->post($self->{url}.'/rest/api/latest/issueLink', Authorization => 'Basic '.$self->{basic}, 'Content-Type' => 'application/json', 'Content' => $content);
	if ($response->is_success) {
		print $response->decoded_content."\n" if ($self->{verbose});
		return 1;
	}
	print $response->status_line."\n" if ($self->{verbose});
	return;
}

sub addAttachments {
	my $self = shift;
	my %arg = @_;
	foreach my $file (@{$arg{Files}}) {
		my $filesize = -s $file;
		if ( $filesize > 10485760 ) {
			print "The file size exceeds the maximum permitted size of 10485760 bytes";
			return 1;
		}
		my $response = $ua->post($self->{url}.'/rest/api/latest/issue/'.$arg{IssueKey}.'/attachments', Authorization => 'Basic '.$self->{basic}, 'Content_Type' => 'multipart/form-data', Content => [file => [$file]], 'X-Atlassian-Token' => 'no-check');
		if ($response->is_success) {
			print $response->status_line."\n" if ($self->{verbose});
			print $response->decoded_content if ($self->{verbose});
		} else {
			print "Got error while uploading files\n";
			print $response->status_line."\n";
			print $response->decoded_content."\n";
			return;
		}
	}
	return 1;
}


1;

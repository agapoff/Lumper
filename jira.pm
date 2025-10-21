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

	$meta->{ztnaBoard} = $arg{ZtnaBoard};

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
		print "Logged to Jira successfully\n";
		$self = { basic => $basic, url => $arg{Url}, verbose => $arg{Verbose} };
	} else {
		print "Login to Jira was unsuccessfull\n";
		print $response->status_line if ($self->{verbose});
		return;
	}

	if ($arg{Project}) {
		print "Project is defined in constructor. So I am going to get the metadata for project $arg{Project}\n" if $arg{Verbose};
		my $response = $ua->get($arg{Url}.'/rest/api/latest/issue/createmeta?projectKeys='.$arg{Project}.'&expand=projects.issuetypes.fields', Authorization => 'Basic '.$basic);
		if (!$response->is_success) {
			print 
				die "Cannot get meta for project ".$arg{Project}." (".$response->status_line.")\n";
		}
		my $rawMeta = decode_json $response->decoded_content;
		print "Print this raw meta data to help with troubleshooting\n";
		print Dumper($rawMeta) if $arg{Verbose};
		print "\n=======\n" if $arg{Verbose};
		foreach my $project (@{$rawMeta->{projects}}) {
			if ($project->{key} eq $arg{Project}) {
				$meta->{projectId} = $project->{id};
				foreach my $issuetype (@{$project->{issuetypes}}) {
					foreach my $field (keys %{$issuetype->{fields}}) {
						$meta->{fields}->{$issuetype->{name}}->{$issuetype->{fields}->{$field}->{name}} = $field;
						$meta->{fieldtypes}->{$issuetype->{fields}->{$field}->{name}} = $issuetype->{fields}->{$field}->{schema}->{type};
					}
				}
			}
		}

		# GET SPRINTS
		$response = $ua->get($arg{Url}.'/rest/agile/1.0/board?projectKeyOrId='.$arg{Project}, Authorization => 'Basic '.$basic, 'Accept' => 'application/json');
		if (!$response->is_success) {
			print "Got error while getting boards\n";
			print $response->status_line."\n" if $arg{Verbose};
			print $response->decoded_content."\n" if $arg{Verbose};
		}
		my $boards = decode_json $response->decoded_content;
		my $found = 0;
		foreach my $board (@{$boards->{values}}) {
			if ($board->{name} eq $meta->{ztnaBoard}) {
				$meta->{boards}->{$board->{name}} = $board->{id};
				$found = 1;
				last;
			}
		}
		if (!$found) {
			print "Board with name $meta->{ztnaBoard} not found in project $arg{Project}. Please create it.\n";
		}
		$response = $ua->get($arg{Url}.'/rest/agile/1.0/board/'.$meta->{boards}->{$meta->{ztnaBoard}}.'/sprint', Authorization => 'Basic '.$basic, 'Accept' => 'application/json');
		if (!$response->is_success) {
			print "Got error while getting sprints\n";
			print $response->status_line."\n";
			print $response->decoded_content."\n";
		}
		my $sprints = decode_json $response->decoded_content;
		$meta->{sprints} = {};
		foreach my $sprint (@{$sprints->{values}}) {
			$meta->{sprints}->{$sprint->{name}} = $sprint->{id};
		}

		# GET VERSIONS
		$response = $ua->get($self->{url}.'/rest/api/3/project/'.$arg{Project}.'/versions', Authorization => 'Basic '.$basic, 'Accept' => 'application/json');
		if (!$response->is_success) {
			print "Got error while getting versions\n";
			print $response->status_line."\n" if $arg{Verbose};
			print $response->decoded_content."\n" if $arg{Verbose};
		}
		my $versions = decode_json $response->decoded_content;
		$meta->{versions} = {};
		foreach my $version (@{$versions}) {
			$meta->{versions}->{$version->{name}} = $version->{id};
		}

		print "Print this extracted meta to help with troubleshooting\n";
		print Dumper($meta) if $arg{Verbose};
		$self->{meta} = $meta;
		$self->{project} = $arg{Project};
	}

	bless $self, $class;
}

sub getMeta {
	return $meta;
}

sub getUser {
	# This API fails; our API tokens don't have global permission. But this subroutine is only used by check.pm
	my $self = shift;
	my %arg = @_;
	my $response = $ua->get($self->{url}.'/rest/api/3/user?accountId='.$arg{Id}, Authorization => 'Basic '.$self->{basic});
	if ($response->is_success) {
		return decode_json $response->decoded_content;
	}
	return;
}

sub getAllIssues {
	my $self = shift;
	my %arg = @_;
	#my $response = $ua->get($self->{url}.'/rest/api/latest/search?maxResults='.$arg{Max}.'&jql=project="'.$arg{Project}.'"', Authorization => 'Basic '.$self->{basic});
	my $response = $ua->get($self->{url}.'/rest/api/3/search/jql?maxResults='.$arg{Max}.'&jql=project="'.$arg{Project}.'"', Authorization => 'Basic '.$self->{basic});
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
				my $fieldValue = $arg{CustomFields}->{$customField};
				if ($fieldId eq 'customfield_10851' and ($fieldValue eq 'Test' || $fieldValue eq 'Controller')) {
					warn "Skipping setting 'Test' or 'Controller' value for field 'ZTNA Subsystem'\n";
				}
				else {
					$data{fields}->{$fieldId}->{value} = $fieldValue;
				}
			} elsif ($fieldType eq 'array') {
				if ($fieldId eq 'customfield_10818') {
					my %impactMapper = (
						'No Impact'                   => '11345',
						'Docs Needs Update'           => '11346',
						'Release Notes Needs Update'  => '11347',
						'VPAT Needs Update'           => '11348',
						'Not reviewed'                => '11349',
					);
					my $ids = [];
					foreach my $impact (@{$arg{CustomFields}->{$customField}}) {
						if (exists $impactMapper{$impact}) {
							push @{$ids}, { id => $impactMapper{$impact} };
						}
					}
					if (scalar(@{$ids}) == 0) {
						push @{$ids}, { id => '11349' };
					}
					$data{fields}->{$fieldId} = $ids;
				}
				else {
					$data{fields}->{$fieldId}->[0]->{name} = $arg{CustomFields}->{$customField};
				}
			} elsif ($fieldType eq 'resolution') {
				$data{fields}->{$fieldId}->{name} = $arg{CustomFields}->{$customField};
			} elsif ($fieldType eq 'datetime') {
				$data{fields}->{$fieldId} = $arg{CustomFields}->{$customField};
			} elsif ($fieldType eq 'user') {
				$data{fields}->{$fieldId} = {id => $arg{CustomFields}->{$customField} };
			}
		}
	}

	# ensure fix version value exists in JIRA
	my $versionsToAdd = {};
	foreach my $ytVersion (@{$data{fields}->{fixVersions}}) {
		my $exists = 0;
		foreach my $jiraVersionName (keys %{$meta->{versions}}) {
			if ($jiraVersionName eq $ytVersion->{name}) {
				$exists = 1;
				last;
			}
		}
		if(!$exists) {
			$versionsToAdd->{$ytVersion->{name}} = 1;
		}
	}
	foreach my $fixVersionName (keys %{$versionsToAdd}) {
		print "FixVersion '$fixVersionName' does NOT exist in Jira versions. It will be created.\n";

		# create the fix version and grab the id
		my %createVersionData = (
			name => $fixVersionName,
			projectId => $meta->{projectId}
		);
		my $createVersionContent = encode_json \%createVersionData;
		my $response = $ua->post($self->{url}.'/rest/api/3/version', Authorization => 'Basic '.$self->{basic}, 'Accept' => 'application/json', 'Content-Type' => 'application/json', 'Content' => $createVersionContent);
		if (!$response->is_success) {
			print "Got error while creating version\n";
			print $response->status_line."\n" if ($self->{verbose});
			print $response->decoded_content."\n" if ($self->{verbose});
			return;
		}
		print "FixVersion '$fixVersionName' created successfully.\n";
		my $newVersion = decode_json $response->decoded_content;
		my $fixVersionId = $newVersion->{id};
	
		# update the cache in $meta
		$meta->{versions}->{$fixVersionName} = $fixVersionId;
	}
	my $i = 0;
	foreach my $fixVersionName (@{$data{fields}->{fixVersions}}) {
		if (defined $fixVersionName->{name}) {
			my $fixVersionName = $fixVersionName->{name};
			my $fixVersionId = $meta->{versions}->{$fixVersionName};
			$data{fields}->{fixVersions}->[$i]->{id} = $fixVersionId;
			$i = $i + 1;
		}
	}

	# ensure sprint value exists
	my $sprintsToAdd = {};
	foreach my $ytSprintField (@{$data{fields}->{customfield_10020}}) {
		foreach my $ytSprint (@{$ytSprintField->{name}}) {
			my $exists = 0;
			foreach my $jiraSprintName (keys %{$meta->{sprints}}) {
				if ($jiraSprintName eq $ytSprint) {
					$exists = 1;
					last;
				}
			}
			if(!$exists) {
				$sprintsToAdd->{$ytSprint} = 1;
			}
		}
	}
	foreach my $sprintName (keys %{$sprintsToAdd}) {
		print "Sprint '$sprintName' does NOT exist in Jira sprints. It will be created.\n";

		my $boardId = $meta->{boards}->{'ZTNA Board'};
		my %createSprintData = (
			name => $sprintName,
			originBoardId => $boardId
		);
		my $createSprintContent = encode_json \%createSprintData;
		my $response = $ua->post($self->{url}.'/rest/agile/1.0/sprint', Authorization => 'Basic '.$self->{basic}, 'Accept' => 'application/json', 'Content-Type' => 'application/json', 'Content' => $createSprintContent);
		if (!$response->is_success) {
			print "Got error while creating sprint\n";
			print $response->status_line."\n" ;#if ($self->{verbose});
			print $response->decoded_content."\n";# if ($self->{verbose});
			return;
		}
		print "Sprint '$sprintName' created successfully.\n";
		my $newSprint = decode_json $response->decoded_content;
		my $sprintId = $newSprint->{id};
	
		# update the cache in $meta
		$meta->{sprints}->{$sprintName} = $sprintId;
	}
	my $isSetSprintId = 0;
	if (defined $data{fields}->{customfield_10020}) {
		# if $data{fields}->{customfield_10020} has 1 or more sprints, take the first one 
		if (ref $data{fields}->{customfield_10020} eq 'ARRAY') {
			# if the sprint is an array, we need to convert it to an id		
			my $length = scalar @{$data{fields}->{customfield_10020}};
			if ($length > 0) {
				my $sprintNameArray = $data{fields}->{customfield_10020}->[0]->{name}; 
				$length = scalar @{$sprintNameArray};
				if ($length > 0) {
					#if there's 1 or more sprints, sort in desc and take the first one
					@$sprintNameArray = sort { $b cmp $a } @$sprintNameArray;
					my $sprintName = $sprintNameArray->[0];
					my $sprintId = $meta->{sprints}->{$sprintName};
					$data{fields}->{customfield_10020} = $sprintId;
					$isSetSprintId = 1;
				}
			}
		}
	}
	if (!$isSetSprintId) {
		delete $data{fields}->{customfield_10020};
	}

	# and lastly, actually create the issue
	my $content = encode_json \%data;
	print "Issue Content: " . $content . "\n";
	my $response = $ua->post($self->{url}.'/rest/api/latest/issue', Authorization => 'Basic '.$self->{basic}, 'Content-Type' => 'application/json', 'Content' => $content);
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
-1;
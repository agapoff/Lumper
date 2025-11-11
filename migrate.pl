#!/usr/bin/perl

use File::Basename qw/dirname/;
use File::Temp qw ( tempdir );
use lib dirname(__FILE__);
use display;
use youtrack;
use check;
use jira;
require "config.pl";
require "credentials.pl";

use Data::Dumper;
use Getopt::Long;
use IPC::Run qw( run );
use Date::Format;
use Encode;

use IO::Handle;
STDOUT->autoflush(1);
STDERR->autoflush(1);  # if you print to stderr too

# Used to display column-like output
my $display = display->new(); 

$display->printTitle("Initialization");

my ($skip, $notest, $first, $id, $checkKeys, $cookieFile, $verbose);
Getopt::Long::Configure('bundling');
GetOptions(
	"first|f=i"       => \$first,
    "skip|s=i"        => \$skip,
	"issueid|id=i"    => \$id,
	"check-keys!"     => \$checkKeys,
    "no-test|t"       => \$notest,
    "cookie-file|c=s" => \$cookieFile,
    "verbose|v"       => \$verbose
);

if (not defined $checkKeys) {
	$checkKeys = 0;
}

my $yt = youtrack->new( Url      => $YTUrl,
                        Token    => $YTtoken,
                        Verbose  => $verbose,
						Project  => $YTProject );

unless ($yt) {
	die "Could not login to $YTUrl";
}

my $jira = jira->new(Url        => $JiraUrl,
                    Login       => $JiraLogin,
                    Password    => $JiraPassword,
                    Verbose     => $verbose,
                    Project     => $JiraProject,
		      		CookieFile  => $cookieFile,
					ZtnaBoard   => $ztnaBoardName);

unless ($jira) {
    die "Could not login to $JiraUrl\n";
}

print "Success\n";

$display->printTitle("Getting YouTrack Issues");
my $export = $yt->exportIssues(Project => $YTProject, Max => 0, IssueId => $id);

# Find active users from issues, comments and other YT activity
my %users;
foreach my $issue (@{$export}) {
	$users{$issue->{Assignee}} = 1;
	$users{$issue->{reporter}->{login}} = 1;
	foreach (@{$issue->{comments}}) {
		$users{$_->{author}->{login}} = 1;
	}
}
# Join those active with those that are listed in config 
# in case if config ones are not listed in the %users
foreach my $configUser (keys %Users) {
	$users{$configUser} = 1;
}
print Dumper(%users) if ($verbose);

my $check = check->new( 
	Jira => $jira,
	YouTrack => $yt,
	Url => $JiraUrl,
	JiraLogin => $JiraLogin,
	Passwords => \%JiraPasswords,
	JiraUserIds => \%JiraUserIds,
	RealUsers =>  \%users,
	Users => \%Users,
	TypeFieldName => $typeCustomFieldName,
	Types => \%Type,
	Links => \%IssueLinks,
	ExportCreationTime => $exportCreationTime,
	CreationTimeFieldName => $creationTimeCustomFieldName,
	Fields => \%CustomFields,
	PriorityFieldName => $priorityCustomFieldName,
	Priorities => \%Priority,
	StatusFieldName => $stateCustomFieldName,
	Statuses => \%Status,
	StatusToResolutions => \%StatusToResolution
);

%Users = %{$check->users()};

unless ($notest) {
	$check->passwords();
	$check->issueTypes();
	$check->issueLinks();
	$check->fields();
	$check->priorities();
	$check->statuses();
	$check->resolutions();
}

my $issuesCount = 0;

$display->printTitle("Export To Jira");
print "Ready to import into Jira using options:\n";
print "\tfirst=$first\n";
print "\tskip=$skip\n";
print "\tcheck-keys=$checkKeys\n";
print "\tissueid=$id\n";
print "\tYouTrack Project=$YTProject\n";
print "\tJira Project=$JiraProject\n";

my @sortedIssues = sort { $a->{numberInProject} <=> $b->{numberInProject} } @{$export};

my $length = scalar @{$export};
if ($verbose){
	print "count items export: $length\n";
	%length = scalar keys @sortedIssues;
	print "count items sortedIssues: $length\n";
}

my @firstNIssues;
if (defined $id && $id > 0) {
	$first = $id;
} else {
	my $max_number = $sortedIssues[-1]{numberInProject};
	$first = $max_number if (not defined $first);
}
print "Will process first $first issues\n";

my @firstNIssues = grep { $_->{numberInProject} <= $first } @sortedIssues;
if ($verbose){
	print "Print this list of issues to help with troubleshooting\n";
	foreach my $issue (@firstNIssues) {
		print "Issue ID: " . $issue->{idReadable} . "\tNumber in Project: " . $issue->{numberInProject} . "\n";
	}
	#Issue ID: SA-2		Number in Project: 2
	#Issue ID: SA-3		Number in Project: 3
	#Issue ID: SA-4		Number in Project: 4
	#Issue ID: SA-5		Number in Project: 5
	#Issue ID: SA-6		Number in Project: 6
	#Issue ID: SA-7		Number in Project: 7
	#Issue ID: SA-8		Number in Project: 8
	#Issue ID: SA-9		Number in Project: 9
	#Issue ID: SA-11	Number in Project: 11
	#Issue ID: SA-12	Number in Project: 12
}
&ifProceed;

foreach my $issue (@firstNIssues) {
	$display->printTitle($issue->{idReadable});
	
	if ($skip && $issue->{numberInProject} <= $skip) {
		print "Skipping issue ".$issue->{idReadable}."\n";
		next;
	}
	$issuesCount++;
	last if ($first && $issuesCount > $first);
	print "Will import issue ".$issue->{idReadable}."\n";
	print "Processing issue number $issuesCount\n";
	
	my $attachmentFileNamesMapping;
	my $attachments;

	# Download attachments
	if ($exportAttachments eq 'true') {
		print "Check for attachments\n";
		($attachments, $attachmentFileNamesMapping) = $yt->downloadAttachments(IssueKey => $issue->{id});
		print Dumper(@{$attachments}) if ($verbose);
	}

	# Prepare creation time message if exportCreationTime setting is not set
	my $creationTime = scalar localtime ($issue->{created}/1000);
	my $header = "";
	if (not($exportCreationTime)) {
		$header .= "[Created ";
		if ($Users{$issue->{reporter}->{login}} eq $JiraLogin) { 
			$header .= "by ".$issue->{reporter}->{login}." "; 
		}
		$header .= $creationTime;
		$header .= "]\n";
	}

	# Convert Markdown to Jira-specific rich text formatting
#	my $description = convertUserMentions($issue->{description});
#	$description = convertAttachmentsLinks($description, $attachmentFileNamesMapping);
#	if($convertTextFormatting eq 'true') {	
#		$description = convertCodeSnippets($description);
#		$description = convertQuotations($description);
#		$description = convertMarkdownToJira($description);
#	}
#	$description = removeHtmlTags($description);
	my $description = $issue->{description};
	
	my %import = ( project => { key => $JiraProject },
	               issuetype => { name => $Type{$issue->{$typeCustomFieldName}} || $issue->{$typeCustomFieldName} || 'Task' }, #make Task the default if it's empty
                   assignee => { id => $JiraUserIds{$Users{$issue->{Assignee}} || $issue->{Assignee}} },
                   reporter => { id => $JiraUserIds{$Users{$issue->{reporter}->{login}} || $issue->{reporter}->{login}} },
                   summary => $issue->{summary},
                   description => $description,
                   priority => { name => $Priority{$issue->{Priority}} || $issue->{Priority} || '200' } #TODO: change this to empty string
	);
	# if there is no assignee in YouTrack, then remove the assignee field from the import hash so it's unassigned in Jira
	if(!defined $issue->{Assignee} || $issue->{Assignee} eq '') {
		delete $import{assignee};
	}

	# Let's check through custom fields
	my %custom;
	foreach my $field (keys %CustomFields) {
		if (defined $issue->{$field}) {
			if (defined $Users{$issue->{$field}}) {
				# If the value of the field happens to be a username, assume this is a user field.
				$custom{$CustomFields{$field}} = $JiraUserIds{$User{$issue->{$field}}};
			} else {
				if ($field eq "Fix for") {
					#regex to remove the blank space and anything after. example "0.8 (P8)" -> "0.8"
					$issue->{$field} =~ s/ .*$// if defined $issue->{$field};
				} elsif ($field eq "Impact") {
					# if Impact in YouTrack is empty, then set it to "Not reviewed" in JIRA
					$issue->{$field}->[0] = "Not reviewed" if defined $issue->{$field} and $issue->{$field}->[0] eq '';
				}
				$custom{$CustomFields{$field}} = $issue->{$field};
			}
		}
	}

	# Epic Name special field is required for Jira Epic issues type
	if ($import{issuetype}->{name} == 'Epic') {
		$custom{"Epic Name"} = $issue->{summary};
	}
	
	# Add YouTrack original creation date field	
	my %dateTimeFormats = (
		RFC822 => "%a, %d %b %Y %H:%M:%S %z",
		RFC3389 => "%Y-%m-%dT%H:%M:%S%z",
		ISO8601 => "%Y-%m-%dT%T%z",
		GOST7.0.64 => "%Y%m%dT%H%M%S%z",
		JIRA8601 => "%Y-%m-%dT%T.00%z"
	);
	if ($exportCreationTime eq 'true') {
		my @parsedTime = localtime ($issue->{created}/1000);
		$custom{$creationTimeCustomFieldName} = strftime($dateTimeFormats{"$creationDateTimeFormat"}, @parsedTime);
		print "Setting original creation time to ".$custom{$creationTimeCustomFieldName}."\n";
	}

	# Let's check for labels/tags
	if ($exportTags eq 'true') {
		$msg = "Checking for tags";
		my @tags = $yt->getTags(IssueKey => $issue->{id});
		if (@tags) {
			my @filtered_tags = grep { defined $_ && $_ ne '' } @tags;
			if (@filtered_tags) {
				$msg .= " - setting tags and their values";
				$import{labels} = [@filtered_tags];
				print "Found tags: ".Dumper(@tags) if ($verbose);
			}
			else {
				$msg .= " - no non-null tags found";
			}
		}
		else {
			$msg .= " - no tags found";
		}
		print $msg."\n";
	}
	
	my $key = $jira->createIssue(Issue => \%import, CustomFields => \%custom) || warn "Error while creating issue\n";
	print "Jira issue key generated $key\n";

	# Checking issue number in key (eg in FOO-20 the issue number is 20)
	if ($checkKeys) {
		if ($key =~ /^[A-Z0-9]+-(\d+)$/) {
			while ( $1 < $issue->{numberInProject} && ($issue->{numberInProject} - $1) <= $maximumKeyGap ) {
				print "We're having a gap and will delete the issue\n";
				unless ($jira->deleteIssue(Key => $key)) {
					warn "Error while deleting the issue $key\n";
				}
				$key = $jira->createIssue(Issue => \%import, CustomFields => \%custom) || warn "Error while creating issue\n";
				print "New Jira issue key generated $key\n";
				$key =~ /^[A-Z0-9]+-(\d+)$/;
			}
		} else {
			die "Wrong issue key $key\n";
		}
	}
	
	# Save Jira issue key for further linking
	$issue->{jiraKey} = $key;

	# Transition
	if ($Status{$issue->{State}}) {
		print "Changing status to ".$Status{$issue->{State}}."\n";
		unless ($jira->doTransition(Key => $key, Status => $Status{$issue->{State}})) {
			warn "Failed doing transition\n";
		}
	}

	# Resolution
	if ($StatusToResolution{$issue->{State}}) {
		print "Changing resolution to ".$StatusToResolution{$issue->{State}}."\n";
		unless ($jira->changeFields(Key => $key, Fields => { 'Resolution' => $StatusToResolution{$issue->{State}} } )) {
			warn "Failed updating fields\n"
		}
	}

	# Create comments
	print "Creating comments\n";
	my @sorted_comments = sort { $b->{created} <=> $a->{created} } @{$issue->{comments}};
	foreach my $comment (@sorted_comments) {
		my $login = $comment->{author}->{login};
		my $author = $Users{$login} || $login;
		my $date = scalar localtime ($comment->{created}/1000);

		my $text = $comment->{text};

		# Check if text is ADF format (hash reference) or plain text
		my $isADF = ref($text) eq 'HASH';
		if ( $JiraPasswords{$author} && not $JiraPasswords{$author} eq $JiraPassword ) {
			if (!$isADF) {
				my $header = "[ $date ]\n";
				$text = $header.$text;
			}
			# For ADF, skip header - original timestamp preserved in Jira comment metadata
			my $jiraComment = $jira->createComment(IssueKey => $key, Body => $text, Login => $author, Password => $JiraPasswords{$author}) || warn "Error creating comment\n";
		} else {
			if (!$isADF) {
				my $header = convertUserMentions("[ \@$login $date ]\n");
				$text = $header.$text;
			}else{
				# prepend a header to the ADF document's content array.
				unshift @{$text->{content}}, 
					{
						type => "paragraph",
						content => [
							{ type => "text", text => "[ " },
							{
								type => "text",
								text => "\@".$login,
								marks => [
									{
										type => "link",
										attrs => {
											href => "/jira/people/".$JiraUserIds{$author}
										}
									}
								]
							},
							{ type => "text", text => " $date ]" }
						]
					};
			}
			my $jiraComment = $jira->createComment(IssueKey => $key, Body => $text) || warn "Error creating comment\n";
		}		
	}

	# Export work log
	if ($exportWorkLog eq 'true') {
		print "Exporting work log\n";
		my $workLogs = $yt->getWorkLog( IssueKey => $issue->{idReadable} );
		foreach my $workLog (@{$workLogs->{workItems}}) {
			my @parsedTime = localtime ($workLog->{created}/1000);
			my %jiraWorkLog = (
				comment => $workLog->{text},
				started => strftime($dateTimeFormats{"$creationDateTimeFormat"}, @parsedTime),
				timeSpentSeconds => $workLog->{duration}->{minutes} * 60
			);

			if ( $JiraPasswords{$Users{ $workLog->{author}->{login} }} and not $JiraPasswords{$Users{ $workLog->{author}->{login} }} eq $JiraPassword ) {
				$jira->addWorkLog(Key => $key, 
								WorkLog => \%jiraWorkLog, 
								Login => $Users{ $workLog->{author}->{login} }, 
								Password => $JiraPasswords{$Users{ $workLog->{author}->{login} }}) 
					|| warn "Error creating work log\n";
			} else {
				my $originalAuthor = convertUserMentions("[ Original Author: \@".$workLog->{author}->{login}." ]\n");
				$jiraWorkLog{comment} = $originalAuthor."".$jiraWorkLog{comment};
				$jira->addWorkLog(Key => $key, WorkLog => \%jiraWorkLog) 
					|| warn "Error creating work log\n";
			}			
		}
	}

	# If descriptions exceeds Jira limitations - save it as an attachment
	if (length $header.$description >= 32766) {
		print "Description exceeds Jira max symbol limitation and will be saved as attachment.\n";
		my $tempdir = tempdir();
		open my $fh, ">", "$tempdir/description.md";
		binmode $fh, "encoding(UTF-8)";
		print $fh $issue->{description};
		close $fh;
		push @{$attachments}, "$tempdir/description.md";
	}

	# Upload attachments to Jira
	if (@{$attachments}) {
		print "Uploading ".scalar @{$attachments}." attachments\n";
		unless ($jira->addAttachments(IssueKey => $key, Files => $attachments)) {
			warn "Cannot upload attachment to $key\n";
		}
	}
}

# Create Issue Links
if ($exportLinks eq 'true') {	
	$display->printTitle("Creating Issue Links");
	&ifProceed;

	# Turn YT issues to a hash to be able to search for issue ID
	my %issuesById = map { $_->{id} => $_ } @{$export};
	# Keep linked issues in hash to avoid duplicates on BOTH type of links
	my %alreadyEstablishedLinksWith = map { $_ => () } keys %IssueLinks;

	foreach my $ytIssue (sort { $a->{numberInProject} <=> $b->{numberInProject} } @{$export}) {
		print "Attempting to create links on issue ".$ytIssue->{idReadable}."\n";
		my $ytLinks = $yt->getIssueLinks(IssueKey => $ytIssue->{id});

		foreach my $ytLink (@{$ytLinks}) {
			my $jiraLink;

			# If this link does not have any issues attached - skip to the next one
			if (!@{$ytLink->{issues}}){
				next;
			}

			# Check if config has this issue link type name
		    if (defined $IssueLinks{$ytLink->{linkType}->{name}}) {
        		$jiraLink->{type}->{name} = $IssueLinks{$ytLink->{linkType}->{name}};
    		} else {
        		next;
    		}

			foreach my $ytLinkedIssue (@{$ytLink->{issues}}) {
				if (exists $issuesById{$ytLinkedIssue->{id}}) {
					my $jiraKey = $ytIssue->{jiraKey};
					if (!$jiraKey) {
						# replace "SA" or "ZTP" with Jira project key
						my ($ytProject, $ytId) = split /-/, $ytIssue->{idReadable};
						if ($ytProject eq "SA" || $ytProject eq "ZTP") {
							$ytProject = $JiraProject;
						}
						if ($ytProject eq "ZTP") {
							#increment id
							$ytId = int($ytId);
							$ytId += $JiraIssueIdOffset;
						}
						$jiraKey = $ytProject."-".$ytId;
					}

					my $linkedJiraKey = $issuesById{$ytLinkedIssue->{id}}->{jiraKey};
					if (!$linkedJiraKey) {
						# replace "SA" or "ZTP" with Jira project key
						my ($ytProject, $ytId) = split /-/, $issuesById{$ytLinkedIssue->{id}}->{idReadable};
						if ($ytProject eq "SA" || $ytProject eq "ZTP") {
							$ytProject = $JiraProject;
						}
						if ($ytProject eq "ZTP") {
							#increment id
							$ytId = int($ytId);
							$ytId += $JiraIssueIdOffset;
						}
						$linkedJiraKey = $ytProject."-".$ytId;
					}

					if ($ytLink->{direction} eq 'INWARD' || $ytLink->{direction} eq 'BOTH') {
						$jiraLink->{inwardIssue}->{key} = $jiraKey;
						$jiraLink->{outwardIssue}->{key} = $linkedJiraKey;
					} elsif ($ytLink->{direction} eq 'OUTWARD') {
						$jiraLink->{inwardIssue}->{key} = $linkedJiraKey;
						$jiraLink->{outwardIssue}->{key} = $jiraKey;
					} 

					if (not $alreadyEstablishedLinksWith{$ytLink->{linkType}->{name}}{join(" ", sort($ytLinkedIssue->{id}, $ytIssue->{id}))}) {
						print "Creating link between ".$jiraLink->{outwardIssue}->{key}." and ".$jiraLink->{inwardIssue}->{key}."\n";

						if ($jira->createIssueLink( Link => $jiraLink )) {
							# To avoid link duplications (for BOTH direction type of issue link)
							$alreadyEstablishedLinksWith{$ytLink->{linkType}->{name}}{join(" ", sort($ytLinkedIssue->{id}, $ytIssue->{id}))} = 1;
							print " Done\n";
						} else {
							print " Failed. Most likely the second issue is not migrated yet\n";
						}
					}
				}
			}
		}		
	}
}

$display->printTitle("ENJOY :)");

sub ifProceed {
	print "\nProceed? (y/N) ";
	my $input = <>;
	chomp $input;
	exit unless (lc($input) eq 'y');
}

# Converts Markdown text format to Jira format using J2M utility
sub convertMarkdownToJira {
	my $textToConvert = shift;
	
	my @j2mCommand = ('j2m', '--toJ', '--stdin');
	run(\@j2mCommand, \$textToConvert, \my $j2mConvertedText) 
		or die "Something wrong with J2M tool, is it installed? ".
		"Try install it using:\n\n\tnpm install j2m --save\n\n";
	return decode_utf8($j2mConvertedText);
}

# Converts user mentions to correct usernames 
sub convertUserMentions {
	my $textToConvert = shift;

	# Convert user @foo mentions to Jira [~accountid:$personId] links (doesn't seem to work)
	# $textToConvert =~ s/\B\@(\S+)/\@$1 \[\~acccountid:$JiraUserIds{$User{$1}}\])/g;
	# Convert user @foo mentions to Jira [@foo|/jira/people/$personId] links
	$textToConvert =~ s/\B\@([^\s,]+)/\[\@$1\|\/jira\/people\/$JiraUserIds{$Users{$1}}\]/g;

	return $textToConvert;
}

# Converts links to attachments 
sub convertAttachmentsLinks {
	my $textToConvert = shift;
	my $attachmentFileNamesMapping = shift;

	# Convert attachment ![](image.png) links to Jira links !image.png|thumbnail!
	$textToConvert =~ s/!\[\]\((.+?)\)/"!".%{$attachmentFileNamesMapping}{$1}."|thumbnail!"/eg;

	return $textToConvert;
}

sub convertCodeSnippets {
	my $textToConvert = shift;

	# Convert ``` to {code}
	$textToConvert =~ s/```(\w*)\n/($1 ? "{code:$1}\n" : "{code}\n")/eg;
	$textToConvert =~ s/```/\n{code}\n/g;

	return $textToConvert;
}

sub convertQuotations {
	my $textToConvert = shift;

	# Convert > to {quote}
	$textToConvert =~ s/^> *(.*)/{quote}\n$1\n{quote}/gm;

	return $textToConvert;
}

sub removeHtmlTags {
   my $textToConvert = shift;

   my $div_begin = '[div class="wiki text prewrapped"]';	
   my $div_end = '[/div]';  

   $textToConvert =~ s/\Q$div_begin\E//;
   $textToConvert =~ s/\Q$div_end\E//;

   my $begin_pos = index($textToConvert, '[a');
   my $a = '';

   while($begin_pos != -1) {
      my $end_pos = index($textToConvert, '[/a]');
      $a = substr($textToConvert, $begin_pos, $end_pos-$begin_pos + length('[/a]'));
      $textToConvert =~ s/\Q$a\E//;
      $begin_pos = index($textToConvert, '[a');
   }

   $html_begin = '[/li]';
   $textToConvert =~ s/\Q$html_begin\E//g;
   $html_begin = '[li]';
   $textToConvert =~ s/\Q$html_begin\E//g;
   $html_begin = '[h3]';   
   $textToConvert =~ s/\Q$html_begin\E//g;
   $html_begin = '[/h3]';   
   $textToConvert =~ s/\Q$html_begin\E//g;
   $html_begin = '[ul class="wiki-list0"]';
   $textToConvert =~ s/\Q$html_begin\E//g;
   $html_begin = '[/ul]';
   $textToConvert =~ s/\Q$html_begin\E//g;
   $html_begin = '[strong]';
   $textToConvert =~ s/\Q$html_begin\E//g;
   $html_begin = '[/strong]';
   $textToConvert =~ s/\Q$html_begin\E//g;
   $html_begin = '[div class="wiki quote"]';
   $textToConvert =~ s/\Q$html_begin\E//g;
   $html_begin = '\[br/\]';
   $textToConvert =~ s/$html_begin/\n/g;      

   return $textToConvert;
}
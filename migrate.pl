#!/usr/bin/perl

use File::Basename qw/dirname/;
use File::Temp qw ( tempdir );
use lib dirname(__FILE__);
use display;
use youtrack;
use check;
use jira;
require "config.pl";

use Data::Dumper;
use Getopt::Long;
use IPC::Run qw( run );
use Date::Format;
use Encode;

# Used to display column-like output
my $display = display->new(); 

$display->printTitle("Initialization");

my ($skip, $notest, $maxissues, $cookieFile, $verbose);
Getopt::Long::Configure('bundling');
GetOptions(
    "skip|s=i"      => \$skip,
    "no-test|t"      => \$notest,
    "max-issues|m=i" => \$maxissues,
    "cookie-file|c=s" => \$cookieFile,
    "verbose|v"       => \$verbose
);

my $yt = youtrack->new( Url      => $YTUrl,
                        Token    => $YTtoken,
                        Verbose  => $verbose,
						Project  => $YTProject );

unless ($yt) {
	die "Could not login to $YTUrl";
}

my $jira = jira->new(	Url         => $JiraUrl,
                    	Login       => $JiraLogin,
                      	Password    => $JiraPassword,
                      	Verbose     => $verbose,
                      	Project     => $JiraProject,
		      		 	CookieFile => $cookieFile,
);

unless ($jira) {
    die "Could not login to $JiraUrl\n";
}

print "Success\n";

$display->printTitle("Getting YouTrack Issues");

my $export = $yt->exportIssues(Project => $YTProject, Max => $maxissues);
print "Exported issues: ".scalar @{$export}."\n";

# Find active users from issues, commetns and other YT activity
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
foreach my $configUser (keys %User) {
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
	Users => \%User,
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

%User = %{$check->users()};

unless ($notest) {
	$check->passwords();
	$check->issueTypes();
	$check->issueLinks();
	$check->fields();
	$check->priorities();
	$check->statuses();
	$check->resolutions();

	&ifProceed;
}

my $issuesCount = 0;

$display->printTitle("Export To Jira");

foreach my $issue (sort { $a->{numberInProject} <=> $b->{numberInProject} } @{$export}) {
	$display->printTitle($YTProject."-".$issue->{numberInProject});
	
	if ($skip && $issue->{numberInProject} <= $skip) {
		print "Skipping issue $YTProject-".$issue->{numberInProject}."\n";
		next;
	}
	$issuesCount++;
	last if ($maxissues && $issuesCount>$maxissues);
	
	my $attachmentFileNamesMapping;
	my $attachments;

	# Download attachments
	if ($exportAttachments eq 'true') {
		print "Check for attachments\n";
		($attachments, $attachmentFileNamesMapping) = $yt->downloadAttachments(IssueKey => $issue->{id});
		print Dumper(@{$attachments}) if ($verbose);
	}

	print "Will import issue $YTProject-".$issue->{numberInProject}."\n";

	# Prepare creation time message if exportCreationTime setting is not set
	my $creationTime = scalar localtime ($issue->{created}/1000);
	my $header = "";
	if (not($exportCreationTime)) {
		$header .= "[Created ";
		if ($User{$issue->{reporter}->{login}} eq $JiraLogin) { 
			$header .= "by ".$issue->{reporter}->{login}." "; 
		}
		$header .= $creationTime;
		$header .= "]\n";
	}


	# Convert Markdown to Jira-specific rich text formatting
	my $description = convertUserMentions($issue->{description});
	$description = convertAttachmentsLinks($description, $attachmentFileNamesMapping);

	if($convertTextFormatting eq 'true') {	
		$description = convertCodeSnippets($description);
		$description = convertQuotations($description);
		$description = convertMarkdownToJira($description);
	}
	
	my %import = ( project => { key => $JiraProject },
	               issuetype => { name => $Type{$issue->{$typeCustomFieldName}} || $issue->{$typeCustomFieldName} },
                   assignee => { id => $JiraUserIds{$User{$issue->{Assignee}} || $issue->{Assignee}} },
                   reporter => { id => $JiraUserIds{$User{$issue->{reporter}->{login}} || $issue->{reporter}->{login}} },
                   summary => $issue->{summary},
                   description => $header.$description,
                   priority => { name => $Priority{$issue->{Priority}} || $issue->{Priority} || 'Medium' }
	);

	# Let's check through custom fields
	my %custom;
	foreach my $field (keys %CustomFields) {
		if (defined $issue->{$field}) {
			if (defined $User{$issue->{$field}}) {
				# If the value of the field happens to be a username, assume this is a user field.
				$custom{$CustomFields{$field}} = $JiraUserIds{$User{$issue->{$field}}};
			} else {
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
	}

	# Let's check for labels
	if ($exportTags eq 'true') {
		my @tags = $yt->getTags(IssueKey => $issue->{id});
		if (@tags) {
			$import{labels} = [@tags];
			print "Found tags: ".Dumper(@tags) if ($verbose);
		}
	}
	
	my $key = $jira->createIssue(Issue => \%import, CustomFields => \%custom) || warn "Error while creating issue";
	print "Jira issue key generated $key\n";

	# Checking issue number in key (eg in FOO-20 the issue number is 20)
	if ($key =~ /^[A-Z]+-(\d+)$/) {
		while ( $1 < $issue->{numberInProject} && ($issue->{numberInProject} - $1) <= $maximumKeyGap ) {
			print "We're having a gap and will delete the issue\n";
			unless ($jira->deleteIssue(Key => $key)) {
				warn "Error while deleting the issue $key";
			}
			$key = $jira->createIssue(Issue => \%import, CustomFields => \%custom) || warn "Error while creating issue";
			print "\nNew Jira issue key generated $key\n";
			$key =~ /^[A-Z]+-(\d+)$/;
		}
	} else {
		die "Wrong issue key $key";
	}

	# Save Jira issue key for forther linking
	$issue->{jiraKey} = $key;

	# Transition
	if ($Status{$issue->{State}}) {
		print "\nChanging status to ".$Status{$issue->{State}}."\n";
		unless ($jira->doTransition(Key => $key, Status => $Status{$issue->{State}})) {
			warn "Failed doing transition";
		}
	}

	# Resolution
	if ($StatusToResolution{$issue->{State}}) {
		print "\nChanging resolution to ".$StatusToResolution{$issue->{State}}."\n";
		unless ($jira->changeFields(Key => $key, Fields => { 'Resolution' => $StatusToResolution{$issue->{State}} } )) {
			warn "Failed updating fields"
		}
	}

	# Create comments
	print "\nCreating comments\n";
	foreach my $comment (@{$issue->{comments}}) {
		my $author = $User{$comment->{author}->{login}} || $comment->{author}->{login};
		my $date = scalar localtime ($comment->{created}/1000);

		my $text = $comment->{text};
		
		# Convert Markdown to Jira-specific rich text formatting
		$text = convertUserMentions($text);
		$text = convertAttachmentsLinks($text, $attachmentFileNamesMapping);

		if($convertTextFormatting eq 'true') {
			$text = convertCodeSnippets($text);
			$text = convertQuotations($text);
			$text = convertMarkdownToJira($text);
		}

		my $header;
		if ( $JiraPasswords{$author} && not $JiraPasswords{$author} eq $JiraPassword ) {
			$header = "[ $date ]\n";
			$text = $header.$text;
			my $jiraComment = $jira->createComment(IssueKey => $key, Body => $text, Login => $author, Password => $JiraPasswords{$author}) || warn "Error creating comment";
		} else {
			$header = convertUserMentions("[ \@".$comment->{author}->{login}." $date ]\n");
			$text = $header.$text;
			my $jiraComment = $jira->createComment(IssueKey => $key, Body => $text) || warn "Error creating comment";
		}
	}

	# Export work log
	if ($exportWorkLog eq 'true') {
		print "\nExporting work log\n";
		my $workLogs = $yt->getWorkLog( IssueKey => $issue->{idReadable} );
		foreach my $workLog (@{$workLogs->{workItems}}) {
			my @parsedTime = localtime ($workLog->{created}/1000);
			my %jiraWorkLog = (
				comment => $workLog->{text},
				started => strftime($dateTimeFormats{"$creationDateTimeFormat"}, @parsedTime),
				timeSpentSeconds => $workLog->{duration}->{minutes} * 60
			);

			if ( $JiraPasswords{$User{ $workLog->{author}->{login} }} and not $JiraPasswords{$User{ $workLog->{author}->{login} }} eq $JiraPassword ) {
				$jira->addWorkLog(Key => $key, 
								WorkLog => \%jiraWorkLog, 
								Login => $User{ $workLog->{author}->{login} }, 
								Password => $JiraPasswords{$User{ $workLog->{author}->{login} }}) 
					|| warn "\nError creating work log";
			} else {
				my $originalAuthor = convertUserMentions("[ Original Author: \@".$workLog->{author}->{login}." ]\n");
				$jiraWorkLog{comment} = $originalAuthor."".$jiraWorkLog{comment};
				$jira->addWorkLog(Key => $key, WorkLog => \%jiraWorkLog) 
					|| warn "\nError creating work log";
			}			
		}
	}

	# If descriptions exceeds Jira limitations - save it as an attachment
	if (length $header.$description >= 32766) {
		print "\nDescription exceeds Jira max symbol limitation and will be saved as attachment.\n";
		my $tempdir = tempdir();
		open my $fh, ">", "$tempdir/description.md";
		binmode $fh, "encoding(UTF-8)";
		print $fh $issue->{description};
		close $fh;
		push @{$attachments}, "$tempdir/description.md";
	}

	# Upload attachments to Jira
	if (@{$attachments}) {
		print "Uploading ".scalar @{$attachments}." files\n";
		unless ($jira->addAttachments(IssueKey => $key, Files => $attachments)) {
			warn "Cannot upload attachment to $key";
		}
	}
}

# Create Issue Links
if ($exportLinks eq 'true') {	
	$display->printTitle("Creating Issue Links");
	# Turn YT issues to a hash to be able to search for issue ID
	my %issuesById = map { $_->{id} => $_ } @{$export};
	# Keep linked issues in hash to avoid duplicates on BOTH type of links
	my %alreadyEstablishedLinksWith = map { $_ => () } keys %IssueLinks;

	foreach my $issue (sort { $a->{numberInProject} <=> $b->{numberInProject} } @{$export}) {
		my $links = $yt->getIssueLinks(IssueKey => $issue->{id});

		foreach my $link (@{$links}) {
			my $jiraLink;

			# If this link does not have any issues attached - skip to the next one
			if (!@{$link->{issues}}){
				next;
			}

			# Check if config has this issue link type name
		    if (defined $IssueLinks{$link->{linkType}->{name}}) {
        		$jiraLink->{type}->{name} = $IssueLinks{$link->{linkType}->{name}};
    		} else {
        		next;
    		}

			foreach my $linkedIssue (@{$link->{issues}}) {
				if (exists $issuesById{$linkedIssue->{id}}) {
					if ($link->{direction} eq 'INWARD' || $link->{direction} eq 'BOTH') {
						$jiraLink->{inwardIssue}->{key} = $issue->{jiraKey};
						$jiraLink->{outwardIssue}->{key} = $issuesById{$linkedIssue->{id}}->{jiraKey};
					} elsif ($link->{direction} eq 'OUTWARD') {						
						$jiraLink->{inwardIssue}->{key} = $issuesById{$linkedIssue->{id}}->{jiraKey};
						$jiraLink->{outwardIssue}->{key} = $issue->{jiraKey};
					} 

					if (not $alreadyEstablishedLinksWith{$link->{linkType}->{name}}{join(" ", sort($linkedIssue->{id}, $issue->{id}))}) {
						print "Creating link between ".$jiraLink->{outwardIssue}->{key}." and ".$jiraLink->{inwardIssue}->{key}."\n";

						if ($jira->createIssueLink( Link => $jiraLink )) {
							# To avoid link duplications (for BOTH direction type of issue link)
							$alreadyEstablishedLinksWith{$link->{linkType}->{name}}{join(" ", sort($linkedIssue->{id}, $issue->{id}))} = 1;
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
	$textToConvert =~ s/\B\@([^\s,]+)/\[\@$1\|\/jira\/people\/$JiraUserIds{$User{$1}}\]/g;

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

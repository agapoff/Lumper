#!/usr/bin/perl

use File::Basename qw/dirname/;
use lib dirname(__FILE__);
use youtrack;
use jira;
require "config.pl";

use Data::Dumper;
use Getopt::Long;
use IPC::Run qw( run );
use Date::Format;
use Encode;

my ($skip, $notest, $maxissues, $cookie_file, $debug);
Getopt::Long::Configure('bundling');
GetOptions(
    "skip=i"      => \$skip,
    "notest"      => \$notest,
    "maxissues=i" => \$maxissues,
    "cookie_file=s" => \$cookie_file,
    "debug"       => \$debug
);

my $yt = youtrack->new( Url      => $YTUrl,
                        Token    => $YTtoken,
                        Debug    => $debug );

unless ($yt) {
	die "Could not login to $YTUrl";
}

my $jira = jira->new( Url         => $JiraUrl,
                      Login       => $JiraLogin,
                      Password    => $JiraPassword,
                      Debug       => $debug,
                      Project     => $JiraProject, # Project is optional - it will be used only for getting custom fields
		      cookie_file => $cookie_file,
);

unless ($jira) {
    die "Could not login to $JiraUrl\n";
}

unless ($notest) {
	print "Let's check JiraPasswords\n";
	foreach (sort keys %JiraPasswords) {
		print $_.' ';
		my $j = jira->new( Url => $JiraUrl, Login => $_, Password => $JiraPasswords{$_} );
		if ($j) {
			print "OK\n";
		} else {
			print "\n";
			undef $JiraPasswords{$_};
		}
	}
	&ifProceed;
}

my $export = $yt->exportIssues(Project => $YTProject);
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
print Dumper(%users) if ($debug);
print "Users found in project\n";
foreach (sort keys %users) {
	my $user = $_;
	print $user;
	if ($User{$user}) {
		$user = $User{$user};
		print " -> $user";
	}
	unless ($jira->getUser(User => $user)) {
		print " -> $JiraLogin";
		$User{$_} = $JiraLogin;
	}
	print "\n";
}

# Do you wish to proceed?
&ifProceed;

my $issuesCount = 0;
foreach my $issue (sort { $a->{numberInProject} <=> $b->{numberInProject} } @{$export}) {
	print "\n-----------------------------------------\n";
	if ($skip && $issue->{numberInProject} <= $skip) {
		print "Skipping issue $YTProject-".$issue->{numberInProject}."\n";
		next;
	}
	$issuesCount++;
	last if ($maxissues && $issuesCount>$maxissues);

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
	my $description = convertMentionsAndAttachmentsLinks($issue->{description});
	if($convertTextFormatting eq 'true') {
		$description = convertMarkdownToJira($description);
	}
	
	my %import = ( project => { key => $JiraProject },
	               issuetype => { name => $Type{$issue->{Type}} || $issue->{Type} },
                   assignee => { name => $User{$issue->{Assignee}} || $issue->{Assignee} },
                   reporter => { name => $User{$issue->{reporter}->{login}} || $issue->{reporter}->{login} },
                   summary => $issue->{summary},
                   description => $header.$description,
                   priority => { name => $Priority{$issue->{Priority}} || $issue->{Priority} || 'Medium' }
	);

	# Let's check through custom fields
	my %custom;
	foreach my $field (keys %CustomFields) {
		if (defined $issue->{$field}) {
			$custom{$CustomFields{$field}} = $issue->{$field};
		}
	}
	
	# Add YouTrack original creation date field	
	if ($exportCreationTime eq 'true') {
		my %dateTimeFormats = (
			RFC822 => "%a, %d %b %Y %H:%M:%S %z",
			RFC3389 => "%Y-%m-%dT%H:%M:%S%z",
			ISO8601 => "%Y-%m-%dT%T%z",
			GOST7.0.64 => "%Y%m%dT%H%M%S%z",
			JIRA8601 => "%Y-%m-%dT%T.00%z"
		);
		my @parsedTime = localtime ($issue->{created}/1000);
		$custom{$creationTimeCustomFieldName} = strftime($dateTimeFormats{"$creationDateTimeFormat"}, @parsedTime);
	}

	# Let's check for labels
	if ($exportTags eq 'true') {
		my @tags = $yt->getTags(IssueKey => $issue->{id});
		if (@tags) {
			$import{labels} = [@tags];
			print "Found tags: ".Dumper(@tags) if ($debug);
		}
	}

	my $key = $jira->createIssue(Issue => \%import, CustomFields => \%custom) || die "Error while creating issue";
	print "Created issue $key\n";

	# Checking issue number in key (eg in FOO-20 the issue number is 20)
	if ($key =~ /^[A-Z]+-(\d+)$/) {
		if ( $1 < $issue->{numberInProject} && ($issue->{numberInProject} - $1) <= $maximumKeyGap ) {
			print "We're having a gap and will delete the issue\n";
			unless ($jira->deleteIssue(Key => $key)) {
				die "Error while deleting the issue $key";
			}
			$issuesCount--;
			redo;
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
			die "Failed doing transition";
		}
	}

	# Resolution
	if ($StatusToResolution{$issue->{State}}) {
		print "\nChanging resolution to ".$StatusToResolution{$issue->{State}}."\n";
		unless ($jira->changeFields(Key => $key, Fields => { 'Resolution' => $StatusToResolution{$issue->{State}} } )) {
			die "Failed updating fields"
		}
	}

	# Create comments
	print "\nCreating comments\n";
	foreach (@{$issue->{comments}}) {
		my $author = $User{$_->{author}->{login}} || $_->{author}->{login};
		my $date = scalar localtime ($_->{created}/1000);

		my $text = $_->{text};
		if($convertTextFormatting eq 'true') {
			$text = convertMarkdownToJira($text);
		}

		$text = convertMentionsAndAttachmentsLinks($text);

		my $header;
		if ( $JiraPasswords{$author} ) {
			$header = "[ $date ]\n";
			$text = $header.$text;
			my $comment = $jira->createComment(IssueKey => $key, Body => $text, Login => $author, Password => $JiraPasswords{$author}) || die "Error creating comment";
		} else {
			$header = "[ ".$_->{author}->{login}." $date ]\n";
			$text = $header.$text;
			my $comment = $jira->createComment(IssueKey => $key, Body => $text) || die "Error creating comment";
		}
	}

	# create attachments
	if ($exportAttachments eq 'true') {
		print "Check for attachments\n";
		my $attachments = $yt->downloadAttachments(IssueKey => $issue->{id});
		print Dumper($attachments) if ($debug);

		if (@{$attachments}) {
			print "Uploading ".scalar @{$attachments}." files\n";
			unless ($jira->addAttachments(IssueKey => $key, Files => $attachments)) {
				die "Cannot upload attachment to $key";
			}
		}
	}
}

# Create Issue Links
	if ($exportLinks eq 'true') {
	print "\n------------------ Creating Issue Links ------------------\n";
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

					if (not $alreadyEstablishedLinksWith{$link->{linkType}->{name}}{$linkedIssue->{id}}) {
						print "Creating link between ".$jiraLink->{outwardIssue}->{key}." and ".$jiraLink->{inwardIssue}->{key}."\n";
						
						if ($jira->createIssueLink( Link => $jiraLink )) {
							# To avoid link duplications (for BOTH direction type of issue link)
							$alreadyEstablishedLinksWith{$link->{linkType}->{name}}{$linkedIssue->{id}} = 1;
							$alreadyEstablishedLinksWith{$link->{linkType}->{name}}{$issue->{id}} = 1;
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

# Converts user mentions to correct usernames and links to attachments 
sub convertMentionsAndAttachmentsLinks {
	my $textToConvert = shift;

	# Convert attachment ![](image.png) links to Jira links !image.png|thumbnail!
	$textToConvert =~ s/!\[\]\((.+)\)/!$1|thumbnail!/g;
	# Convert user @foo mentions to Jira [~foo] links
	$textToConvert =~ s/\B\@(\S+)/\[\~$User{$1}\]/g;

	return $textToConvert;
}

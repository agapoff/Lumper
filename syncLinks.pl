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
	"skip|s=i" => \$skip,
	"no-test|t" => \$notest,
	"max-issues|m=i" => \$maxissues,
	"cookie-file|c=s" => \$cookieFile,
	"verbose|v" => \$verbose
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
my $issuesCount = scalar @{$export};
print "Exported issues: $issuesCount\n";

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

# Just check the issueLinks
unless ($notest) {
	$check->issueLinks();
}
$display->printTitle("Getting Jira Issues");
$allIssues = $jira->getAllIssues(Project => $JiraProject, Max => $issuesCount);
my $jiraCount = scalar @{$allIssues->{'issues'}};
my $jiraCount2 = $allIssues->{'total'};
print "Exported issues: $jiraCount out of $jiraCount2\n";
my $jiraIssues = {};
foreach my $jira (@{$allIssues->{'issues'}}) {
	$jiraIssues->{$jira->{key}} = $jira;
}

# Check that the issue numbers line up
$display->printTitle("Checking issue names");

foreach my $issue (sort { $a->{numberInProject} <=> $b->{numberInProject} } @{$export}) {
	#$display->printTitle($YTProject."-".$issue->{numberInProject});
	my $jiraIssue = $jiraIssues->{$JiraProject."-".$issue->{numberInProject}};
	my $ok = ($issue->{summary} eq $jiraIssue->{fields}->{summary}) ? "OK" : "NOT ok";
	$issue->{jiraKey} = $jiraIssue->{key} or $JiraProject."-".$issue->{numberInProject};
	check::printRelation(
		$YTProject."-".$issue->{numberInProject}." ".$issue->{summary},
		$jiraIssue->{key}." ".$jiraIssue->{fields}->{summary},
		$ok
	);
}

&ifProceed;

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

$display->printTitle("ENJOY :)");

sub ifProceed {
	print "\nProceed? (y/N) ";
	my $input = <>;
	chomp $input;
	exit unless (lc($input) eq 'y');
}

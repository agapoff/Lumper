
package check;

use strict;
use warnings;
use Data::Dumper;

use display;
use jira;
use youtrack;

my $display;
my $jira;
my $yt;
my $meta;
my %allYtCustomFields;

sub new {
    my ($class, %args) = @_;
    
    $jira = $args{Jira};
    $yt = $args{YouTrack};
    $display = display->new();

    # Get metadata that containes information about project (ed. Custom Fields, Statuses etc.)
    $meta = $jira->getMeta();
    %allYtCustomFields = $yt->getAllCustomFields();

    return bless { %args }, $class;
}

our sub passwords {
    my $self = shift;

    my %JiraPasswords = %{$self->{Passwords}};
    my $JiraUrl = $self->{Url};

	$display->printTitle("Checking Passwords");

	foreach (sort keys %JiraPasswords) {
		$display->printColumnAligned($_);
		$display->printColumnAligned("");
		my $j = jira->new( Url => $JiraUrl, Login => $_, Password => $JiraPasswords{$_} );
		if ($j) {
			$display->printColumnAligned("Logged In");
		} else {
			$display->printColumnAligned("Error");
			undef $JiraPasswords{$_};
		}
		print "\n";
	}
}

our sub users {
    my $self = shift;

    my %users = %{$self->{RealUsers}};
    my %User = %{$self->{Users}};
    my %JiraUserIds = %{$self->{JiraUserIds}};
    my $JiraLogin = $self->{JiraLogin};

    $display->printTitle("User Mapping");

    foreach (sort keys %users) {
		my $user = $_;
		my $jiraUser = $_;
		my $status = "OK";

		if ($User{$user}) {
		    $jiraUser = $User{$user};
		}
		my $jiraId = $JiraUserIds{$jiraUser};
		unless ($jiraId) {
			$status = "Missing Jira ID";
			delete $User{$user};
			$jiraUser = $JiraLogin;
		} else {
			my $gottenUser = $jira->getUser(Id => $jiraId);
			unless ($gottenUser) {
				$status = "User not found";
				delete $User{$user};
				$jiraUser = $JiraLogin;
			} else {
				unless ($gottenUser->{emailAddress} eq $jiraUser) {
					$status = "mismatching email";
				}
			}
		}
		printRel2($user, $jiraUser, $JiraUserIds{$jiraUser}, $status);
    }

    return \%User;
}

our sub issueTypes {
    my $self = shift;

    my %Type = %{$self->{Types}};
    my $typeCustomFieldName = $self->{TypeFieldName};

    $display->printTitle("Issue Type Mapping");

    my %ytDefinedIssueTypes = map {$_ => 1}  @{$allYtCustomFields{$typeCustomFieldName}};
    my %jiraDefinedIssueTypes = %{$meta->{fields}};

    die "Cannot retrieve issue types. Probably YouTrack issue type field '$typeCustomFieldName' does not exists" 
        unless %ytDefinedIssueTypes;

    foreach my $ytIssueType (sort keys %Type) {	
        die "\nIssue type '".$ytIssueType."' is present in config file but does ".
        "not exists in YouTrack. Please check config file and correct Type mapping.\n"
            unless (defined $ytDefinedIssueTypes{$ytIssueType});
    }
    foreach my $ytIssueType (sort keys %ytDefinedIssueTypes) {		
        die "\nYouTrack has an issue type '$ytIssueType' but there's no such ".
        "mapping in config file. Please check config file and correct Type mapping.\n"
            unless (defined $Type{$ytIssueType});
        die "\nYouTrack issue type '$ytIssueType' is mapped to '".$Type{$ytIssueType}."' but ".
        "there's no such issue type in Jira. Please check config file and correct Type mapping.\n"
            unless (defined $jiraDefinedIssueTypes{$Type{$ytIssueType}});

        printRelation($ytIssueType, $Type{$ytIssueType});
    }
}

our sub issueLinks {
    my $self = shift;

    my %IssueLinks = %{$self->{Links}};

    $display->printTitle("Issue Links Mapping");

    my %ytDefinedIssueLinkTypes = map { $_->{name} => 1 } @{$yt->getAllLinkTypes()};
    my %jiraDefinedIssueLinkTypes = map { $_->{name} => 1 } @{$jira->getAllLinkTypes()};

    foreach my $ytIssueLinkType (sort keys %IssueLinks) {	
        die "\nIssue link '".$ytIssueLinkType."' is present in config file but does ".
        "not exists in YouTrack. Please check config file and correct Type mapping.\n"
            unless (defined $ytDefinedIssueLinkTypes{$ytIssueLinkType});
    }
    foreach my $issueLinkType (sort keys %ytDefinedIssueLinkTypes) {	
        die "\nYouTrack has an issue link '$issueLinkType' but there's no such ".
        "mapping in config file. Please check config file and correct IssueLinks mapping.\n"
            unless (defined $IssueLinks{$issueLinkType});
        die "\nYouTrack issue link '$issueLinkType' is mapped to '".$IssueLinks{$issueLinkType}."' but ".
        "there's no such issue type in Jira. Please check config file and correct IssueLinks mapping.\n"
            unless (defined $jiraDefinedIssueLinkTypes{$IssueLinks{$issueLinkType}});

        printRelation($issueLinkType, $IssueLinks{$issueLinkType});
    }
}

our sub fields {
    my $self = shift;

    my %CustomFields = %{$self->{Fields}};
    my $creationTimeCustomFieldName = $self->{CreationTimeFieldName};
    my $exportCreationTime = $self->{ExportCreationTime};

    $display->printTitle("Field Mapping");

    my %ytDefinedFields = %allYtCustomFields;
    my %jiraDefinedFields = %{$meta->{fields}};

    # Check mandatory fields first
    if ($exportCreationTime eq 'true') {
        foreach my $jiraIssue (keys %jiraDefinedFields) {
            die "\nThe mandatory field named '$creationTimeCustomFieldName' is absent ".
            "in Jira issue type '$jiraIssue'. ".
            "Please ensure that you've created custom field '$creationTimeCustomFieldName' and ".
            "assigned it to '$jiraIssue' type of a issue." 
                unless (defined $jiraDefinedFields{$jiraIssue}->{$creationTimeCustomFieldName});
        }
    }
    # Check all other fields
    foreach my $field (sort keys %CustomFields) {	
        die "\nThe field '".$field."' is present in config file but does ".
        "not exists in YouTrack. Please check config file and correct CustomFields mapping.\n"
            unless (defined $ytDefinedFields{$field});
        foreach my $jiraIssue (keys %jiraDefinedFields) {
            die "\nYouTrack field named '$field' is mapped to '".$CustomFields{$field}.
            "' and it is absent in Jira issue type '$jiraIssue'. ".
            "Please ensure that you've created custom field '".$CustomFields{$field}."' and ".
            "assigned it to '$jiraIssue' type of a issue." 
                unless (defined $jiraDefinedFields{$jiraIssue}->{$CustomFields{$field}});
        }

        printRelation($field, $CustomFields{$field});
    }
}

our sub priorities {
    my $self = shift;

    my %Priority = %{$self->{Priorities}};
    my $priorityCustomFieldName = $self->{PriorityFieldName};
    
    $display->printTitle("Priority Mapping");

    my %jiraDefinedPriorities = map { $_->{name} => 1} @{$jira->getAllPriorities()};
    my %ytDefinedPriorities = map { $_ => 1} @{$allYtCustomFields{$priorityCustomFieldName}};

    # Priority field must present in YouTrack
    die "Cannot retrieve priorities. Probably YouTrack field '$priorityCustomFieldName' does not exists" 
        unless %ytDefinedPriorities;

    # All priorities must be defined in config file 
    foreach my $priority (sort keys %Priority) {	
        die "\nPriority '".$priority."' is present in config file but does ".
        "not exists in YouTrack. Please check config file and correct Priority mapping.\n"
            unless (defined $ytDefinedPriorities{$priority});
    }
    # Now compare priorities with Jira
    foreach my $priority (sort keys %ytDefinedPriorities) {
        die "\nYouTrack has an priority '$priority' but there's no such ".
        "mapping in config file. Please check config file and correct Priority mapping.\n"
            unless (defined $Priority{$priority});
        die "\nYouTrack priority '$priority' is mapped to '".$Priority{$priority}."' but ".
        "there's no such priority in Jira. Please check config file and correct Priority mapping.\n"
            unless (defined $jiraDefinedPriorities{$Priority{$priority}});

        printRelation($priority, $Priority{$priority});
    }
}

our sub statuses {
    my $self = shift;

    my %Status = %{$self->{Statuses}};
    my %StatusToResolution = %{$self->{StatusToResolutions}};
    my $stateCustomFieldName = $self->{StatusFieldName};
    
    $display->printTitle("Status Mapping");

    my %ytDefinedStatuses = map { $_ => 1 } @{$allYtCustomFields{$stateCustomFieldName}};
    my %jiraDefinedStatuses = map { $_->{name} => 1 } @{$jira->getAllStatuses()};
    my %jiraDefinedResolutions = map { $_->{name} => 1 } @{ $jira->getAllResolutions() };

    unless (%jiraDefinedStatuses) {
        print "To check statuses you need to have at least one issue in your Jira ".
                "to be able to check possible statuses. Please make sure all statuses ".
                "are applicable from any other statuses!\n";
        return;
    }

    # Status field must present in both Jira and YouTrack
    die "Cannot retrieve statuses. Probably YouTrack field '$stateCustomFieldName' does not exists" 
        unless %ytDefinedStatuses;
        
    # All statuses must be defined in config file 
    foreach my $state (sort keys %Status) {	
        die "\nStatus '".$state."' is present in config file but does ".
        "not exists in YouTrack. Please check config file and correct Status mapping.\n"
            unless (defined $ytDefinedStatuses{$state});
    }
    
    # Now compare statuses with Jira
    foreach my $state (sort keys %ytDefinedStatuses) {
        die "\nYouTrack has a status '$state' but there's no such ".
        "mapping in config file. Please check config file and correct Status or Resolution mapping.\n"
            unless (defined $Status{$state} or defined $StatusToResolution{$state});
        die "\nYouTrack status '$state' is mapped to '".($Status{$state} or $StatusToResolution{$state})."' but ".
        "there's no such state/resolution in Jira. Please check config file and ".
        "correct Status or Resolution mapping.\n"
            unless (defined $jiraDefinedStatuses{$Status{$state}} or 
                    defined $jiraDefinedResolutions{$StatusToResolution{$state}});

        printRelation($state, $Status{$state});
    } 
}

our sub resolutions {
    my $self = shift;

    my %StatusToResolution = %{$self->{StatusToResolutions}};
    my $stateCustomFieldName = $self->{StatusFieldName};
        
    $display->printTitle("Status To Resolution Mapping");
    
    my %jiraDefinedResolutions = map { $_->{name} => 1 } @{ $jira->getAllResolutions() };
    my %ytDefinedStatuses = map { $_ => 1 } @{$allYtCustomFields{$stateCustomFieldName}};
    my %ytDefinedResolutions = map { $_ => 1 } grep { $StatusToResolution{$_} } keys %ytDefinedStatuses;

    # Check status existance
    foreach my $resolution (sort keys %StatusToResolution) {	
        die "\nStatus '".$resolution."' is present in config file but does ".
        "not exists in YouTrack. Please check config file and correct Resolution mapping.\n"
            unless (defined $ytDefinedResolutions{$resolution});
    }

    foreach my $resolution (sort keys %ytDefinedResolutions)  {
        die "\nYouTrack status '$resolution' is mapped to '".($StatusToResolution{$resolution})."'".
        " resolution, but there's no such resolution in Jira. Please check config file and ".
        "correct Resolution mapping.\n"
            unless (defined $jiraDefinedResolutions{$StatusToResolution{$resolution}});

        printRelation($resolution, $StatusToResolution{$resolution});
    }
}

sub printRelation {
    my $relative = shift;
    my $related = shift;
    my $status = shift;

    $display->printColumnWidth($relative, 4);
    $display->printColumnWidth("  ->", 1);
    $display->printColumnWidth($related, 5);
    $display->printColumnWidth(($status or "OK"), 2);
    print "\n";
}
sub printRel2 {
    my $relative = shift;
    my $related = shift;
    my $related2 = shift;
    my $status = shift;

    $display->printColumnWidth($relative, 3);
    $display->printColumnWidth("  ->", 1);
    $display->printColumnWidth($related, 3);
    $display->printColumnWidth($related2, 2);
    $display->printColumnWidth(($status or "OK"), 2);
    print "\n";
}

1;

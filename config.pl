# YouTrack Url and permanent token from Profile -> Account Security -> Tokens
our $YTUrl='https://got-youtrack.agi.appgate.com';
# Url and credentials to access Jira
our $JiraUrl='https://appgateinc.atlassian.net';

# The project ID to migrate from (eg FOO, BAR)
our $YTProject='SA';
# The project ID to migrate to (eg FOO, BAR)
our $JiraProject='Z121';

# Export tags from YT and import them as labels in Jira
our $exportTags='true';
# This is quite obvious
our $exportAttachments='true';
our $exportLinks='true';
our $exportWorkLog='true';
# Creation date and time will be exported in Original Creation Time field
our $exportCreationTime='true';
# You can change the name of the creation date field if you want to :)
our $creationTimeCustomFieldName='Original Creation Date';
# Jira can be configured to use diffrerent time formats. Recommended is ISO8601.
# Currently there's a bug https://jira.atlassian.com/browse/JRACLOUD-61378
# Jira is not able to parse exact ISO8601 format (see the link for details)
# If you having issues with date time parsing use JIRA8601 date time format
# Possible values here: ISO8601, RFC3389, RFC822, GOST7064, JIRA8601
our $creationDateTimeFormat='ISO8601';
# YouTrack is using regular markdown language to create rich text formatting 
# (__bold text__, _italic_, headers etc). Jira is different - it supports some 
# specific rich text formatting language. 
# If you set this to true, then you'll need to install J2M utility. See README.md file for more info.
our $convertTextFormatting='true';

# In YouTrack the Issue Type, Priority and State are stored as custom fields 
# with enum type of values by default. If you did change any of those field names, 
# please type it here
our $typeCustomFieldName="Type";
our $priorityCustomFieldName="Priority";
our $stateCustomFieldName="State";

# Lumper will keep the issue keys identical in YT and Jira if YT has no gaps larger than this value
our $maximumKeyGap=100;

# Issue type mapping
our %Type = (
	'Task' => 'Task',
	'Bug' => 'Bug',
	'Sanitation' => 'Sanitation',
	'Support Case' => 'Support Case',
	'Story' => 'Story',
	'Epic' => 'Epic',
	'Security' => 'Security',
	'Documentation' => 'Documentation',
	'Feature Request' => 'Feature Request'
);

# Issue priority mapping
our %Priority = (
	'100' => '100',
	'200' => '200',
	'300' => '300',
	'400' => '400',
	'500' => '500',
);

# Issue status mapping
# By default the Status will remain Opened
# From Jira side there should be Transitions (not Statuses) and all Transitions should be available from the initial state
our %Status = (
	"Backlog" => "Backlog",
	"4 Weeks" => "4 Weeks",
	"2 Weeks" => "2 Weeks",
	"Open" => "Open",
	"In Progress" => "In Progress",
	"Open Pull Request" => "Open Pull Request",
	"Merged & Testing" => "Merged & Testing",
	"Verifying" => "Verifying",
	"Verified" => "Verified",
	"Obsolete" => "Obsolete",
	"Duplicate" => "Duplicate",
	"Won't Fix" => "Won't Fix",
	"More Info required" => "More Info required"
);

# Some statuses in YT can be mapped to Resolutions in Jira
# In order to use this feature a field Resolution should be added to screens (and removed after the migration if not needed)
our %StatusToResolution = (
	"Verified" => "Fixed",
	"Won't Fix" => "Won't Fix",
	"Duplicate" => "Duplicate",
	"Obsolete" => "Invalid"
);

# Custom fields mapping
our %CustomFields = (
	"Team" => "ZTNA Team",
	"Subsystem" => "ZTNA Subsystem",
	"Impact" => "ZTNA Impact",
	"Fix for" => "Fix versions",
	"Release note" => "Release note",
	"Estimate" => "Story points",
	"Original Estimate" => "Original estimate",
	"Sprint" => "Sprint"
);

# Issue link types mapping
our %IssueLinks = (
	"Relates" => "Relates",
	#"Is required for" => "blocks",
	"Depend" => "Dependency",
	#"Is duplicated by" => "Relates",
	"Duplicate" => "Duplicate",
	#"Parent for" => "",
	#"Subtask" => ""
);

# User mapping. By default the username stays the same
our %User = (
	'peter.dalbenzio' => 'peter.dalbenzio@appgate.com'
);

# This hash is used to comply with Jira's improved user privacy API.
our %JiraUserIds = (
    'peter.dalbenzio@appgate.com' => "712020:88025364-2a3c-4c70-8940-138ad451181c",
);

our $ztnaBoardName = "ZTNA Board";
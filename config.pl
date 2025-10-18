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


opswat
observability & monitoring for ztp platform; building and maintaining. following devops aproach to push code 
own all ztp
get more controllers to get on ztp



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
	"Sprint" => "Sprint",
	"Craft link" => "Craft link"
);

# Issue link types mapping
our %IssueLinks = (
	"Relates" => "Relates",
	#"Is required for" => "blocks",
	"Depend" => "Dependency",
	#"Is duplicated by" => "Relates",
	"Duplicate" => "Duplicate"
	#"Parent for" => "",
	#"Subtask" => ""
);

# User mapping. By default the username stays the same
our %User = (
	'anders.hansson' => 'anders.hansson@cryptzone.com',
	'daniel.samuelsson' => 'daniel.samuelsson@cryptzone.com',
	'harish.dinne' => 'harish.dinne@cyxtera.com',
	'gokhan.berberoglu' => 'gokhan.berberoglu@appgate.com',
	'shehab.kazi' => 'shehab.kazi@cryptzone.com',
	'peter.larsson' => 'peter.larsson@cryptzone.com',
	'per.allansson' => 'per.allansson@appgate.com',
	'tom.weber' => 'tom.weber@cryptzone.com',
	'teoman.soygul' => 'teoman.soygul@appgate.com',
	'natan.abolafya' => 'natan.abolafya@appgate.com',
	'kasper.gustavsson' => 'kasper.gustavsson@appgate.com',
	'behrooz.aghakhanian' => 'behrooz.aghakhanian@cryptzone.com',
	'thomas.cellerier' => 'thomas.cellerier@appgate.com',
	'atg' => 'anders.thyberg@cryptzone.com',
	'jamie.bodley-scott' => 'jamie.bodley-scott@appgate.com',
	'malc' => 'malcolm.hamilton@cryptzone.com',
	'hadi.misagh' => 'hadi.misagh@cryptzone.com',
	'hakan.saxmo' => 'hakan.saxmo@cryptzone.com',
	'jonas' => 'jonas.ringh@cryptzone.com',
	'payal.sharma' => '-',
	'Reggie.Horne' => 'Reggie.Horne@cryptzone.com',
	'gary.tullier' => 'Gary.Tullier@cryptzone.com',
	'peter.chan' => 'peter.chan@cryptzone.com',
	'kurt.glazemakers' => 'kurt.glazemakers@appgate.com',
	'magnus.arnevall' => 'magnus.arnevall@cryptzone.com',
	'kos' => 'kos@cryptzone.com',
	'anders.larsson' => 'anders.larsson@cryptzone.com',
	'pravin.karthick' => 'pravin.karthick@cryptzone.com',
	'kosmas.valianos' => 'kosmas.valianos@appgate.com',
	'mikael.harsjo' => 'mikael.harsjo@appgate.com',
	'petter.gustafsson' => 'petter.gustafsson@appgate.com',
	'andrea.fantini' => 'andrea.fantini@appgate.com',
	'vincent.bryant' => 'vincent.bryant@cryptzone.com',
	'adolfo.perez' => 'adolfo.perez@appgate.com',
	'angel.chaviano' => 'angel.chaviano@appgate.com',
	'masaya.ando' => 'masaya.ando@appgate.com',
	'greg.shields' => 'greg.shields@appgate.com',
	'srikesh.ajaykumar' => 'srikesh.ajaykumar@appgate.com',
	'miguel.martelo' => 'miguel.martelo@appgate.com',
	'peter.dalbenzio' => 'peter.dalbenzio@appgate.com',
	'jeremy.allen' => 'jeremy.allen@appgate.com',
	'daniel.bailey' => 'daniel.bailey@appgate.com',
	'wenlson.tassemo' => 'wenlson.tassemo@appgate.com',
	'lauren.farley' => 'lauren.farley@appgate.com',
	'christoffer.karlsson' => 'christoffer.karlsson@appgate.com',
	'roxana.zaricor' => 'roxana.zaricor@appgate.com',
	'kevin.spencer' => 'kevin.spencer@appgate.com',
	'wayne.geils' => 'wayne.geils@appgate.com',
	'jitendra.neelam' => 'jitendra.neelam@appgate.com',
	'thomas.cacaj' => 'thomas.cacaj@appgate.com',
	'henry.drefeldt' => 'henry.drefeldt@appgate.com',
	'svcsdpdevyoutrack' => '-',
	'tarik.jebbour' => 'tarik.jebbour@appgate.com',
	'reynaldo.gonzalez' => 'reynaldo.gonzalez@appgate.com',
	'indy.thompson' => 'indy.thompson@appgate.com',
	'daniel.fields' => 'daniel.fields@appgate.com',
	'ian.izaguirre' => 'ian.izaguirre@appgate.com',
	'parth.mehta' => 'parth.mehta@appgate.com',
	'adarsh.anand' => 'adarsh.anand@appgate.com',
	'richard.knupfer' => 'richard.knupfer@appgate.com',
	'aaron.case' => 'aaron.case@appgate.com',
	'keath.milligan' => 'keath.milligan@appgate.com',
	'praveen.vanga' => 'praveen.vanga@appgate.com',
	'roman.sorin' => 'roman.sorin@appgate.com',
	'hector.santiago' => 'hector.santiago@appgate.com',
	'fernando.salcedo' => 'fernando.salcedo@appgate.com',
	'wayne.marsh' => 'wayne.marsh@appgate.com',
	'rasmus.sjostrom' => 'rasmus.sjostrom@appgate.com',
	'wictoria.drefeldt' => 'wictoria.drefeldt@appgate.com',
	'freddy.ayuso-henson' => 'freddy.ayuso-henson@appgate.com',
	'donya.teimouri' => 'donya.teimouri@appgate.com',
	'david.kennedy.mxve' => 'david.kennedy@appgate.com',
	'raven.creighton' => 'raven.creighton@appgate.com',
	'vuthy.lay' => 'vuthy.lay@appgate.com',
	'mihajlo.ivanic' => 'mihajlo.ivanic@appgate.com',
	'elvir.bajric' => 'elvir.bajric@appgate.com',
	'viola.sorgato' => 'viola.sorgato@appgate.com',
	'rafael.soto' => 'rafael.soto@appgate.com',
	'aaron.palermo' => 'aaron.palermo@appgate.com',
	'gernot.hacker.wttc' => 'gernot.hacker@appgate.com',
	'LocalAdmin' => 'agit@appgate.com',
	'amanda.hansson' => 'amanda.hansson@appgate.com',
	'ricardo.elena' => 'ricardo.elena@appgate.com',
	'andrew.martin' => 'andrew.martin@appgate.com',
	'kevin.cavanaugh' => 'kevin.cavanaugh@appgate.com',
	'colby.dyess' => 'colby.dyess@appgate.com',
	'donnie.kaelin.1' => 'donnie.kaelin@appgate.com',
	'abraham.french' => 'abraham.french@appgate.com',
	'andre.garrigo' => 'andre.garrigo@appgate.com',
	'torger.miller' => 'torger.miller@appgate.com',
	'stephanie.hallberg' => 'stephanie.hallberg@appgate.com',
	'brian.odonnell' => 'brian.odonnell@appgate.com',
	'filip.dalvag' => 'filip.dalvag@appgate.com',
	'lars.kajes' => 'lars.kajes@appgate.com',
	'jorge.valencia' => 'jorge.valencia@appgate.com',
	'miguel.turner' => 'miguel.turner@appgate.com',
	'david.butler' => 'david.butler@appgate.com',
	'christopher.cox' => 'christopher.cox@appgate.com',
	'noland.seigler' => 'noland.seigler@appgate.com',
	'petter.hancock' => 'petter.hancock@appgate.com',
	'joachim.pedersen' => 'joachim.pedersen@appgate.com',
	'michael.levy' => 'michael.levy@appgate.com',
	'dori.amara' => 'dori.amara@appgate.com',
	'joel.dollarhide' => 'joel.dollarhide@appgate.com',
	'margaret.antone' => 'margaret.antone@appgate.com',
	'v-jefferson.moronta' => 'v-jefferson.moronta@appgate.com',
	'david.frogley' => 'david.frogley@appgate.com',
	'nitin.pillai' => 'nitin.pillai@appgate.com',
	'clifton.jackman' => '-',
	'niko.pietikainen' => 'niko.pietikainen@appgate.com',
	'antonio.villa' => 'antonio.villa@appgate.com',
	'herve.trutt' => 'herve.trutt@appgate.com',
	'selina.engberg' => 'selina.engberg@appgate.com',
	'eva.fireborn' => 'eva.fireborn@appgate.com',
	'oskar.dahlberg' => 'oskar.dahlberg@appgate.com',
	'mark.haase' => 'mark.haase@appgate.com',
	'max.wedenmark' => 'max.wedenmark@appgate.com',
	'samuel.crisanto' => 'samuel.crisanto@appgate.com'
);

# This hash is used to comply with Jira's improved user privacy API.
our %JiraUserIds = (
    'peter.dalbenzio@appgate.com' => '712020:88025364-2a3c-4c70-8940-138ad451181c',
	'rafael.soto@appgate.com' => '712020:888c0b13-914d-4cb1-afee-a7c186c26581',
	'edwin.ramirez@appgate.com' => '',
	'masaya.ando@appgate.com' => '712020:99d5c0bd-0e59-4b7d-a567-3be3274c30f8',
	'gokhan.berberoglu@appgate.com' => '',
	'per.leino@appgate.com' => '712020:c886d073-6cac-40be-af7d-bdf7025fbe56',
	'daniel.bailey@appgate.com' => '712020:9049c7d8-d374-4431-828f-becb505af54f'
);

our $ztnaBoardName = "ZTNA Board";
# YouTrack Url and permanent token from Profile -> Account Security -> Tokens
our $YTUrl='https://got-youtrack.agi.appgate.com';
# Url and credentials to access Jira
our $JiraUrl='https://appgateinc.atlassian.net';

# The project ID to migrate from (eg FOO, BAR)
our $YTProject='SA';
# The project ID to migrate to (eg FOO, BAR)
our $JiraProject='ZT28';

# When migrating ZTP after SA, use this as the offset between YouTRack ZTP project IDs and Jira issue IDs
our $JiraIssueIdOffset=0;

# Export tags from YT and import them as labels in Jira
our $exportTags='true';
# This is quite obvious
our $exportAttachments='true';
our $exportLinks='true';
our $exportWorkLog='false';
# Creation date and time will be exported in Original Creation Time field
our $exportCreationTime='true';
# You can change the name of the creation date field if you want to :)
#our $creationTimeCustomFieldName='Original Creation Date';
our $creationTimeCustomFieldName='customfield_11084';
# Jira can be configured to use diffrerent time formats. Recommended is ISO8601.
# Currently there's a bug https://jira.atlassian.com/browse/JRACLOUD-61378
# Jira is not able to parse exact ISO8601 format (see the link for details)
# If you having issues with date time parsing use JIRA8601 date time format
# Possible values here: ISO8601, RFC3389, RFC822, GOST7064, JIRA8601
our $creationDateTimeFormat='JIRA8601';
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
	"Verified" => "Done",
	"Won't Fix" => "Done",
	"Duplicate" => "Done",
	"Obsolete" => "Done"
);

# Custom fields mapping
our %CustomFields = (
	"Team" => "ZTNA Team",
	"Subsystem" => "ZTNA Subsystem",
	"Impact" => "ZTNA Impact",
	"Fix for" => "Fix versions",
	"Release note" => "Release note",
	"Estimate" => "Story Points",
	"Original Estimate" => "Original estimate",
	"Sprint" => "Sprint",
	"Craft link" => "Craft link"
);

# Issue link types mapping
# this are the NAMES of the Issue Links; not the directions (inward/outward)
our %IssueLinks = (
	"Relates" => "Relates",
	#"Is required for" => "blocks",
	"Depend" => "Dependency",
	#"Is duplicated by" => "Relates",
	"Duplicate" => "Duplicate",
	#"Parent for" => "",
	"Subtask" => "parent for"
);

# User mapping. By default the username stays the same
our %Users = (
	'aaron.case' => 'aaron.case@appgate.com',
	'aaron.palermo' => 'aaron.palermo@appgate.com',
	'abraham.french' => 'abraham.french@appgate.com',
	'adam.rose' => 'adam.rose@appgate.com',
	'adarsh.anand' => 'adarsh.anand@appgate.com',
	'adolfo.perez' => 'adolfo.perez@appgate.com',
	'aitor.iturri' => 'aitor.iturri@appgate.com',
	'amanda.hansson' => 'amanda.hansson@appgate.com',
	'anders.hansson' => 'anders.hansson@cryptzone.com',
	'anders.larsson' => 'anders.larsson@cryptzone.com',
	'andre.garrigo' => 'andre.garrigo@appgate.com',
	'andrea.fantini' => 'andrea.fantini@appgate.com',
	'andrew.martin' => 'andrew.martin@appgate.com',
	'andy.lalaguna' => 'andy.lalaguna@cryptzone.com',
	'angel.chaviano' => 'angel.chaviano@appgate.com',
	'anton.lundgren' => 'anton.lundgren@appgate.com',
	'antonio.villa' => 'antonio.villa@appgate.com',
	'arturo.garcia' => 'arturo.garcia@appgate.com',
	'atg' => 'anders.thyberg@cryptzone.com',
	'behrooz.aghakhanian' => 'behrooz.aghakhanian@cryptzone.com',
	'brian.odonnell' => 'brian.odonnell@appgate.com',
	'calle.sandberg' => 'calle.sandberg@cryptzone.com',
	'carina.olsson' => 'carina.olsson@appgate.com',
	'carl.bergevald' => 'carl.bergevald@cryptzone.com',
	'cheryl.shea' => 'cheryl.shea@cryptzone.com',
	'chris.kearns' => 'chris.kearns@appgate.com',
	'christoffer.karlsson' => 'christoffer.karlsson@appgate.com',
	'christopher.cox' => 'christopher.cox@appgate.com',
	'christopher.scheels' => 'christopher.scheels@appgate.com',
	'clifton.jackman' => 'clifton.jackman@appgate.com',
	'colby.dyess' => 'colby.dyess@appgate.com',
	'dan.lahey' => 'dan.lahey@appgate.com',
	'daniel.bailey' => 'daniel.bailey@appgate.com',
	'daniel.fields' => 'daniel.fields@appgate.com',
	'daniel.nilsson' => 'daniel.nilsson@appgate.com',
	'daniel.samuelsson' => 'daniel.samuelsson@cryptzone.com',
	'david.butler' => 'david.butler@appgate.com',
	'david.frogley' => 'david.frogley@appgate.com',
	'david.kennedy' => 'david.kennedy@appgate.com',
	'david.kennedy.mxve' => 'david.kennedy@appgate.com',
	'donnie.kaelin' => 'donnie.kaelin@appgate.com',
	'donnie.kaelin.1' => 'donnie.kaelin@appgate.com',
	'donya.teimouri' => 'donya.teimouri@appgate.com',
	'dori.amara' => 'dori.amara@appgate.com',
	'edwin.ramirez' => 'edwin.ramirez@appgate.com',
	'elvir.bajric' => 'elvir.bajric@appgate.com',
	'eva.fireborn' => 'eva.fireborn@appgate.com',
	'fernando.salcedo' => 'fernando.salcedo@appgate.com',
	'filip.dalvag' => 'filip.dalvag@appgate.com',
	'fran.bodley-scott' => 'fran.bodley-scott@cryptzone.com',
	'freddy.ayuso-henson' => 'freddy.ayuso-henson@appgate.com',
	'ganesh.mohan' => 'ganesh@algofocus.com',
	'gary.tullier' => 'Gary.Tullier@cryptzone.com',
	'gernot.hacker' => 'gernot.hacker@appgate.com',
	'gernot.hacker.wttc' => 'gernot.hacker@appgate.com',
	'giovanni.caracoglia' => 'giovanni.caracoglia@cryptzone.com',
	'github_integration' => 'teoman.soygul@appgate.com',
	'gokhan.berberoglu' => 'gokhan.berberoglu@appgate.com',
	'greg.shields' => 'greg.shields@appgate.com',
	'guest' => 'svcaccount',
	'hadi.misagh' => 'hadi.misagh@cryptzone.com',
	'hadrien.luttiau' => 'hadrien.luttiau@appgate.com',
	'hakan.saxmo' => 'hakan.saxmo@cryptzone.com',
	'harish.dinne' => 'harish.dinne@cyxtera.com',
	'hector.santiago' => 'hector.santiago@appgate.com',
	'henry.drefeldt' => 'henry.drefeldt@appgate.com',
	'herve.trutt' => 'herve.trutt@appgate.com',
	'ian.izaguirre' => 'ian.izaguirre@appgate.com',
	'indy.thompson' => 'indy.thompson@appgate.com',
	'jamie.bodley-scott' => 'jamie.bodley-scott@appgate.com',
	'janay.bailey' => 'janay.bailey@appgate.com',
	'jason.garbis' => 'jason.garbis@appgate.com',
	'jeremy.allen' => 'jeremy.allen@appgate.com',
	'jitendra.neelam' => 'jitendra.neelam@appgate.com',
	'joachim.pedersen' => 'joachim.pedersen@appgate.com',
	'joel.dollarhide' => 'joel.dollarhide@appgate.com',
	'johan.segerfeldt' => 'johan.segerfeldt@cryptzone.com',
	'jonas' => 'jonas.ringh@cryptzone.com',
	'jorge.valencia' => 'jorge.valencia@appgate.com',
	'kasper.gustavsson' => 'kasper.gustavsson@appgate.com',
	'keath.milligan' => 'keath.milligan@appgate.com',
	'kevin.cavanaugh' => 'kevin.cavanaugh@appgate.com',
	'kevin.spencer' => 'kevin.spencer@appgate.com',
	'kos' => 'kos@cryptzone.com',
	'kosmas.valianos' => 'kosmas.valianos@appgate.com',
	'kurt.glazemakers' => 'kurt.glazemakers@appgate.com',
	'lars.kajes' => 'lars.kajes@appgate.com',
	'lauren.farley' => 'lauren.farley@appgate.com',
	'lefteris.chairetakis' => 'lefteris.chairetakis@appgate.com',
	'legacy' => 'svcaccount',
	'LocalAdmin' => 'agit@appgate.com',
	'magnus.arnevall' => 'magnus.arnevall@cryptzone.com',
	'malc' => 'malcolm.hamilton@cryptzone.com',
	'manuel.moraga' => 'manuel.moraga@appgate.com',
	'marc.schneider' => 'marc.schneider@appgate.com',
	'margaret.antone' => 'margaret.antone@appgate.com',
	'mark.haase' => 'mark.haase@appgate.com',
	'masaya.ando' => 'masaya.ando@appgate.com',
	'max.wedenmark' => 'max.wedenmark@appgate.com',
	'michael.friedrich' => 'michael.friedrich@appgate.com',
	'michael.levy' => 'michael.levy@appgate.com',
	'miguel.martelo' => 'miguel.martelo@appgate.com',
	'miguel.turner' => 'miguel.turner@appgate.com',
	'mihajlo.ivanic' => 'mihajlo.ivanic@appgate.com',
	'mikael.harsjo' => 'mikael.harsjo@appgate.com',
	'mike.perez' => 'mike.perez@cryptzone.com',
	'natan.abolafya' => 'natan.abolafya@appgate.com',
	'niko.pietikainen' => 'niko.pietikainen@appgate.com',
	'nitin.pillai' => 'nitin.pillai@appgate.com',
	'noland.seigler' => 'noland.seigler@appgate.com',
	'oskar.dahlberg' => 'oskar.dahlberg@appgate.com',
	'parth.mehta' => 'parth.mehta@appgate.com',
	'payal.sharma' => 'svcaccount',
	'per.allansson' => 'per.allansson@appgate.com',
	'per.leino' => 'per.leino@appgate.com',
	'per.svensson' => 'per.svensson@appgate.com',
	'peter.bjorklund' => 'peter.bjorklund@cryptzone.com',
	'peter.chan' => 'peter.chan@cryptzone.com',
	'peter.dalbenzio' => 'peter.dalbenzio@appgate.com',
	'peter.larsson' => 'peter.larsson@cryptzone.com',
	'petter.gustafsson' => 'petter.gustafsson@appgate.com',
	'petter.hancock' => 'petter.hancock@appgate.com',
	'praveen.vanga' => 'praveen.vanga@appgate.com',
	'pravin.karthick' => 'pravin.karthick@cryptzone.com',
	'rafael.soto' => 'rafael.soto@appgate.com',
	'rasmus.sjostrom' => 'rasmus.sjostrom@appgate.com',
	'raven.creighton' => 'raven.creighton@appgate.com',
	'Reggie.Horne' => 'Reggie.Horne@cryptzone.com',
	'reggie.horne.1' => 'reggie.horne@appgate.com',
	'reynaldo.gonzalez' => 'reynaldo.gonzalez@appgate.com',
	'ricardo.elena' => 'ricardo.elena@appgate.com',
	'richard.knupfer' => 'richard.knupfer@appgate.com',
	'roman.sorin' => 'roman.sorin@appgate.com',
	'root' => 'svcaccount',
	'roxana.zaricor' => 'roxana.zaricor@appgate.com',
	'Roy.nard' => 'roy.nard@cryptzone.com',
	'salvatore.tomaselli' => 'salvatore.tomaselli@appgate.com',
	'samuel.crisanto' => 'samuel.crisanto@appgate.com',
	'santhosh.ireddy' => 'santhosh.ireddy@appgate.com',
	'se.teamcity.service' => 'svcaccount',
	'sean.long' => 'sean.long@appgate.com',
	'selina.engberg' => 'selina.engberg@appgate.com',
	'shehab.kazi' => 'shehab.kazi@cryptzone.com',
	'silvercast.nguyen' => 'silvercast.nguyen@cyxtera.com',
	'skyler.spence' => 'svcaccount',
	'srikesh.ajaykumar' => 'srikesh.ajaykumar@appgate.com',
	'stellan.lindell' => 'svcaccount',
	'stephanie.hallberg' => 'stephanie.hallberg@appgate.com',
	'sumeet.mahapatra' => 'sumeet@algofocus.com',
	'susan.moretti' => 'susan.moretti@appgate.com',
	'svcsdpdevyoutrack' => 'svcaccount',
	'tarik.jebbour' => 'tarik.jebbour@appgate.com',
	'teoman.soygul' => 'teoman.soygul@appgate.com',
	'testrail' => 'svcaccount',
	'therese.braun' => 'therese.braun@appgate.com',
	'thomas.cacaj' => 'thomas.cacaj@appgate.com',
	'thomas.cellerier' => 'thomas.cellerier@appgate.com',
	'tobias.nilsson' => 'tobias.nilsson@cryptzone.com',
	'tom.weber' => 'tom.weber@cryptzone.com',
	'torger.miller' => 'torger.miller@appgate.com',
	'tristan.cooper' => 'tristan.cooper@appgate.com',
	'tyron.turner' => 'tyron.turner@appgate.com',
	'v-jefferson.moronta' => 'v-jefferson.moronta@appgate.com',
	'vincent.bryant' => 'vincent.bryant@cryptzone.com',
	'viola.sorgato' => 'viola.sorgato@appgate.com',
	'vuthy.lay' => 'vuthy.lay@appgate.com',
	'wayne.geils' => 'wayne.geils@appgate.com',
	'wayne.marsh' => 'wayne.marsh@appgate.com',
	'wenlson.tassemo' => 'wenlson.tassemo@appgate.com',
	'wictoria.drefeldt' => 'wictoria.drefeldt@appgate.com',
	'william.clayton' => 'william.clayton@appgate.com',
	'zahir.alli' => 'zahir.alli@appgate.com'
);

# This hash is used to comply with Jira's improved user privacy API.
our %JiraUserIds = (
	'nitin.pillai@appgate.com' => '712020:814cdce6-4f0c-4b40-9852-69b9a0de0e81',
    'peter.dalbenzio@appgate.com' => '712020:88025364-2a3c-4c70-8940-138ad451181c',
	'gokhan.berberoglu@appgate.com' => '609a9b9397f3d40070a0c118',
	'per.leino@appgate.com' => '712020:c886d073-6cac-40be-af7d-bdf7025fbe56',
	
	'hadrien.luttiau@appgate.com' => '712020:1f85456f-e98f-4c00-b217-89de18f4a6a4',
	'mikael.harsjo@appgate.com' => '712020:88025364-2a3c-4c70-8940-138ad451181c', #'712020:8da0101b-4d47-4efe-ae0a-ff252b45318b',
	'viola.sorgato@appgate.com' => '712020:88025364-2a3c-4c70-8940-138ad451181c', #'712020:feb76057-dead-496c-83f1-7bbde6c5fa61',
	'ian.izaguirre@appgate.com' => '712020:88025364-2a3c-4c70-8940-138ad451181c', #'712020:c456a5e5-820e-4f2e-bc54-86d5676560ac',
	'aaron.case@appgate.com' => '712020:88025364-2a3c-4c70-8940-138ad451181c', #'712020:f59b582a-29ab-4a2c-8a69-4a16c2418406',
	'eva.fireborn@appgate.com' => '712020:88025364-2a3c-4c70-8940-138ad451181c', #'712020:d8e48fc8-159d-4f84-85f8-e42365a3207f',

	'petter.hancock@appgate.com' => '712020:88025364-2a3c-4c70-8940-138ad451181c', #'712020:3e2ec51b-a983-4b12-b0cb-1d989d7a65df',
	'oskar.dahlberg@appgate.com' => '712020:88025364-2a3c-4c70-8940-138ad451181c', #'712020:1a17894f-0b43-43f6-988c-d7e15af4bec8',
	'joachim.pedersen@appgate.com' => '712020:88025364-2a3c-4c70-8940-138ad451181c', #'712020:ffcbdea3-7e6b-45ec-b816-7335f00b18be',
	'christopher.cox@appgate.com' => '712020:88025364-2a3c-4c70-8940-138ad451181c', #'712020:a16f333b-d83c-409d-b176-a577d29f15c3',
	'natan.abolafya@appgate.com' => '712020:88025364-2a3c-4c70-8940-138ad451181c', #'712020:529105ef-6ba3-4a74-a555-7a8c1e2621e8',

	'kosmas.valianos@appgate.com' => '712020:88025364-2a3c-4c70-8940-138ad451181c', #'712020:486c7104-250e-485f-8def-4c9d5ede56fb',
	'per.allansson@appgate.com' => '712020:88025364-2a3c-4c70-8940-138ad451181c', #'712020:f4b3a9cd-3baa-4be6-911c-24007eb31356',
	'anton.lundgren@appgate.com' => '712020:88025364-2a3c-4c70-8940-138ad451181c', #'712020:1b2ffe51-1b24-414d-9212-35965a46989b',
	'david.butler@appgate.com' => '712020:88025364-2a3c-4c70-8940-138ad451181c', #'712020:c4ae331c-88e8-4918-b1e4-e6990932d082',
	'joel.dollarhide@appgate.com' => '712020:88025364-2a3c-4c70-8940-138ad451181c', #'712020:9a2d4ce2-71c5-4352-a541-0dbfb8351b45',
	'selina.engberg@appgate.com' => '712020:ddb8e7d8-edd6-432e-9f63-267279c80d63',
	
	'daniel.bailey@appgate.com' => '712020:9049c7d8-d374-4431-828f-becb505af54f',
	'edwin.ramirez@appgate.com' => '609a9c379da6d500701e37f7',
	'rafael.soto@appgate.com' => '712020:888c0b13-914d-4cb1-afee-a7c186c26581',
	'torger.miller@appgate.com' => '712020:88025364-2a3c-4c70-8940-138ad451181c', #'712020:3521987c-cc06-4749-a870-e6e463baaab0',
	'raven.creighton@appgate.com' => '712020:88025364-2a3c-4c70-8940-138ad451181c', #'712020:8702c639-87c3-4321-989c-5afce4144e53',
	'freddy.ayuso-henson@appgate.com' => '712020:88025364-2a3c-4c70-8940-138ad451181c', #'712020:d35adf5b-f3d6-45f0-9f36-1849676fab6b',
	'david.frogley@appgate.com' => '712020:88025364-2a3c-4c70-8940-138ad451181c', #'712020:10074ab0-e199-44d9-bac4-20ca3e3001ab',
	
	'masaya.ando@appgate.com' => '712020:88025364-2a3c-4c70-8940-138ad451181c', #'712020:99d5c0bd-0e59-4b7d-a567-3be3274c30f8',
	'kasper.gustavsson@appgate.com' => '712020:88025364-2a3c-4c70-8940-138ad451181c', #'712020:37902401-efb2-4d3f-b84b-581680252ec9',
	'niko.pietikainen@appgate.com' => '712020:3b5f8abe-66c0-45ee-9f38-fa6be1b1d329',
	'dori.amara@appgate.com' => '712020:88025364-2a3c-4c70-8940-138ad451181c', #'712020:0ee29a96-6f8c-40fa-8f78-ce991e91bc70',
	'herve.trutt@appgate.com' => '712020:ea1dec82-4404-4fe9-9519-1930300f6b73',
	'max.wedenmark@appgate.com' => '712020:1b3f3f5d-42aa-4836-9322-db7bd58a3b4c',
	
	'mark.haase@appgate.com' => '712020:7b762c60-c811-4238-ae03-e51ef5eb45d6',
	'samuel.crisanto@appgate.com' => '712020:ee9458df-584d-4f89-aff6-3c5ba80b0f2b',	
	'julia.lee@appgate.com' => '712020:152daaad-c0a9-4b6b-93f4-d9cdccee99ee',
	
	# Outside R&D; employeed by AppGate
	'aaron.palermo@appgate.com' => '',
	'adarsh.anand@appgate.com' => '',
	'adam.rose@appgate.com' => '',
	'andrew.martin@appgate.com' => '',
	'angel.chaviano@appgate.com' => '',
	'antonio.villa@appgate.com' => '',
	'brian.odonnell@appgate.com' => '',
	'carina.olsson@appgate.com' => '',
	'chris.kearns@appgate.com' => '',
	'christoffer.karlsson@appgate.com' => '',
	'clifton.jackman@appgate.com' => '',
	'colby.dyess@appgate.com' => '',
	'daniel.fields@appgate.com' => '',
	'david.kennedy@appgate.com' => '',
	'donnie.kaelin@appgate.com' => '',
	'elvir.bajric@appgate.com' => '',
	'gernot.hacker@appgate.com' => '',
	'filip.dalvag@appgate.com' => '',
	'indy.thompson@appgate.com' => '',
	'jeremy.allen@appgate.com' => '',
	'kevin.cavanaugh@appgate.com' => '',
	'kevin.spencer@appgate.com' => '',
	'lefteris.chairetakis@appgate.com' => '',
	'michael.levy@appgate.com' => '',
	'mihajlo.ivanic@appgate.com' => '',
	'per.svensson@appgate.com' => '',
	'ricardo.elena@appgate.com' => '',
	'santhosh.ireddy@appgate.com' => '',
	'susan.moretti@appgate.com' => '',
	'therese.braun@appgate.com' => '',
	'tristan.cooper@appgate.com' => '',
	'tyron.turner@appgate.com' => '',
	'v-jefferson.moronta@appgate.com' => '',
	'william.clayton@appgate.com' => '',
	'zahir.alli@appgate.com' => '',

	# Local/Service accounts
	'agit@appgate.com' => '',
	'svcaccount' => '',

	# Not employeed by AppGate
	'abraham.french@appgate.com' => '',
	'adolfo.perez@appgate.com' => '',
	'aitor.iturri@appgate.com' => '',
	'amanda.hansson@appgate.com' => '',
	'anders.hansson@cryptzone.com' => '',
	'anders.larsson@cryptzone.com' => '',
	'andre.garrigo@appgate.com' => '',
	'andrea.fantini@appgate.com' => '',
	'andy.lalaguna@cryptzone.com' => '',
	'arturo.garcia@appgate.com' => '',
	'anders.thyberg@cryptzone.com' => '',
	'behrooz.aghakhanian@cryptzone.com' => '',
	'calle.sandberg@cryptzone.com' => '',
	'carl.bergevald@cryptzone.com' => '',
	'cheryl.shea@cryptzone.com' => '',
	'christopher.scheels@appgate.com' => '',
	'dan.lahey@appgate.com' => '',
	'daniel.nilsson@appgate.com' => '',
	'daniel.samuelsson@cryptzone.com' => '',
	'donya.teimouri@appgate.com' => '',
	'fernando.salcedo@appgate.com' => '',
	'fran.bodley-scott@cryptzone.com' => '',
	'ganesh@algofocus.com' => '',
	'Gary.tullier@cryptzone.com' => '',
	'gary.tullier@cryptzone.com' => '',
	'giovanni.caracoglia@cryptzone.com' => '',
	'greg.shields@appgate.com' => '',
	'hadi.misagh@cryptzone.com' => '',
	'hakan.saxmo@cryptzone.com' => '',
	'harish.dinne@cyxtera.com' => '',
	'hector.santiago@appgate.com' => '',
	'henry.drefeldt@appgate.com' => '',
	'jamie.bodley-scott@appgate.com' => '',
	'janay.bailey@appgate.com' => '',
	'jason.garbis@appgate.com' => '',
	'jitendra.neelam@appgate.com' => '',
	'johan.segerfeldt@cryptzone.com' => '',
	'jonas.ringh@cryptzone.com' => '',
	'jorge.valencia@appgate.com' => '',
	'keath.milligan@appgate.com' => '',
	'kos@cryptzone.com' => '',
	'kurt.glazemakers@appgate.com' => '',
	'lars.kajes@appgate.com' => '',
	'lauren.farley@appgate.com' => '',
	'magnus.arnevall@cryptzone.com' => '',
	'malcolm.hamilton@cryptzone.com' => '',
	'manuel.moraga@appgate.com' => '',
	'marc.schneider@appgate.com' => '',
	'margaret.antone@appgate.com' => '',
	'michael.friedrich@appgate.com' => '',
	'miguel.martelo@appgate.com' => '',
	'miguel.turner@appgate.com' => '',
	'mike.perez@cryptzone.com' => '',
	'noland.seigler@appgate.com' => '',
	'parth.mehta@appgate.com' => '',
	'payal.sharma' => '',
	'peter.bjorklund@cryptzone.com' => '',
	'peter.chan@cryptzone.com' => '',
	'peter.larsson@cryptzone.com' => '',
	'petter.gustafsson@appgate.com' => '',
	'praveen.vanga@appgate.com' => '',
	'pravin.karthick@cryptzone.com' => '',
	'rasmus.sjostrom@appgate.com' => '',
	'Reggie.Horne@appgate.com' => '',
	'reynaldo.gonzalez@appgate.com' => '',
	'richard.knupfer@appgate.com' => '',
	'roman.sorin@appgate.com' => '',
	'roxana.zaricor@appgate.com' => '',
	'roy.nard@cryptzone.com' => '',
	'salvatore.tomaselli@appgate.com' => '',
	'sean.long@appgate.com' => '',
	'shehab.kazi@cryptzone.com' => '',
	'silvercast.nguyen@cryptzone.com' => '',
	'skyler.spence' => '',
	'srikesh.ajaykumar@appgate.com' => '',
	'stellan.lindell' => '',
	'stephanie.hallberg@appgate.com' => '',
	'sumeet@algofocus.com' => '',
	'tarik.jebbour@appgate.com' => '',
	'teoman.soygul@appgate.com' => '',
	'thomas.cacaj@appgate.com' => '',
	'thomas.cellerier@appgate.com' => '',
	'tobias.nilsson@cryptzone.com' => '',
	'tom.weber@cryptzone.com' => '',
	'vincent.bryant@cryptzone.com' => '',
	'vuthy.lay@appgate.com' => '',
	'wayne.geils@appgate.com' => '',
	'wayne.marsh@appgate.com' => '',
	'wenlson.tassemo@appgate.com' => '',
	'wictoria.drefeldt@appgate.com' => '',
);

our $ztnaBoardName = "ZTNA Board";
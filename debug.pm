#!/usr/bin/perl
package debug;

use File::Basename qw/dirname/;
use lib dirname(__FILE__);
use jira;
require "config.pl";

use Data::Dumper;
use Getopt::Long;
use IPC::Run qw( run );
use Date::Format;
use Encode;

my ($deleteAll);
Getopt::Long::Configure('bundling');
GetOptions(
    "delete-all|d"  => \$deleteAll
);

if($deleteAll) {
    my $jira = jira->new( Url         => $JiraUrl,
                        Login       => $JiraLogin,
                        Password    => $JiraPassword
    );
    
    unless ($jira) {
        die "Could not login to $JiraUrl\n";
    }

    $allIssues = $jira->getAllIssues(Project => "WEB", Max => 100);
    while (@{$allIssues->{issues}}) {
        foreach my $issue (@{$allIssues->{issues}}) {
            my $key = $issue->{key};
            $key =~ /^[A-Z]+-(\d+)$/;
            $jira->deleteIssue(Key => $key);
        }
        $allIssues = $jira->getAllIssues(Project => "WEB", Max => 100);
    }

    print "\nAll issues deleted from Jira.";
}

our sub logToFile {    
    my $content = shift;

    open my $fh, ">", "debug.log";
    print $fh Dumper $content;
    close $fh;
}

1;
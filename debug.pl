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

my $jira = jira->new( Url         => $JiraUrl,
                      Login       => $JiraLogin,
                      Password    => $JiraPassword
);

my $allIssues = $jira->getAllIssues(Project => "WEB");
while (@{$allIssues->{issues}}) {
foreach my $issue (@{$allIssues->{issues}}) {
    my $key = $issue->{key};
    $key =~ /^[A-Z]+-(\d+)$/;
    $jira->deleteIssue(Key => $key);
    }
    $allIssues = $jira->getAllIssues(Project => "WEB");
}


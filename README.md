# Lumper
The tool for migration from YouTrack to Jira: easy and for free

## Table of Contents

  1. [Capabilities](#capabilities)
  1. [Prepare YouTrack](#prepare-yt)
  1. [Prepare Jira](#prepare-jira)
  1. [Do all the job](#do-job)
  1. [Needed Perl modules](#perl-modules)

## Capabilities
Lumper can:

  * Copy all issues
  * Keep issue keys if possible
  * Copy all comments
  * Save all custom fields
  * Save statuses
  * Save authors of issues and comments is they are existing in the user directory.
  * Copy attachments
  * Copy tags/labels
  * Copy issue links

Lumper can not:

  * Save creation times for issues and comments (creation time will be added to the description)
  * Copy watchers and voters

## Prepare YouTrack
  1. Allow to export more than 500 issues if needed: Global Settings -> Max Issues to Export

## Prepare Jira
  1. Remove from project screens all the mandatory fields that are absent in YouTrack
  1. Add Reporter field to the screens and add the permission for modifying reporter to your user
  1. Disable notifications for project and enable them after the migration to avoid overdisturbing the users
  1. If you are going to match some YT states to some Jira resolutions then you need to add Resolution field to the screens
  1. Please make sure that your project workflow allows all needed transitions right from the initial state. Maybe you will need to prepare a simplified workflow to proceed with the migration and get back to your cool workflow afterwards.

## Do all the job
  First you will need to rename config.pl_example to config.pl and edit it for your needs. The file is well-commented and you will have no problems with it if you have some familiarity with Perl syntax (even if not).
  Then you just run the script:
  > ./migrate.pl [--notest] [--debug] [--skip=N] [--maxissues=N]

  --notest - Skip testing the passwords from JiraPasswords in config. You can save some time but if there is an invalid password then the script will fail while adding the comment from user with this invalid password. By default all the passwords will be checked and invalid ones will be excluded. Their comments will be recreated from the default user with mentioning the original users in the comment body.

  --skip=N - skips the YT issues up to PROJECTKEY-N. This is useful for proceeding the migration from some breakpoint. For example if you have migrated the issues from KEY-1 to KEY-438 then you can proceed with KEY-439 by setting --skip=438.

  --maxissues=N - set the maximum number of issues to migrate. Useful for some testing purposes if you need to test the migration only for one (ony other amount) issue.

  --debug - overwhelms you with its standard output.

  Lean back in you chair and prepare for a very long process.

## Needed Perl modules
  * Data::Dumper
  * LWP::UserAgent
  * JSON
  * MIME::Base64
  * Data::Dumper
  * Getopt::Long
  * XML::Parser

# Lumper
The tool for migration from YouTrack to Jira: easy and for free

## Table of Contents

  1. [Capabilities](#capabilities)
  1. [Environment Setup](#environment-setup)
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
  * Creation time for issues

Lumper can not:

  * Save creation times for comments
  * Copy watchers and voters

>Note that creation time for the YouTrack issues can be applied to the real creation time in Jira by modifying the database directly. Follow these [instructions](https://confluence.atlassian.com/jirakb/how-to-change-the-issue-creation-date-using-a-database-update-334430256.html) to transfer values from custom field `Original Creation Date` to the `Creation Time` in Jira. You can safely delete the custom field after that.
## Environment Setup
### Perl
You'll need Perl installed on your machine. Most Linux distros already have it preinstalled, however, if you're using Windows, you should install in manually. Check these [installation instructions](https://strawberryperl.com/) for Perl.
### J2M Tool
YouTrack is using regular markdown language to create rich text formatting (__bold text__, _italic_, headers etc). Jira is different - it supports some specific rich text formatting language. So if you want to save the text formatting you need to install special tool for Markdown -> Jira parser written in JavaScript (thanks to [J2M Team](https://j2m.fokkezb.nl/)). To do that follow these steps:
1. [Install](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm) `npm` for Windows/Linux
1. Run this command in cmd/bash:
```bash
npm install j2m --save
```

## Prepare YouTrack
1. Allow to export more than 500 issues if needed: Global Settings -> Max Issues to Export
1. Generate permanent token in your profile by clicking on profile image -> Profile -> Account Security -> Tokens -> New Token. Then copy generated token and paste to the config file described in the [next article](#do-all-the-job)

## Prepare Jira
1. Remove from project screens all the mandatory fields that are absent in YouTrack
1. Add `Reporter` field to the screens and add the permission for modifying reporter to your user
1. Disable notifications for project and enable them after the migration to avoid overdisturbing the users
1. If you are going to match some YT states to some Jira resolutions then you need to add `Resolution` field to the screens
1. If you want to save the original creation date you must add `Original Creation Date` custom field in Jira (this field name is a subject to change). This must be the Date and Time type of a field. 
1. Please make sure that your project workflow allows all needed transitions right from the initial state. Maybe you will need to prepare a simplified workflow to proceed with the migration and get back to your cool workflow afterwards.
1. Make sure that Issue Linking feature is enabled in you Jira instance if you're planning to export issue links

Here's the list of minimum required issue fields:
- Issue Type
- Description
- Summary
- Assignee
- Reporter
- Priority
- Original Creation Date
- _here goes other custom fields from `config.pl` configuration file_

## Do all the job
First you will need to rename config.pl_example to config.pl and edit it for your needs. The file is well-commented and you will have no problems with it if you have some familiarity with Perl syntax (even if not). 


Then you just run the script:
```bash
./migrate.pl [--no-test|-t] [--verbose|-v] [--skip|-s N] [--max-issues|-m N]
```
`--no-test` or `-t` - Skip testing the passwords from JiraPasswords in config. You can save some time but if there is an invalid password then the script will fail while adding the comment from user with this invalid password. By default all the passwords will be checked and invalid ones will be excluded. Their comments will be recreated from the default user with mentioning the original users in the comment body.

`--skip <number>` ot `-s <number>` - skips the YT issues up to PROJECTKEY-N. This is useful for proceeding the migration from some breakpoint. For example if you have migrated the issues from KEY-1 to KEY-438 then you can proceed with KEY-439 by setting --skip=438.

`--max-issues <number>` or `-m <number>` - set the maximum number of issues to migrate. Useful for some testing purposes if you need to test the migration only for one (ony other amount) issue.

`--verbose` or `-v` - overwhelms you with its standard output.

`--cookie-file` or `-c` - explicit Jira cookie file location.

Lean back in you chair and prepare for a very long process.

## Needed Perl modules
To install these components you'll need `cpan` utility. 

In cmd/bash type 
```bash
cpan
``` 
or you can run (which is the same)
```bash 
perl -MCPAN -e shell
``` 
then, inside the `cpan` utility run
```bash
install <name_of_component>
```
Here's the list of used components:
  * LWP::UserAgent
  * JSON
  * MIME::Base64
  * Data::Dumper
  * Getopt::Long
  * IPC::Run
  * Encode
  * Date::Format
  * File::Temp

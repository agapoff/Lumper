#!/usr/bin/env node

import { config } from 'dotenv';
import { YouTrackClient } from './src/youtrack-client.js';

config();

const YOUTRACK_BASE_URL = process.env.YOUTRACK_BASE_URL;
const YOUTRACK_TOKEN = process.env.YOUTRACK_TOKEN;
const YOUTRACK_QUERY = process.env.YOUTRACK_QUERY || 'project: SA';

async function analyzeIssues() {
  console.log('='.repeat(80));
  console.log('YouTrack to Jira ADF Conversion - Issue Analysis');
  console.log('='.repeat(80));
  console.log();

  const client = new YouTrackClient(YOUTRACK_BASE_URL, YOUTRACK_TOKEN);

  console.log(`Fetching issues from YouTrack...`);
  console.log(`Query: ${YOUTRACK_QUERY}`);
  console.log();

  // Fetch all issues
  const issues = await client.fetchAllIssues(YOUTRACK_QUERY);
  console.log(`✓ Found ${issues.length} issues`);
  console.log();

  // Analysis counters
  const stats = {
    total: issues.length,
    withDescription: 0,
    withReleaseNote: 0,
    needsConversion: 0,
    issuesNeedingConversion: []
  };

  // Analyze each issue
  for (const issue of issues) {
    let needsConversion = false;

    // Check description
    const hasDescription = issue.description && issue.description.trim().length > 0;
    if (hasDescription) {
      stats.withDescription++;
      needsConversion = true;
    }

    // Check for Release note custom field
    const releaseNoteField = issue.customFields?.find(f => f.name === 'Release note');
    const hasReleaseNote = releaseNoteField?.value?.text && releaseNoteField.value.text.trim().length > 0;
    if (hasReleaseNote) {
      stats.withReleaseNote++;
      needsConversion = true;
    }

    if (needsConversion) {
      stats.needsConversion++;
      stats.issuesNeedingConversion.push({
        key: issue.idReadable,
        summary: issue.summary,
        hasDescription,
        hasReleaseNote
      });
    }
  }

  // Print analysis results
  console.log('Analysis Results:');
  console.log('-'.repeat(80));
  console.log(`Total issues:                    ${stats.total}`);
  console.log(`Issues with description:         ${stats.withDescription}`);
  console.log(`Issues with release note:        ${stats.withReleaseNote}`);
  console.log(`Issues needing ADF conversion:   ${stats.needsConversion}`);
  console.log();

  // Print detailed list
  console.log('Issues requiring ADF conversion:');
  console.log('-'.repeat(80));
  console.log('Key'.padEnd(15) + 'Description'.padEnd(15) + 'Release Note'.padEnd(15) + 'Summary');
  console.log('-'.repeat(80));

  for (const issue of stats.issuesNeedingConversion) {
    const descMarker = issue.hasDescription ? '✓' : '';
    const rnMarker = issue.hasReleaseNote ? '✓' : '';
    const summary = issue.summary.length > 45 ? issue.summary.substring(0, 42) + '...' : issue.summary;

    console.log(
      issue.key.padEnd(15) +
      descMarker.padEnd(15) +
      rnMarker.padEnd(15) +
      summary
    );
  }

  console.log();
  console.log('='.repeat(80));
  console.log('Analysis complete!');
  console.log();
  console.log('Next steps:');
  console.log('  1. Run: npm run convert');
  console.log('  2. This will generate: output/adf-dataset.json');
  console.log('  3. Use dataset with migrate.pl for migration');
  console.log('='.repeat(80));
}

// Run analysis
analyzeIssues().catch(error => {
  console.error('Error during analysis:', error.message);
  process.exit(1);
});

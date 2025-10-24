#!/usr/bin/env node

import fs from 'fs';
import path from 'path';
import { config } from 'dotenv';
import { YouTrackClient } from './src/youtrack-client.js';
import { HtmlToMarkdownConverter } from './src/html-to-markdown.js';
import { ADFConverter } from './src/adf-converter.js';

config();

const YOUTRACK_BASE_URL = process.env.YOUTRACK_BASE_URL;
const YOUTRACK_TOKEN = process.env.YOUTRACK_TOKEN;
const YOUTRACK_QUERY = process.env.YOUTRACK_QUERY || 'project: SA';
const OUTPUT_DIR = process.env.OUTPUT_DIR || './output';

async function convertToDataset() {
  console.log('='.repeat(80));
  console.log('YouTrack to Jira ADF Conversion - Dataset Generation');
  console.log('='.repeat(80));
  console.log();

  // Ensure output directory exists
  if (!fs.existsSync(OUTPUT_DIR)) {
    fs.mkdirSync(OUTPUT_DIR, { recursive: true });
  }

  const client = new YouTrackClient(YOUTRACK_BASE_URL, YOUTRACK_TOKEN);
  const htmlToMd = new HtmlToMarkdownConverter();
  const adfConverter = new ADFConverter();

  console.log(`Fetching issues from YouTrack...`);
  console.log(`Query: ${YOUTRACK_QUERY}`);
  console.log();

  // Fetch all issues with full details
  const issues = await client.fetchAllIssues(YOUTRACK_QUERY);
  console.log(`✓ Found ${issues.length} issues`);
  console.log();

  const dataset = [];
  let convertedCount = 0;

  console.log('Converting issues to ADF format...');
  console.log('-'.repeat(80));

  for (const issue of issues) {
    try {
      const issueData = {
        id: issue.id,
        idReadable: issue.idReadable,
        numberInProject: issue.numberInProject,
        summary: issue.summary,
        created: issue.created,
        updated: issue.updated,
        resolved: issue.resolved,
        // We'll add these from custom fields
        Priority: null,
        State: null,
        Assignee: null,
        customFields: {},
        reporter: issue.reporter
      };

      // Extract custom fields needed by migrate.pl
      if (issue.customFields) {
        for (const field of issue.customFields) {
          issueData.customFields[field.name] = field.value;

          // Map common fields that migrate.pl expects at top level
          if (field.name === 'Priority') {
            issueData.Priority = field.value?.name || field.value;
          } else if (field.name === 'State') {
            issueData.State = field.value?.name || field.value;
          } else if (field.name === 'Assignee') {
            issueData.Assignee = field.value?.login || field.value;
          }
        }
      }

      // Convert description to ADF (catch errors separately so release note can still succeed)
      let descriptionADF = null;
      if (issue.description && issue.description.trim().length > 0) {
        try {
          const descResult = htmlToMd.convertDescription(issue.description, null);
          descriptionADF = adfConverter.convertToADF(descResult.markdown);
          issueData.descriptionADF = descriptionADF;
        } catch (descError) {
          console.error(`  ⚠ Error converting description for ${issue.idReadable}: ${descError.message}`);
          // Will use fallback plain description
        }
      }
      // Keep original description for fallback
      issueData.description = issue.description;

      // Convert Release note to ADF if present (catch errors separately)
      const releaseNoteField = issue.customFields?.find(f => f.name === 'Release note');
      if (releaseNoteField?.value?.text) {
        try {
          const rnMarkdown = releaseNoteField.value.markdownText || releaseNoteField.value.text;
          const rnResult = htmlToMd.convertDescription(releaseNoteField.value.text, rnMarkdown);
          const releaseNoteADF = adfConverter.convertToADF(rnResult.markdown);
          issueData.releaseNoteADF = releaseNoteADF;
        } catch (rnError) {
          console.error(`  ⚠ Error converting release note for ${issue.idReadable}: ${rnError.message}`);
          // Release note will not be included for this issue
        }
      }

      dataset.push(issueData);
      convertedCount++;

      // Progress indicator
      if (convertedCount % 10 === 0) {
        console.log(`  Converted ${convertedCount}/${issues.length} issues...`);
      }

    } catch (error) {
      console.error(`  ✗ Error converting ${issue.idReadable}: ${error.message}`);
    }
  }

  console.log(`✓ Converted ${convertedCount}/${issues.length} issues`);
  console.log();

  // Write dataset to file
  const outputFile = path.join(OUTPUT_DIR, 'adf-dataset.json');
  fs.writeFileSync(outputFile, JSON.stringify(dataset, null, 2));

  console.log('='.repeat(80));
  console.log(`✓ Dataset written to: ${outputFile}`);
  console.log();
  console.log('Dataset Statistics:');
  console.log(`  Total issues:              ${dataset.length}`);
  console.log(`  With ADF description:      ${dataset.filter(i => i.descriptionADF).length}`);
  console.log(`  With ADF release note:     ${dataset.filter(i => i.releaseNoteADF).length}`);
  console.log();
  console.log('Next steps:');
  console.log('  1. Review dataset file for accuracy');
  console.log('  2. Run migrate.pl with --use-adf-dataset flag');
  console.log('  3. Dataset will be used instead of direct YouTrack API calls');
  console.log('='.repeat(80));
}

// Run conversion
convertToDataset().catch(error => {
  console.error('Error during conversion:', error.message);
  console.error(error.stack);
  process.exit(1);
});

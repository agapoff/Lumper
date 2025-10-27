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

  // Track conversion failures for debugging
  const conversionFailures = [];

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
        key: issue.idReadable, // Issue key for mapping
      };

      // Convert description to ADF if present
      if (issue.description && issue.description.trim().length > 0) {
        let descResult = null;
        try {
          descResult = htmlToMd.convertDescription(issue.description, null);
          issueData.description = adfConverter.convertToADF(descResult.markdown);
        } catch (descError) {
          console.error(`  ⚠ Error converting description for ${issue.idReadable}: ${descError.message}`);

          // Log failure details for debugging
          conversionFailures.push({
            issueId: issue.idReadable,
            fieldType: 'description',
            error: descError.message,
            stack: descError.stack,
            originalHtml: issue.description,
            markdown: descResult?.markdown || '[conversion to markdown failed]'
          });
        }
      }

      // Convert Release note to ADF if present
      const releaseNoteField = issue.customFields?.find(f => f.name === 'Release note');
      if (releaseNoteField?.value?.text) {
        let rnResult = null;
        try {
          const rnMarkdown = releaseNoteField.value.markdownText || releaseNoteField.value.text;
          rnResult = htmlToMd.convertDescription(releaseNoteField.value.text, rnMarkdown);
          issueData.releaseNote = adfConverter.convertToADF(rnResult.markdown);
        } catch (rnError) {
          console.error(`  ⚠ Error converting release note for ${issue.idReadable}: ${rnError.message}`);

          // Log failure details for debugging
          conversionFailures.push({
            issueId: issue.idReadable,
            fieldType: 'releaseNote',
            error: rnError.message,
            stack: rnError.stack,
            originalHtml: releaseNoteField.value.text,
            markdown: rnResult?.markdown || '[conversion to markdown failed]'
          });
        }
      }

      // Convert comments to ADF if present
      if (issue.comments && issue.comments.length > 0) {
        issueData.comments = [];

        for (const comment of issue.comments) {
          let commentResult = null;
          try {
            if (comment.text && comment.text.trim().length > 0) {
              commentResult = htmlToMd.convertDescription(comment.text, null);
              const commentADF = adfConverter.convertToADF(commentResult.markdown);

              issueData.comments.push({
                body: commentADF,
                author: comment.author?.login || comment.author?.fullName || comment.author,
                created: comment.created
              });
            }
          } catch (commentError) {
            console.error(`  ⚠ Error converting comment ${comment.id} for ${issue.idReadable}: ${commentError.message}`);

            // Log failure details for debugging
            conversionFailures.push({
              issueId: issue.idReadable,
              fieldType: `comment-${comment.id}`,
              error: commentError.message,
              stack: commentError.stack,
              originalHtml: comment.text,
              markdown: commentResult?.markdown || '[conversion to markdown failed]',
              commentAuthor: comment.author?.login || comment.author?.fullName || comment.author,
              commentCreated: comment.created
            });
          }
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
  console.log(`  With description:          ${dataset.filter(i => i.description).length}`);
  console.log(`  With release note:         ${dataset.filter(i => i.releaseNote).length}`);
  console.log(`  With comments:             ${dataset.filter(i => i.comments && i.comments.length > 0).length}`);
  const totalComments = dataset.reduce((sum, i) => sum + (i.comments?.length || 0), 0);
  console.log(`  Total comments:            ${totalComments}`);
  console.log();
  console.log('Dataset Format:');
  console.log('  Each issue contains:');
  console.log('    - key: Issue identifier (e.g., "SA-458")');
  console.log('    - description: ADF formatted description (if present)');
  console.log('    - releaseNote: ADF formatted release note (if present)');
  console.log('    - comments: Array of ADF comments with author, body, created (if present)');
  console.log();
  console.log('Next steps:');
  console.log('  1. Review dataset file for accuracy');
  console.log('  2. Use this dataset in migrate.pl to override text fields');
  console.log('  3. Peter\'s script will handle all other fields');
  console.log('='.repeat(80));

  // Write conversion failures log if there are any failures
  if (conversionFailures.length > 0) {
    const failuresFile = path.join(OUTPUT_DIR, 'conversion-failures.json');
    fs.writeFileSync(failuresFile, JSON.stringify(conversionFailures, null, 2));

    console.log();
    console.log('='.repeat(80));
    console.log(`⚠ ${conversionFailures.length} conversion failures logged to: ${failuresFile}`);
    console.log();
    console.log('Failed Issues:');

    // Group failures by issue ID for cleaner output
    const failuresByIssue = {};
    conversionFailures.forEach(failure => {
      if (!failuresByIssue[failure.issueId]) {
        failuresByIssue[failure.issueId] = [];
      }
      failuresByIssue[failure.issueId].push(failure);
    });

    Object.keys(failuresByIssue).forEach(issueId => {
      const failures = failuresByIssue[issueId];
      console.log(`  ${issueId}:`);
      failures.forEach(failure => {
        console.log(`    - ${failure.fieldType}: ${failure.error}`);
      });
    });

    console.log();
    console.log('To debug a failed issue:');
    console.log('  YOUTRACK_QUERY="<issue-id>" node convert-to-dataset.js');
    console.log('='.repeat(80));
  }
}

// Run conversion
convertToDataset().catch(error => {
  console.error('Error during conversion:', error.message);
  console.error(error.stack);
  process.exit(1);
});

# ADF Converter for Lumper

This directory contains the ADF (Atlassian Document Format) conversion toolkit for the Lumper migration tool. It converts YouTrack issue descriptions and release notes to Jira's ADF format.

## What is ADF?

ADF (Atlassian Document Format) is the JSON-based rich text format required by Jira Cloud API v3. It properly handles:
- Rich text formatting (bold, italic, code blocks)
- Numbered and bulleted lists
- Clickable hyperlinks
- User mentions
- Code snippets
- Blockquotes

## Directory Structure

```
adf-converter/
├── src/
│   ├── youtrack-client.js      # Fetches issues from YouTrack API
│   ├── html-to-markdown.js     # Converts YouTrack HTML to Markdown
│   └── adf-converter.js        # Converts Markdown to ADF
├── output/                     # Generated dataset files
├── analyze-issues.js           # Analyzes which issues need conversion
├── convert-to-dataset.js       # Generates ADF dataset
├── package.json
└── .env                        # Configuration (not in git)
```

## Setup

1. **Install dependencies:**
   ```bash
   cd adf-converter
   npm install
   ```

2. **Configure environment:**
   ```bash
   cp .env.example .env
   # Edit .env with your YouTrack credentials
   ```

3. **Set environment variables in .env:**
   ```
   YOUTRACK_BASE_URL=https://your-youtrack-instance.com
   YOUTRACK_TOKEN=your-permanent-token
   YOUTRACK_QUERY=project: SA
   OUTPUT_DIR=./output
   ```

## Usage

### Step 1: Analyze Issues

Run analysis to see which issues need ADF conversion:

```bash
npm run analyze
```

This will show:
- Total number of issues
- How many have descriptions
- How many have release notes
- List of issues requiring conversion

### Step 2: Generate ADF Dataset

Convert all issues to ADF format:

```bash
npm run convert
```

This generates `output/adf-dataset.json` containing:
- All issue metadata
- ADF-formatted descriptions
- ADF-formatted release notes
- Original fields for migrate.pl compatibility

### Step 3: Use with migrate.pl

The dataset is now ready to use with the modified migrate.pl:

```bash
cd ..
perl migrate.pl --use-adf-dataset
```

## Dataset Format

The generated dataset includes:

```json
[
  {
    "id": "2-12345",
    "idReadable": "SA-458",
    "numberInProject": 458,
    "summary": "Issue summary",
    "description": "Original description text",
    "descriptionADF": { /* ADF JSON structure */ },
    "releaseNoteADF": { /* ADF JSON structure */ },
    "customFields": { /* All custom fields */ },
    "Priority": "Critical",
    "State": "Fixed",
    "Assignee": "username",
    "reporter": { "login": "reporter_name" }
  }
]
```

## What Gets Converted?

### ✓ Currently Converted
- **Descriptions**: Full ADF conversion with formatting
- **Release Notes**: Full ADF conversion with formatting

### ✗ Not Yet Converted (Future)
- **Comments**: API token permissions issue - will be added later

## Conversion Features

The ADF converter handles:
- HTML to Markdown conversion (from YouTrack's old Wiki format)
- Markdown to ADF conversion
- List numbering fixes (1,1,1 → 1,2,3)
- URL hyperlink detection and linking
- Protocol placeholder restoration ({{PROTOCOL}} → ://)
- User mentions
- Code blocks (inline and multi-line)
- Blockquotes

## Troubleshooting

**No issues found:**
- Check YOUTRACK_QUERY in .env
- Verify YOUTRACK_TOKEN has read permissions

**Conversion errors:**
- Check YouTrack API is accessible
- Verify issue has description or release note content
- Check logs for specific error messages

**Dataset format issues:**
- Ensure you're using latest version of dependencies
- Check output/adf-dataset.json is valid JSON

## Integration with Lumper

The dataset is designed to be drop-in compatible with migrate.pl. The modified migrate.pl will:
1. Check for `--use-adf-dataset` flag
2. Load `adf-converter/output/adf-dataset.json`
3. Use ADF fields when creating Jira issues
4. Fall back to original fields if ADF not present
5. Map issues by `numberInProject` to maintain ordering

# ADF Converter for Lumper

This directory contains the ADF (Atlassian Document Format) conversion toolkit for the Lumper migration tool. It converts YouTrack issue descriptions and release notes to Jira's ADF format.


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
   yarn install
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
yarn run analyze
```

This will show:
- Total number of issues
- How many have descriptions
- How many have release notes
- List of issues requiring conversion

### Step 2: Generate ADF Dataset

Convert all issues to ADF format:

```bash
yarn run convert
```

This generates `output/adf-dataset.json` containing:
- All issue metadata
- ADF-formatted descriptions
- ADF-formatted release notes

### Step 3: Use with migrate.pl

The dataset is now ready to use. Migrate.ml will need to be modified to take in these fields.

## Dataset Format

The generated dataset includes:

```json
  [
    {
      "key": "SA-458",
      "description": { /* ADF format */ },
      "releaseNote": { /* ADF format */ },
      "comments": [
        {
          "body": { /* ADF format */ },
          "author": "username",
          "created": 1234567890000
        }
      ]
    }
  ]
```

## What Gets Converted?

### ✓ Currently Converted
- **Descriptions**: Full ADF conversion with formatting
- **Release Notes**: Full ADF conversion with formatting
- **Comments**: Full ADF conversion with formatting
- Code blocks (inline and multi-line)
- Links (plain URLs and markdown links)
- User mentions (@username)
- Blockquotes


## Conversion Features

The ADF converter handles:
- HTML to Markdown conversion (from YouTrack's old Wiki format)
- Markdown to ADF conversion
- List numbering fixes (1,1,1 → 1,2,3)
- URL hyperlink detection and linking
- Protocol placeholder restoration ({{PROTOCOL}} → ://)

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


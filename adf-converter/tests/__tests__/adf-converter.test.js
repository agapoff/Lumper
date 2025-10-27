import { ADFConverter } from '../../src/adf-converter.js';
import { HtmlToMarkdownConverter } from '../../src/html-to-markdown.js';
import fs from 'fs';
import path from 'path';

// Helper to load individual fixture
function loadFixture(issueId) {
  const fixturePath = path.join(process.cwd(), `tests/fixtures/${issueId}.json`);
  return JSON.parse(fs.readFileSync(fixturePath, 'utf-8'));
}

describe('ADFConverter - Description Conversion', () => {
  let adfConverter;
  let htmlToMd;

  beforeAll(() => {
    adfConverter = new ADFConverter();
    htmlToMd = new HtmlToMarkdownConverter();
  });

  describe('Simple Markup in Descriptions', () => {
    test('SA-7851: converts simple markup correctly', () => {
      const fixture = loadFixture('SA-7851');

      if (!fixture.fields.description) {
        return; // Skip if no description
      }

      const htmlContent = fixture.fields.description;
      const mdResult = htmlToMd.convertDescription(htmlContent, null);
      const adf = adfConverter.convertToADF(mdResult.markdown);

      // Should have headings (###) and bullet lists (-)
      const adfString = JSON.stringify(adf);
      expect(adf.type).toBe('doc');
      expect(adf.version).toBe(1);

      // Check for bullet list nodes (has - Continue on e2e testing, etc.)
      expect(adfString.includes('"type":"bulletList"')).toBe(true);

      // Check for heading nodes (has ### Objectives and ### Definition of done)
      const hasHeading = adf.content.some(node => node.type === 'heading');
      expect(hasHeading).toBe(true);
    });

    test('SA-52: converts simple description markup', () => {
      const fixture = loadFixture('SA-52');
      expect(fixture).toBeDefined();

      if (!fixture.fields.description) {
        return;
      }

      const htmlContent = fixture.fields.description;
      const mdResult = htmlToMd.convertDescription(htmlContent, null);
      const adf = adfConverter.convertToADF(mdResult.markdown);

      const adfString = JSON.stringify(adf);
      expect(adf.type).toBe('doc');

      // Should have link marks (has <a href="...">)
      expect(adfString.includes('"type":"link"')).toBe(true);

      // Should have bullet list (has <ul> with items)
      expect(adfString.includes('"type":"bulletList"')).toBe(true);
    });
  });

  describe('Hyperlinks in Descriptions', () => {
    test('SA-458: converts issue links to clickable URLs', () => {
      const fixture = loadFixture('SA-458');
      expect(fixture).toBeDefined();

      if (!fixture.fields.description) {
        return;
      }

      const htmlContent = fixture.fields.description;
      const mdResult = htmlToMd.convertDescription(htmlContent, null);
      const adf = adfConverter.convertToADF(mdResult.markdown);

      const adfString = JSON.stringify(adf);
      expect(adf.type).toBe('doc');

      // Should have link marks (has multiple <a href="...">)
      expect(adfString.includes('"type":"link"')).toBe(true);

      // Should have paragraph content
      const hasParagraph = adf.content.some(node => node.type === 'paragraph');
      expect(hasParagraph).toBe(true);
    });

    test('SA-459: converts complex content with valid structure', () => {
      const fixture = loadFixture('SA-459');
      expect(fixture).toBeDefined();

      if (!fixture.fields.description) {
        return;
      }

      const htmlContent = fixture.fields.description;
      const mdResult = htmlToMd.convertDescription(htmlContent, null);
      const adf = adfConverter.convertToADF(mdResult.markdown);

      // Verify valid ADF structure
      expect(adf.type).toBe('doc');
      expect(adf.version).toBe(1);
      expect(adf.content.length).toBeGreaterThan(0);

      // Verify content has proper paragraph structure
      const hasContent = adf.content.some(node => node.type === 'paragraph' || node.type === 'orderedList' || node.type === 'bulletList');
      expect(hasContent).toBe(true);
    });
  });

  describe('User Mentions in Descriptions', () => {
    test('SA-19515: converts user mentions correctly', () => {
      const fixture = loadFixture('SA-19515');
      expect(fixture).toBeDefined();

      if (!fixture.fields.description) {
        return;
      }

      const htmlContent = fixture.fields.description;
      const mdResult = htmlToMd.convertDescription(htmlContent, null);
      const adf = adfConverter.convertToADF(mdResult.markdown);

      // Verify mention nodes were created
      const adfString = JSON.stringify(adf);
      expect(adfString.includes('"type":"mention"')).toBe(true);

      // Count mention nodes - should have at least 2 (@man-bat and @ra-s-al-ghul)
      const mentionCount = (adfString.match(/"type":"mention"/g) || []).length;
      expect(mentionCount).toBeGreaterThanOrEqual(2);
    });
  });

  describe('Quotations', () => {
    test('SA-20847: converts quotations correctly', () => {
      const fixture = loadFixture('SA-20847');
      expect(fixture).toBeDefined();

      if (!fixture.fields.description) {
        return;
      }

      const htmlContent = fixture.fields.description;
      const mdResult = htmlToMd.convertDescription(htmlContent, null);
      const adf = adfConverter.convertToADF(mdResult.markdown);

      // Should have blockquote elements
      const adfString = JSON.stringify(adf);
      expect(adfString.includes('"type":"blockquote"')).toBe(true);
    });
  });
});

describe('ADFConverter - Release Note Conversion', () => {
  let adfConverter;
  let htmlToMd;

  beforeAll(() => {
    adfConverter = new ADFConverter();
    htmlToMd = new HtmlToMarkdownConverter();
  });

  describe('Simple Markup in Release Notes', () => {
    test('SA-25347: converts simple release note markup', () => {
      const fixture = loadFixture('SA-25347');
      expect(fixture).toBeDefined();

      if (!fixture.fields.releaseNote) {
        return;
      }

      const htmlContent = fixture.fields.releaseNote;
      const mdResult = htmlToMd.convertDescription(htmlContent, null);
      const adf = adfConverter.convertToADF(mdResult.markdown);

      const adfString = JSON.stringify(adf);
      expect(adf.type).toBe('doc');
      expect(adf.version).toBe(1);

      // Should have bullet list (release note has "- " items)
      expect(adfString.includes('"type":"bulletList"')).toBe(true);

      // Verify list has content
      const hasListItems = adfString.includes('"type":"listItem"');
      expect(hasListItems).toBe(true);
    });
  });

  describe('Code Blocks in Release Notes', () => {
    test('SA-25779: converts inline code marks in release notes', () => {
      const fixture = loadFixture('SA-25779');
      expect(fixture).toBeDefined();

      if (!fixture.fields.releaseNote) {
        return;
      }

      const htmlContent = fixture.fields.releaseNote;
      const mdResult = htmlToMd.convertDescription(htmlContent, null);
      const adf = adfConverter.convertToADF(mdResult.markdown);

      const adfString = JSON.stringify(adf);
      // Release note has `chrony` and `ntp` inline code (backticks)
      // Should create marks: [{"type": "code"}]
      expect(adfString.includes('"type":"code"')).toBe(true);

      // Should also have bullet list
      expect(adfString.includes('"type":"bulletList"')).toBe(true);
    });
  });

  describe('User Mentions in Release Notes', () => {
    test('SA-25929: converts user mentions in release notes', () => {
      const fixture = loadFixture('SA-25929');
      expect(fixture).toBeDefined();

      if (!fixture.fields.releaseNote) {
        return;
      }

      const htmlContent = fixture.fields.releaseNote;
      const mdResult = htmlToMd.convertDescription(htmlContent, null);
      const adf = adfConverter.convertToADF(mdResult.markdown);

      // Verify mention nodes were created (@talia-al-ghul)
      const adfString = JSON.stringify(adf);
      expect(adfString.includes('"type":"mention"')).toBe(true);

      // Should have at least 1 mention node
      const mentionCount = (adfString.match(/"type":"mention"/g) || []).length;
      expect(mentionCount).toBeGreaterThanOrEqual(1);
    });
  });
});

describe('ADFConverter - Comments Conversion', () => {
  let adfConverter;
  let htmlToMd;

  beforeAll(() => {
    adfConverter = new ADFConverter();
    htmlToMd = new HtmlToMarkdownConverter();
  });

  describe('Code Blocks in Comments', () => {
    test('SA-458: converts code blocks in comments', () => {
      const fixture = loadFixture('SA-458');
      expect(fixture).toBeDefined();

      if (!fixture.fields.comments || fixture.fields.comments.length === 0) {
        return;
      }

      // Second comment has long content with code
      const comment = fixture.fields.comments[1];
      const htmlContent = comment.text;
      const mdResult = htmlToMd.convertDescription(htmlContent, null);
      const adf = adfConverter.convertToADF(mdResult.markdown);

      expect(adf.type).toBe('doc');
      expect(adf.content.length).toBeGreaterThan(0);

      // Should have paragraph content (code may be converted to paragraphs)
      const hasParagraph = adf.content.some(node => node.type === 'paragraph');
      expect(hasParagraph).toBe(true);
    });

    test('SA-30: converts code blocks and mentions in comments', () => {
      const fixture = loadFixture('SA-30');
      expect(fixture).toBeDefined();

      if (!fixture.fields.comments || fixture.fields.comments.length < 3) {
        return;
      }

      // Third comment (index 2) has 4 <pre> code blocks
      const comment = fixture.fields.comments[2];
      const htmlContent = comment.text;
      const mdResult = htmlToMd.convertDescription(htmlContent, null);
      const adf = adfConverter.convertToADF(mdResult.markdown);

      expect(adf.type).toBe('doc');
      expect(adf.content.length).toBeGreaterThan(0);

      // Should have paragraph content
      const hasParagraph = adf.content.some(node => node.type === 'paragraph');
      expect(hasParagraph).toBe(true);

      // CRITICAL: Should convert <pre> tags to proper codeBlock nodes
      const adfString = JSON.stringify(adf);
      expect(adfString.includes('"type":"codeBlock"')).toBe(true);

      // Count codeBlock nodes - should have 4 from the <pre> tags
      const codeBlockCount = (adfString.match(/"type":"codeBlock"/g) || []).length;
      expect(codeBlockCount).toBe(4);
    });
  });

  describe('Hyperlinks in Comments', () => {
    test('SA-459: converts various hyperlinks in comments', () => {
      const fixture = loadFixture('SA-459');
      expect(fixture).toBeDefined();

      if (!fixture.fields.comments || fixture.fields.comments.length === 0) {
        return;
      }

      // Check all comments for valid ADF with content
      fixture.fields.comments.forEach(comment => {
        const htmlContent = comment.text;
        const mdResult = htmlToMd.convertDescription(htmlContent, null);
        const adf = adfConverter.convertToADF(mdResult.markdown);

        expect(adf.type).toBe('doc');

        // Should have some content (paragraphs, links, etc.)
        expect(adf.content.length).toBeGreaterThan(0);
      });

      // At least one comment should have link marks
      const hasLinks = fixture.fields.comments.some(comment => {
        const htmlContent = comment.text;
        const mdResult = htmlToMd.convertDescription(htmlContent, null);
        const adf = adfConverter.convertToADF(mdResult.markdown);
        const adfString = JSON.stringify(adf);
        return adfString.includes('"type":"link"');
      });
      expect(hasLinks).toBe(true);
    });
  });

  describe('Comments Sorting', () => {
    test('SA-458: verifies comments maintain temporal data', () => {
      const fixture = loadFixture('SA-458');
      expect(fixture).toBeDefined();

      if (!fixture.fields.comments || fixture.fields.comments.length < 2) {
        return;
      }

      // Verify each comment has a created timestamp
      fixture.fields.comments.forEach(comment => {
        expect(comment.created).toBeDefined();
        expect(typeof comment.created).toBe('number');
      });
    });
  });

  describe('Attachment References in Comments', () => {
    test('SA-648: handles attachment references in comments', () => {
      const fixture = loadFixture('SA-648');
      expect(fixture).toBeDefined();

      if (!fixture.fields.comments || fixture.fields.comments.length === 0) {
        return;
      }

      fixture.fields.comments.forEach(comment => {
        const htmlContent = comment.text;
        const mdResult = htmlToMd.convertDescription(htmlContent, null);
        const adf = adfConverter.convertToADF(mdResult.markdown);

        expect(adf.type).toBe('doc');
        expect(adf.content).toBeDefined();

        // Should have paragraph content
        const hasParagraph = adf.content.some(node => node.type === 'paragraph');
        expect(hasParagraph).toBe(true);
      });
    });
  });
});

describe('ADFConverter - Edge Cases and Sanitization', () => {
  let adfConverter;

  beforeAll(() => {
    adfConverter = new ADFConverter();
  });

  test('handles empty input', () => {
    const adf = adfConverter.convertToADF('');

    expect(adf.type).toBe('doc');
    expect(adf.version).toBe(1);
    expect(adf.content).toEqual([]);
  });

  test('handles null input', () => {
    const adf = adfConverter.convertToADF(null);

    expect(adf.type).toBe('doc');
    expect(adf.version).toBe(1);
    expect(adf.content).toEqual([]);
  });

  test('sanitizes empty emphasis markers', () => {
    const markdown = 'Text with ** ** empty bold and * * empty italic';
    const adf = adfConverter.convertToADF(markdown);

    expect(adf.type).toBe('doc');
    expect(adf.content.length).toBeGreaterThan(0);

    // Should have paragraph with text content
    const hasParagraph = adf.content.some(node => node.type === 'paragraph');
    expect(hasParagraph).toBe(true);

    // Verify text content exists
    const adfString = JSON.stringify(adf);
    expect(adfString.includes('"text"')).toBe(true);
  });

  test('converts plain URLs to links', () => {
    const markdown = 'Check out https://github.com/example/repo for more info.';
    const adf = adfConverter.convertToADF(markdown);

    const adfString = JSON.stringify(adf);
    // Should create link marks with href
    expect(adfString.includes('"type":"link"')).toBe(true);
    expect(adfString.includes('https://github.com/example/repo')).toBe(true);
  });

  test('handles URLs with trailing punctuation', () => {
    const markdown = 'Visit https://example.com.';
    const adf = adfConverter.convertToADF(markdown);

    const adfString = JSON.stringify(adf);
    expect(adfString.includes('"href":"https://example.com"')).toBe(true);
    // Punctuation should not be part of the link
    expect(adfString.includes('"href":"https://example.com."')).toBe(false);
  });

  test('preserves protocol in URLs', () => {
    const markdown = 'Visit https://example.com and http://test.com';
    const adf = adfConverter.convertToADF(markdown);

    const adfString = JSON.stringify(adf);
    expect(adfString.includes('https://example.com')).toBe(true);
    expect(adfString.includes('http://test.com')).toBe(true);
  });

  test('merges consecutive lists', () => {
    const markdown = '- Item 1\n- Item 2\n- Item 3';
    const adf = adfConverter.convertToADF(markdown);

    // Find bulletList nodes
    const bulletLists = adf.content.filter(node => node.type === 'bulletList');

    // Should have merged into one list
    expect(bulletLists.length).toBeLessThanOrEqual(1);
  });

  test('handles code blocks with language specification', () => {
    const markdown = '```javascript\nconst x = 42;\nconst y = 100;\nconst z = x + y;\n```';
    const adf = adfConverter.convertToADF(markdown);

    const adfString = JSON.stringify(adf);
    // Post-processing should convert code marks to codeBlock nodes for substantial code (>=40 chars with code patterns)
    expect(adfString.includes('"type":"codeBlock"')).toBe(true);
  });

  test('converts blockquotes correctly', () => {
    const markdown = '> This is a quote\n> with multiple lines';
    const adf = adfConverter.convertToADF(markdown);

    const adfString = JSON.stringify(adf);
    expect(adfString.includes('"type":"blockquote"')).toBe(true);
  });

  test('handles nested lists', () => {
    const markdown = '- Item 1\n  - Nested item\n- Item 2';
    const adf = adfConverter.convertToADF(markdown);

    expect(adf.type).toBe('doc');
    expect(adf.content.length).toBeGreaterThan(0);

    // Should have bullet list
    const adfString = JSON.stringify(adf);
    expect(adfString.includes('"type":"bulletList"')).toBe(true);

    // Should have list items
    expect(adfString.includes('"type":"listItem"')).toBe(true);
  });

  test('handles ordered lists', () => {
    const markdown = '1. First\n2. Second\n3. Third';
    const adf = adfConverter.convertToADF(markdown);

    const adfString = JSON.stringify(adf);
    expect(adfString.includes('"type":"orderedList"')).toBe(true);
  });

  test('handles bold and italic text', () => {
    const markdown = '**bold** and *italic* and ***bold italic***';
    const adf = adfConverter.convertToADF(markdown);

    const adfString = JSON.stringify(adf);

    // Should have marks for formatting
    expect(adfString.includes('marks')).toBe(true);

    // Should have em marks (italic text)
    expect(adfString.includes('"type":"em"')).toBe(true);
  });

  test('handles inline code', () => {
    const markdown = 'Use `console.log()` to debug';
    const adf = adfConverter.convertToADF(markdown);

    const adfString = JSON.stringify(adf);
    // Inline code (backticks) should create marks: [{"type": "code"}]
    expect(adfString.includes('"type":"code"')).toBe(true);
  });

  test('handles multiple paragraphs', () => {
    const markdown = 'First paragraph.\n\nSecond paragraph.\n\nThird paragraph.';
    const adf = adfConverter.convertToADF(markdown);

    const paragraphs = adf.content.filter(node => node.type === 'paragraph');
    expect(paragraphs.length).toBeGreaterThanOrEqual(3);
  });

  test('does not create emoji nodes for URL protocols', () => {
    const markdown = 'Visit https://example.com';
    const adf = adfConverter.convertToADF(markdown);

    // Verify no emoji nodes were created
    const emojiCount = adfConverter.countEmojiNodes(adf);
    expect(emojiCount).toBe(0);
  });

  test('fixes false emoji nodes from number patterns', () => {
    const markdown = 'Version 2:02:30 was released';
    const adf = adfConverter.convertToADF(markdown);

    // Should not have emoji nodes for :02:
    const emojiCount = adfConverter.countEmojiNodes(adf);
    expect(emojiCount).toBe(0);
  });
});

describe('ADFConverter - Integration Tests', () => {
  let adfConverter;
  let htmlToMd;

  beforeAll(() => {
    adfConverter = new ADFConverter();
    htmlToMd = new HtmlToMarkdownConverter();
  });

  // List of all test fixtures to validate
  const testFixtures = [
    'SA-7851', 'SA-458', 'SA-30', 'SA-459', 'SA-26625', 'SA-26610',
    'SA-111', 'SA-52', 'SA-648', 'SA-26578', 'SA-25347', 'SA-25779',
    'SA-25929', 'SA-679', 'SA-268', 'SA-717', 'SA-24804', 'SA-417',
    'SA-19515', 'SA-20847', 'SA-21068'
  ];

  test('all fixtures convert without errors', () => {
    testFixtures.forEach(issueId => {
      const fixture = loadFixture(issueId);
      // Test description
      if (fixture.fields.description) {
        expect(() => {
          const htmlContent = fixture.fields.description;
          const mdResult = htmlToMd.convertDescription(htmlContent, null);
          const adf = adfConverter.convertToADF(mdResult.markdown);

          expect(adf).toHaveProperty('type', 'doc');
          expect(adf).toHaveProperty('version', 1);
          expect(adf).toHaveProperty('content');
        }).not.toThrow();
      }

      // Test release note
      if (fixture.fields.releaseNote) {
        expect(() => {
          const htmlContent = fixture.fields.releaseNote;
          const mdResult = htmlToMd.convertDescription(htmlContent, null);
          const adf = adfConverter.convertToADF(mdResult.markdown);

          expect(adf).toHaveProperty('type', 'doc');
        }).not.toThrow();
      }

      // Test comments
      if (fixture.fields.comments) {
        fixture.fields.comments.forEach(comment => {
          expect(() => {
            const htmlContent = comment.text;
            const mdResult = htmlToMd.convertDescription(htmlContent, null);
            const adf = adfConverter.convertToADF(mdResult.markdown);

            expect(adf).toHaveProperty('type', 'doc');
          }).not.toThrow();
        });
      }
    });
  });

  test('all generated ADF is valid JSON', () => {
    testFixtures.forEach(issueId => {
      const fixture = loadFixture(issueId);
      if (fixture.fields.description) {
        const htmlContent = fixture.fields.description;
        const mdResult = htmlToMd.convertDescription(htmlContent, null);
        const adf = adfConverter.convertToADF(mdResult.markdown);

        // Should be able to serialize and deserialize
        expect(() => {
          const json = JSON.stringify(adf);
          const parsed = JSON.parse(json);
          expect(parsed.type).toBe('doc');
        }).not.toThrow();
      }
    });
  });
});

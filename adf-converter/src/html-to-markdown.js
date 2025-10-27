import TurndownService from 'turndown';
import * as cheerio from 'cheerio';

export class HtmlToMarkdownConverter {
  constructor() {
    this.turndown = new TurndownService({
      headingStyle: 'atx',
      codeBlockStyle: 'fenced',
      bulletListMarker: '*',
      emDelimiter: '*',
    });

    // Add custom rules for YouTrack-specific elements
    this.addCustomRules();
  }

  addCustomRules() {
    // Handle inline code with class="inline-code"
    this.turndown.addRule('inlineCode', {
      filter: (node) => {
        return (
          node.nodeName === 'CODE' &&
          node.className &&
          node.className.includes('inline-code')
        );
      },
      replacement: (content) => {
        return '`' + content + '`';
      },
    });

    // Handle code blocks with class="wikicode"
    this.turndown.addRule('wikiCodeBlock', {
      filter: (node) => {
        return (
          node.nodeName === 'PRE' &&
          node.className &&
          (node.className.includes('wikicode') || node.className.includes('prettyprint'))
        );
      },
      replacement: (content) => {
        return '\n```\n' + content + '\n```\n';
      },
    });

    // Handle blockquotes
    this.turndown.addRule('blockquote', {
      filter: 'blockquote',
      replacement: (content) => {
        // Convert to markdown blockquote
        return '\n> ' + content.trim().replace(/\n/g, '\n> ') + '\n';
      },
    });

    // Handle YouTrack issue links
    this.turndown.addRule('youtrackIssueLink', {
      filter: (node) => {
        return (
          node.nodeName === 'A' &&
          node.getAttribute('href') &&
          node.getAttribute('href').startsWith('/issue/')
        );
      },
      replacement: (content, node) => {
        // Extract issue ID from the link
        const href = node.getAttribute('href');
        const issueId = href.replace('/issue/', '');
        return issueId; // Just return the issue ID (e.g., SA-648)
      },
    });

    // Handle attachment links
    this.turndown.addRule('attachmentLink', {
      filter: (node) => {
        return (
          node.nodeName === 'A' &&
          node.className &&
          (node.className.includes('attachment') || node.className.includes('file-attachment'))
        );
      },
      replacement: (content, node) => {
        const href = node.getAttribute('href');
        const filename = content || href.split('/').pop();
        return `[attachment:${filename}]`;
      },
    });

    // Handle user mentions
    this.turndown.addRule('userMention', {
      filter: (node) => {
        return (
          node.nodeName === 'SPAN' &&
          node.className &&
          (node.className.includes('user-mention') || node.className.includes('mention'))
        );
      },
      replacement: (content) => {
        // Extract username, remove @ if present
        const username = content.trim().replace(/^@/, '');
        return `@${username}`;
      },
    });

    // Handle wiki div wrappers - just extract content
    this.turndown.addRule('wikiDiv', {
      filter: (node) => {
        return (
          node.nodeName === 'DIV' &&
          node.className &&
          (node.className.includes('wiki text') || node.className.includes('prewrapped'))
        );
      },
      replacement: (content) => {
        return content;
      },
    });

    // Handle list items with wiki-list classes
    this.turndown.addRule('wikiList', {
      filter: (node) => {
        return (
          node.nodeName === 'UL' &&
          node.className &&
          node.className.match(/wiki-list\d+/)
        );
      },
      replacement: (content) => {
        return content;
      },
    });
  }

  /**
   * Detect if a description contains HTML (old Wiki format)
   * @param {string} description
   * @returns {boolean}
   */
  isHtmlContent(description) {
    if (!description) return false;

    // First, remove markdown autolinks (angle-bracketed URLs) to avoid false positives
    // Format: <https://...> or <http://...>
    const withoutAutolinks = description.replace(/<https?:\/\/[^>\s]+>/g, '');

    // Check for HTML tags in the remaining content
    const htmlPattern = /<[^>]+>/;
    return htmlPattern.test(withoutAutolinks);
  }

  /**
   * Pre-process HTML before conversion
   * Handles YouTrack-specific HTML quirks
   * @param {string} html
   * @returns {string}
   */
  preprocessHtml(html) {
    if (!html) return '';

    const $ = cheerio.load(html);

    // Convert <br> and <br/> to paragraph breaks for better Turndown processing
    $('br').replaceWith('</p><p>');

    // Handle YouTrack issue links - extract just the issue ID
    $('a[href^="/issue/"]').each((i, elem) => {
      const $elem = $(elem);
      const href = $elem.attr('href');
      const issueId = href.replace('/issue/', '');
      $elem.replaceWith(issueId);
    });

    // Remove wiki wrapper divs but keep content
    $('div.wiki.text').each((i, elem) => {
      const $elem = $(elem);
      const content = $elem.html();
      $elem.replaceWith(content);
    });

    // Wrap content in paragraph tags if not already wrapped
    const html_str = $.html();
    if (!html_str.includes('<p>')) {
      return `<p>${html_str}</p>`;
    }

    return html_str;
  }

  /**
   * Convert HTML to Markdown
   * @param {string} html
   * @returns {string}
   */
  convert(html) {
    if (!html) return '';

    // Pre-process the HTML
    const preprocessed = this.preprocessHtml(html);

    // Convert to markdown
    let markdown = this.turndown.turndown(preprocessed);

    // Post-process: clean up extra whitespace
    markdown = markdown
      .replace(/\n{3,}/g, '\n\n') // Replace 3+ newlines with 2
      .trim();

    return markdown;
  }

  /**
   * Convert issue description to markdown, detecting format automatically
   * @param {string} description - The issue description
   * @param {string} wikifiedDescription - The wikified (HTML) version
   * @returns {Object} { markdown: string, wasConverted: boolean, originalFormat: string }
   */
  convertDescription(description, wikifiedDescription) {
    if (!description) {
      return {
        markdown: '',
        wasConverted: false,
        originalFormat: 'empty',
      };
    }

    // If description contains HTML, it's old Wiki format
    if (this.isHtmlContent(description)) {
      const result = this.convert(description);
      return {
        markdown: result,
        wasConverted: true,
        originalFormat: 'youtrack-wiki',
      };
    }

    // If description is already markdown (no HTML tags), return as-is
    return {
      markdown: description,
      wasConverted: false,
      originalFormat: 'markdown',
    };
  }
}

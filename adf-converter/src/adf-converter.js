import md2adf from 'md-to-adf';

export class ADFConverter {
  /**
   * Sanitize markdown to prevent empty text nodes that cause md-to-adf errors
   * @param {string} markdown
   * @returns {string} Sanitized markdown
   */
  sanitizeMarkdown(markdown) {
    let sanitized = markdown;

    // Remove empty emphasis markers that would create empty text nodes
    // Match ** ** or ____ with only whitespace
    sanitized = sanitized.replace(/\*\*\s*\*\*/g, '');
    sanitized = sanitized.replace(/__\s*__/g, '');
    sanitized = sanitized.replace(/\*\s*\*/g, '');
    sanitized = sanitized.replace(/_\s+_/g, '');

    // Remove empty bold+italic combinations
    sanitized = sanitized.replace(/\*\*\*\s*\*\*\*/g, '');
    sanitized = sanitized.replace(/___\s*___/g, '');

    // Remove empty strikethrough
    sanitized = sanitized.replace(/~~\s*~~/g, '');

    // Remove empty code backticks
    sanitized = sanitized.replace(/`\s*`/g, '');

    // Fix emphasis markers with only spaces inside
    sanitized = sanitized.replace(/(\*\*|__)\s+(\*\*|__)/g, ' ');

    // Remove trailing spaces before newlines (can cause empty nodes)
    sanitized = sanitized.replace(/ +$/gm, '');

    // Remove empty list items
    sanitized = sanitized.replace(/^[*\-+]\s*$/gm, '');
    sanitized = sanitized.replace(/^\d+\.\s*$/gm, '');

    // Collapse multiple consecutive blank lines to max 2
    sanitized = sanitized.replace(/\n{3,}/g, '\n\n');

    // Remove leading/trailing whitespace from the entire string
    sanitized = sanitized.trim();

    return sanitized;
  }

  /**
   * Convert Markdown to Atlassian Document Format (ADF)
   * @param {string} markdown
   * @returns {Object} ADF JSON object
   */
  convertToADF(markdown) {
    if (!markdown) {
      return {
        version: 1,
        type: 'doc',
        content: []
      };
    }

    try {
      // Sanitize markdown to prevent empty text nodes
      let processed = this.sanitizeMarkdown(markdown);

      // Remove unnecessary markdown escapes that shouldn't be in ADF
      // Remove backslash before periods (numbered lists)
      processed = processed.replace(/(\d+)\\\./g, '$1.');

      // Remove backslash before brackets
      processed = processed.replace(/\\\[/g, '[');
      processed = processed.replace(/\\\]/g, ']');

      // Remove backslash before parentheses
      processed = processed.replace(/\\\(/g, '(');
      processed = processed.replace(/\\\)/g, ')');

      // Prevent md-to-adf from treating URL protocols and patterns as emoji codes
      // Replace patterns that look like emojis with placeholders
      // Use {{...}} which won't be interpreted as markdown syntax
      // Pattern 1: :// in URLs
      processed = processed.replace(/:\/\//g, '{{PROTOCOL}}');

      // Pattern 2: :NUMBER: (like :02:)
      processed = processed.replace(/:(\d+):/g, (match, num) => `{{COLON_NUM_${num}}}`);

      // Convert user mentions: @username → [~username] (ADF will handle this)
      // Note: md-to-adf might not handle Jira-style mentions, so we'll need to post-process
      processed = processed.replace(/@(\w+(?:\.\w+)*)/g, '[@$1]');

      // Convert attachment links: [attachment:filename] → attachment marker
      // We'll handle this in post-processing
      processed = processed.replace(/\[attachment:([^\]]+)\]/g, '[ATTACHMENT:$1]');

      // Use md-to-adf to convert markdown to ADF
      const rawResult = md2adf(processed);

      // md-to-adf returns a special object - convert to plain JSON and back
      const adf = JSON.parse(JSON.stringify(rawResult));

      // Post-process the ADF to handle custom elements and clean up placeholders
      this.postProcessADF(adf);

      return adf;
    } catch (error) {
      console.error('Error converting to ADF format:', error);

      // Return a fallback ADF with the original text
      return {
        version: 1,
        type: 'doc',
        content: [
          {
            type: 'paragraph',
            content: [
              {
                type: 'text',
                text: markdown
              }
            ]
          }
        ]
      };
    }
  }

  /**
   * Post-process ADF to handle custom elements
   * @param {Object} adf - The ADF document
   */
  postProcessADF(adf) {
    if (!adf || !adf.content) return;

    this.processNodes(adf.content);
    this.fixFalseEmojiNodes(adf.content);
    this.mergeConsecutiveLists(adf.content);
    this.restorePlaceholders(adf); // Restore placeholders BEFORE URL conversion
    this.convertUrlsToLinks(adf.content); // Convert URLs after placeholders are restored
  }

  /**
   * Merge consecutive ordered or bullet lists into single lists
   * md-to-adf sometimes creates separate list nodes for each item
   * @param {Array} nodes - Array of ADF nodes
   */
  mergeConsecutiveLists(nodes) {
    if (!Array.isArray(nodes)) return;

    let i = 0;
    while (i < nodes.length - 1) {
      const current = nodes[i];
      const next = nodes[i + 1];

      // Check if both nodes are the same type of list
      if (
        current &&
        next &&
        current.type === next.type &&
        (current.type === 'orderedList' || current.type === 'bulletList') &&
        Array.isArray(current.content) &&
        Array.isArray(next.content)
      ) {
        // Merge next list's items into current list
        current.content.push(...next.content);

        // Remove the next node
        nodes.splice(i + 1, 1);

        // Don't increment i, check if there are more consecutive lists
        continue;
      }

      // Recursively process nested content
      if (current && current.content && Array.isArray(current.content)) {
        this.mergeConsecutiveLists(current.content);
      }

      i++;
    }

    // Process the last node's content if it exists
    if (nodes.length > 0) {
      const last = nodes[nodes.length - 1];
      if (last && last.content && Array.isArray(last.content)) {
        this.mergeConsecutiveLists(last.content);
      }
    }
  }

  /**
   * Restore placeholders back to original characters in all text nodes
   * @param {Object} obj - Object to process
   */
  restorePlaceholders(obj) {
    if (!obj || typeof obj !== 'object') return;

    const traverse = (node) => {
      if (!node || typeof node !== 'object') return;

      // If this is a text node, restore placeholders in text
      if (node.type === 'text' && node.text && typeof node.text === 'string') {
        // Restore :// for URLs
        node.text = node.text.replace(/\{\{PROTOCOL\}\}/g, '://');

        // Restore :NUMBER: patterns
        node.text = node.text.replace(/\{\{COLON_NUM_(\d+)\}\}/g, ':$1:');
      }

      // Also restore placeholders in link marks (if any)
      if (node.marks && Array.isArray(node.marks)) {
        node.marks.forEach(mark => {
          if (mark.type === 'link' && mark.attrs && mark.attrs.href) {
            mark.attrs.href = mark.attrs.href.replace(/\{\{PROTOCOL\}\}/g, '://');
            mark.attrs.href = mark.attrs.href.replace(/\{\{COLON_NUM_(\d+)\}\}/g, ':$1:');
          }
        });
      }

      // Recursively process all nested objects and arrays
      if (Array.isArray(node)) {
        node.forEach(item => traverse(item));
      } else {
        for (const key in node) {
          if (node.hasOwnProperty(key) && node[key] && typeof node[key] === 'object') {
            traverse(node[key]);
          }
        }
      }
    };

    traverse(obj);
  }

  /**
   * Convert plain text URLs to clickable links with ADF marks
   * @param {Array} nodes - Array of ADF nodes
   */
  convertUrlsToLinks(nodes) {
    if (!Array.isArray(nodes)) return;

    // URL regex pattern - matches http(s):// URLs
    const urlRegex = /(https?:\/\/[^\s]+)/g;

    for (let i = 0; i < nodes.length; i++) {
      const node = nodes[i];

      if (!node || typeof node !== 'object') continue;

      // Process text nodes that contain URLs
      if (node.type === 'text' && node.text) {
        const text = node.text;
        const matches = [...text.matchAll(urlRegex)];

        // If the entire text is a single URL, just add link mark
        if (matches.length === 1 && matches[0][0] === text) {
          if (!node.marks) {
            node.marks = [];
          }
          // Add link mark if not already present
          if (!node.marks.some(mark => mark.type === 'link')) {
            node.marks.push({
              type: 'link',
              attrs: {
                href: text
              }
            });
          }
        } else if (matches.length > 0) {
          // Text contains URLs mixed with other text - split into multiple nodes
          const newNodes = [];
          let lastIndex = 0;

          matches.forEach(match => {
            const url = match[0];
            const urlIndex = match.index;

            // Add text before URL
            if (urlIndex > lastIndex) {
              newNodes.push({
                type: 'text',
                text: text.substring(lastIndex, urlIndex),
                ...(node.marks && { marks: node.marks })
              });
            }

            // Add URL as link
            newNodes.push({
              type: 'text',
              text: url,
              marks: [
                ...(node.marks || []),
                {
                  type: 'link',
                  attrs: {
                    href: url
                  }
                }
              ]
            });

            lastIndex = urlIndex + url.length;
          });

          // Add remaining text after last URL
          if (lastIndex < text.length) {
            newNodes.push({
              type: 'text',
              text: text.substring(lastIndex),
              ...(node.marks && { marks: node.marks })
            });
          }

          // Replace current node with new nodes
          nodes.splice(i, 1, ...newNodes);
          i += newNodes.length - 1;
          continue;
        }
      }

      // Recursively process nested content
      if (node.content && Array.isArray(node.content)) {
        this.convertUrlsToLinks(node.content);
      }
    }
  }

  /**
   * Find first emoji node (for debugging)
   * @param {Object} obj - Object to search
   * @returns {Object|null}
   */
  findFirstEmoji(obj) {
    let found = null;

    const traverse = (node) => {
      if (found) return;
      if (!node || typeof node !== 'object') return;

      if (node.type === 'emoji') {
        found = node;
        return;
      }

      for (const key in node) {
        if (node[key] && typeof node[key] === 'object') {
          traverse(node[key]);
        }
      }
    };

    traverse(obj);
    return found;
  }

  /**
   * Count emoji nodes in ADF (for debugging)
   * @param {Object} obj - Object to search
   * @returns {number}
   */
  countEmojiNodes(obj) {
    let count = 0;

    const traverse = (node) => {
      if (!node || typeof node !== 'object') return;

      if (node.type === 'emoji') count++;

      for (const key in node) {
        if (node[key] && typeof node[key] === 'object') {
          traverse(node[key]);
        }
      }
    };

    traverse(obj);
    return count;
  }

  /**
   * Fix false-positive emoji nodes created by md-to-adf
   * Converts emoji nodes that aren't actual emojis back to text
   * Recursively processes all nested content arrays
   * @param {Array} nodes - Array of ADF nodes
   */
  fixFalseEmojiNodes(nodes) {
    if (!Array.isArray(nodes)) return;

    for (let i = 0; i < nodes.length; i++) {
      const node = nodes[i];

      if (!node || typeof node !== 'object') continue;

      // Check if this is an emoji node with a false-positive shortName
      if (node.type === 'emoji' && node.attrs && node.attrs.shortName) {
        const shortName = node.attrs.shortName;

        // If shortName contains URL patterns, colons with numbers, or long strings, it's not a real emoji
        const isFalseEmoji =
          shortName.includes('://') ||  // URL pattern
          shortName.includes('](') ||   // Markdown link remnant
          shortName.includes('/') ||    // Path separator
          shortName.includes('\\') ||   // Backslash
          /^\d+$/.test(shortName) ||    // Just numbers like "02"
          shortName.length > 30;        // Real emoji codes are short

        if (isFalseEmoji) {
          // Mutate the node in place by changing its type and properties
          node.type = 'text';
          node.text = `:${shortName}:`;
          delete node.attrs;
        }
      }

      // Recursively process content arrays
      if (node.content && Array.isArray(node.content)) {
        this.fixFalseEmojiNodes(node.content);
      }

      // Also check marks arrays
      if (node.marks && Array.isArray(node.marks)) {
        this.fixFalseEmojiNodes(node.marks);
      }
    }
  }

  /**
   * Recursively process ADF nodes
   * @param {Array} nodes - Array of ADF nodes
   */
  processNodes(nodes) {
    if (!Array.isArray(nodes)) return;

    for (let i = 0; i < nodes.length; i++) {
      const node = nodes[i];

      // Process text nodes for mentions and attachments
      if (node.type === 'text' && node.text) {
        const segments = this.splitTextNode(node.text);

        if (segments.length > 1) {
          // Replace this text node with multiple nodes
          const newNodes = segments.map(segment => {
            if (segment.type === 'mention') {
              return {
                type: 'mention',
                attrs: {
                  id: segment.username,
                  text: `@${segment.username}`,
                  accessLevel: ''
                }
              };
            } else if (segment.type === 'attachment') {
              return {
                type: 'text',
                text: `[^${segment.filename}]`
              };
            } else {
              return {
                type: 'text',
                text: segment.text,
                ...(node.marks && { marks: node.marks })
              };
            }
          });

          // Replace the node
          nodes.splice(i, 1, ...newNodes);
          i += newNodes.length - 1;
        } else if (segments.length === 1) {
          // Single segment, check if it needs transformation
          const segment = segments[0];
          if (segment.type === 'mention') {
            nodes[i] = {
              type: 'mention',
              attrs: {
                id: segment.username,
                text: `@${segment.username}`,
                accessLevel: ''
              }
            };
          } else if (segment.type === 'attachment') {
            node.text = `[^${segment.filename}]`;
          }
        }
      }

      // Recursively process child nodes
      if (node.content) {
        this.processNodes(node.content);
      }
    }
  }

  /**
   * Split a text node into segments (text, mentions, attachments)
   * @param {string} text
   * @returns {Array} Array of segments
   */
  splitTextNode(text) {
    const segments = [];
    const regex = /(\[@([^\]]+)\])|(\[ATTACHMENT:([^\]]+)\])/g;
    let lastIndex = 0;
    let match;

    while ((match = regex.exec(text)) !== null) {
      // Add text before the match
      if (match.index > lastIndex) {
        segments.push({
          type: 'text',
          text: text.substring(lastIndex, match.index)
        });
      }

      // Add the matched element
      if (match[2]) {
        // Mention
        segments.push({
          type: 'mention',
          username: match[2]
        });
      } else if (match[4]) {
        // Attachment
        segments.push({
          type: 'attachment',
          filename: match[4]
        });
      }

      lastIndex = regex.lastIndex;
    }

    // Add remaining text
    if (lastIndex < text.length) {
      segments.push({
        type: 'text',
        text: text.substring(lastIndex)
      });
    }

    return segments.length > 0 ? segments : [{ type: 'text', text }];
  }

  /**
   * Process issue for Jira import with ADF
   * @param {Object} issue - YouTrack issue with markdown description
   * @returns {Object} Issue formatted for Jira import with ADF
   */
  processIssueForJira(issue) {
    const adfDescription = this.convertToADF(issue.description);

    const jiraIssue = {
      key: issue.idReadable,
      summary: issue.summary,
      description: adfDescription,
      created: issue.created,
      updated: issue.updated,
      resolved: issue.resolved,
    };

    // Convert comments if present
    if (issue.comments && issue.comments.length > 0) {
      jiraIssue.comments = issue.comments.map(comment => ({
        id: comment.id,
        body: this.convertToADF(comment.text),
        created: comment.created,
        updated: comment.updated,
        author: comment.author
      }));
    }

    return jiraIssue;
  }
}

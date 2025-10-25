import axios from 'axios';

export class YouTrackClient {
  constructor(baseUrl, token) {
    this.baseUrl = baseUrl;
    this.token = token;
    this.client = axios.create({
      baseURL: baseUrl,
      headers: {
        'Authorization': `Bearer ${token}`,
        'Accept': 'application/json',
      },
    });
  }

  /**
   * Fetch issues from YouTrack with specified fields
   * @param {string} query - YouTrack query (e.g., "project: SA")
   * @param {Array<string>} fields - Fields to retrieve
   * @param {number} skip - Number of issues to skip (for pagination)
   * @param {number} top - Number of issues to retrieve (max 100)
   * @returns {Promise<Array>} Array of issues
   */
  async fetchIssues(query, fields = [], skip = 0, top = 100) {
    const defaultFields = [
      'id',
      'idReadable',
      'numberInProject',
      'summary',
      'description',
      'wikifiedDescription',
      'created',
      'updated',
      'resolved',
      'customFields(id,name,value(id,name,text,markdownText))',
      'comments(id,text,created,author(login,fullName))',
    ];

    const fieldsToFetch = fields.length > 0 ? fields : defaultFields;

    try {
      // Manually construct URL with query parameters to ensure proper encoding
      const fieldsParam = encodeURIComponent(fieldsToFetch.join(','));
      const queryParam = encodeURIComponent(query);
      const url = `/api/issues?query=${queryParam}&fields=${fieldsParam}&$skip=${skip}&$top=${top}`;

      const response = await this.client.get(url);
      return response.data;
    } catch (error) {
      console.error('Error fetching issues:', error.message);
      if (error.response) {
        console.error('Response status:', error.response.status);
        console.error('Response data:', error.response.data);
      }
      throw error;
    }
  }

  /**
   * Fetch all issues matching a query (handles pagination)
   * @param {string} query - YouTrack query
   * @param {Array<string>} fields - Fields to retrieve
   * @returns {Promise<Array>} Array of all issues
   */
  async fetchAllIssues(query, fields = []) {
    const allIssues = [];
    let skip = 0;
    const batchSize = 100;
    let hasMore = true;
    let previousBatchSize = 0;

    console.log(`Fetching issues with query: ${query}`);

    while (hasMore) {
      console.log(`Fetching batch starting at ${skip}...`);
      const issues = await this.fetchIssues(query, fields, skip, batchSize);

      if (issues.length === 0) {
        hasMore = false;
      } else {
        allIssues.push(...issues);

        // If this batch is smaller than the previous one, we've reached the end
        if (previousBatchSize > 0 && issues.length < previousBatchSize) {
          console.log(`Fetched ${allIssues.length} issues total (last batch was smaller)`);
          hasMore = false;
        } else {
          previousBatchSize = issues.length;
          skip += issues.length;
          console.log(`Fetched ${allIssues.length} issues so far...`);
        }
      }
    }

    console.log(`Total issues fetched: ${allIssues.length}`);
    return allIssues;
  }

  /**
   * Fetch specific issues by IDs
   * @param {Array<string>} issueIds - Array of issue IDs (e.g., ["SA-648", "SA-458"])
   * @param {Array<string>} fields - Fields to retrieve
   * @returns {Promise<Array>} Array of issues
   */
  async fetchIssuesByIds(issueIds, fields = []) {
    if (issueIds.length === 0) {
      return [];
    }

    // Format: "issue id: SA-648, SA-26634, SA-26610"
    const query = `issue id: ${issueIds.join(', ')}`;
    return this.fetchIssues(query, fields, 0, issueIds.length);
  }
}

# Tool Registry

Reference documentation for common tools. This is **NOT** the source of truth for MCP discovery — the `mcp-discovery` skill verifies packages dynamically at runtime.

For any tool not listed here, the discovery skill will check npm/GitHub during setup.

---

## Quick Reference

Common tools and their typical connection methods. Verified packages have been tested; others are discovered dynamically.

| Tool | Typical MCP | API Docs | Status |
|------|-------------|----------|--------|
| **Notion** | `@notionhq/notion-mcp-server` | [developers.notion.com](https://developers.notion.com) | Verified |
| **GitHub** | `@anthropic/mcp-github` | [docs.github.com](https://docs.github.com/en/rest) | Verified |
| **Linear** | `@linear/mcp-linear` | [developers.linear.app](https://developers.linear.app) | Vendor |
| **Figma** | *(code-focused only)* | [figma.com/developers](https://www.figma.com/developers/api) | Use API for reporting |
| **Google Calendar** | `@anthropic/mcp-google-calendar` | [developers.google.com](https://developers.google.com/calendar) | Verified |
| **Gmail** | `@anthropic/mcp-gmail` | [developers.google.com](https://developers.google.com/gmail/api) | Verified |
| **Slack** | Community packages | [api.slack.com](https://api.slack.com) | Community |
| **Asana** | Limited | [developers.asana.com](https://developers.asana.com) | API preferred |
| **GitLab** | Community packages | [docs.gitlab.com](https://docs.gitlab.com/ee/api/) | Community |
| **Bitbucket** | None | [developer.atlassian.com](https://developer.atlassian.com/cloud/bitbucket/) | API only |
| **GA4** | `@anthropic/mcp-google-analytics` | [developers.google.com](https://developers.google.com/analytics) | Verified |
| **Dub.co** | `mcp-dub` | [dub.co/docs](https://dub.co/docs/api-reference) | Community |
| **Plausible** | None | [plausible.io/docs](https://plausible.io/docs/stats-api) | API only |
| **Substack** | None | Limited API | Wrapper needed |
| **Supabase** | `@anthropic/mcp-supabase` | [supabase.com/docs](https://supabase.com/docs/reference) | Verified |

### Status Legend

| Status | Meaning |
|--------|---------|
| **Verified** | Tested and confirmed working by DESIGN-OPS |
| **Vendor** | Published by the tool's vendor |
| **Community** | Community-maintained; verify before using |
| **API only** | No MCP available; use direct API |
| **API preferred** | MCP exists but API recommended for reporting |

---

## Tool Details by Pillar

### Operations Pillar

#### Notion

- **MCP:** `@notionhq/notion-mcp-server` (official)
- **Install:** `claude mcp add notion -- npx -y @notionhq/notion-mcp-server`
- **Auth:** API key from [notion.so/my-integrations](https://notion.so/my-integrations)
- **Reporting data:** Pages, databases, tasks, comments

#### Google Workspace

- **MCPs:** Multiple (Calendar, Gmail, Drive)
- **Auth:** OAuth (browser-based)
- **Components:**
  - Calendar: `claude mcp add google-calendar -- npx -y @anthropic/mcp-google-calendar`
  - Gmail: `claude mcp add gmail -- npx -y @anthropic/mcp-gmail`
  - Drive: `claude mcp add google-drive -- npx -y @anthropic/mcp-google-drive`

#### Linear

- **MCP:** `@linear/mcp-linear` (vendor)
- **Install:** `claude mcp add linear -- npx -y @linear/mcp-linear`
- **Auth:** API key from Linear settings
- **Reporting data:** Issues, projects, cycles, teams

#### Slack

- **MCP:** Community packages available (varies)
- **Auth:** OAuth / Bot Token
- **Note:** Verify specific package before installing

---

### Design Pillar

#### GitHub

- **MCP:** `@anthropic/mcp-github` (official)
- **Install:** `claude mcp add github -- npx -y @anthropic/mcp-github`
- **Auth:** OAuth or PAT
- **Reporting data:** Repos, commits, PRs, issues

#### Figma

- **MCP:** Official MCP is code-focused (not for reporting)
- **Recommended:** Direct API for team/version reporting
- **Auth:** Personal Access Token from [figma.com/developers](https://www.figma.com/developers/api#access-tokens)
- **Reporting data via API:** Files, versions, comments, users

#### GitLab

- **MCP:** Community packages (e.g., `mcp-gitlab`)
- **Auth:** Personal Access Token
- **Note:** Verify package quality before installing

#### Bitbucket

- **MCP:** None available
- **Recommended:** Direct API or custom wrapper
- **Auth:** App password
- **API Docs:** [developer.atlassian.com](https://developer.atlassian.com/cloud/bitbucket/)

---

### Analytics Pillar

#### Google Analytics (GA4)

- **MCP:** `@anthropic/mcp-google-analytics` (official)
- **Install:** `claude mcp add ga4 -- npx -y @anthropic/mcp-google-analytics`
- **Auth:** OAuth
- **Reporting data:** Pageviews, sessions, events, goals

#### Dub.co

- **MCP:** `mcp-dub` (community)
- **Install:** `claude mcp add dubco -- npx -y mcp-dub`
- **Auth:** API key
- **Reporting data:** Links, clicks, referrers, geo

#### Plausible

- **MCP:** None
- **Recommended:** Direct API or custom wrapper
- **Auth:** API key
- **API Docs:** [plausible.io/docs/stats-api](https://plausible.io/docs/stats-api)

#### Substack

- **MCP:** None
- **API:** Basic, unofficial
- **Recommended:** Custom wrapper via `/mcp-builder`
- **Reporting data:** Subscribers, posts, email stats

---

## Restricted/Limited Tools

These tools have significant API restrictions:

| Tool | Limitation | Alternatives |
|------|------------|--------------|
| **Instagram** | Business accounts only, complex approval | Buffer, Sprout Social |
| **Twitter/X** | Paid tiers only ($100+/month) | TweetDeck exports |
| **LinkedIn** | Company pages only, partnership required | Manual tracking |
| **Sketch** | Limited Sketch Cloud API | Export to Figma |

---

## Adding New Tools

For tools not in this registry, the `mcp-discovery` skill will:

1. Search npm for official/vendor MCPs
2. Check for community packages (with quality indicators)
3. Evaluate API documentation
4. Recommend the best connection method

See `skills/mcp-discovery/SKILL.md` for the discovery process.

---

*Last updated: 2025-04-17*
*This is a reference document. Runtime discovery happens via the mcp-discovery skill.*

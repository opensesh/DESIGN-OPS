# Tool Evaluator Skill

Sub-agent skill for evaluating tools during `/design-ops:setup`. Checks MCP availability, API capabilities, and builds capability matrices.

## Purpose

When a user selects tools in the setup flow, this skill evaluates each tool to determine:
1. Is there an MCP available and connected?
2. If no MCP, is there an API suitable for reporting?
3. What data can this tool provide (daily, weekly, monthly)?
4. What's the connection type needed?

## Trigger

Invoked by `/design-ops:setup` during tool evaluation phase. Should run as a background sub-agent.

---

## Input

```yaml
tools:
  - name: "notion"
    pillar: "operations"
  - name: "figma"
    pillar: "design"
  - name: "substack"
    pillar: "analytics"
```

## Output

Returns a capability matrix for each tool:

```yaml
results:
  - tool: notion
    connection_type: mcp
    mcp_name: "notion"
    status: connected    # connected | needs_setup | unavailable
    capabilities:
      data_types: [pages, databases, tasks, comments]
      reporting:
        daily: [recent_pages, task_counts, recent_comments]
        weekly: [page_activity, task_completion]
        monthly: [content_growth]
    setup_required: false

  - tool: figma
    connection_type: api
    api_endpoint: "https://api.figma.com/v1"
    status: needs_token
    capabilities:
      data_types: [files, versions, comments, users]
      reporting:
        daily: [files_edited, active_users]
        weekly: [design_versions, comment_activity]
        monthly: [project_progress]
    setup_required: true
    setup_instructions: "Generate API token at figma.com/developers"

  - tool: substack
    connection_type: custom_wrapper
    api_docs: "https://substack.com/api"
    status: needs_wrapper
    capabilities:
      data_types: [subscribers, posts, email_stats]
      reporting:
        daily: [new_subscribers]
        weekly: [subscriber_growth, post_views]
        monthly: [audience_trends]
    setup_required: true
    setup_instructions: "Create MCP wrapper using /mcp-builder"

  - tool: instagram
    connection_type: unavailable
    status: unavailable
    reason: "API limited to business accounts with complex approval process"
    alternatives: ["Buffer", "Later", "Sprout Social"]
```

---

## Evaluation Process

### Step 1: Check for MCP

Read `~/.claude/settings.json` and check for MCP servers:

```bash
cat ~/.claude/settings.json | jq '.mcpServers'
```

For each tool, check:
1. Is there an MCP with matching name?
2. Is it connected and responding?
3. Does it support reporting-relevant data?

**MCP naming patterns:**
- Notion: `notion`, `@anthropic/mcp-notion`
- GitHub: `github`, `mcp-github`
- Google Workspace: `google-workspace`, `google-calendar`, `gmail`
- Linear: `linear`, `mcp-linear`
- Slack: `slack`, `mcp-slack`

### Step 2: Evaluate MCP Capabilities

If MCP found, determine its reporting capabilities:

**For Notion MCP:**
```yaml
data_types: [pages, databases, tasks, comments]
reporting:
  daily:
    - recent_pages: "search(filter: last_edited_time > 24h)"
    - task_counts: "query_database(filter: status)"
  weekly:
    - page_activity: "Aggregate page creation/modification"
    - task_completion: "Tasks completed this week"
```

**For GitHub MCP:**
```yaml
data_types: [repos, commits, prs, issues]
reporting:
  daily:
    - recent_commits: "list_commits(since: 24h)"
    - open_prs: "list_pull_requests(state: open)"
  weekly:
    - team_contributions: "Commits grouped by author"
    - pr_activity: "PRs opened, merged, closed"
```

### Step 3: Check API If No MCP

If no suitable MCP, consult `references/tool-registry.md` for API information:

1. Does the tool have a public API?
2. What authentication is required?
3. What reporting endpoints exist?
4. Can it provide daily/weekly/monthly data?

### Step 4: Determine Connection Type

Based on evaluation:

| Scenario | Connection Type | Status |
|----------|-----------------|--------|
| MCP found and connected | `mcp` | `connected` |
| MCP exists but not added | `mcp` | `needs_setup` |
| No MCP, API supports reporting | `api` | `needs_token` |
| No MCP, API needs wrapper | `custom_wrapper` | `needs_wrapper` |
| No API or restricted | `unavailable` | `unavailable` |

---

## Known Tool Evaluations

### Operations Pillar

**Notion**
- MCP: Official Notion MCP available
- Capabilities: Pages, databases, blocks, comments, users
- Daily: Recent pages, task counts, comments
- Weekly: Activity summaries, task completion

**Google Workspace**
- MCP: Multiple MCPs (Calendar, Gmail, Drive)
- Capabilities: Events, emails, documents
- Daily: Today's events, unread emails
- Weekly: Meeting count, email volume

**Linear**
- MCP: Community MCP available
- Capabilities: Issues, projects, cycles, teams
- Daily: Issues due, assigned work
- Weekly: Cycle progress, velocity

**Asana**
- MCP: Limited community support
- API: Good reporting API
- Daily: Tasks due, section counts
- Weekly: Project progress

**Slack**
- MCP: Community MCPs available
- Capabilities: Messages, channels, reactions
- Daily: Unread counts, mentions
- Weekly: Channel activity

### Design Pillar

**GitHub**
- MCP: Official GitHub MCP
- Capabilities: Repos, commits, PRs, issues, actions
- Daily: Recent commits, open PRs
- Weekly: Contributions by person, merge activity

**GitLab**
- MCP: Community MCP
- Capabilities: Similar to GitHub
- Daily: Recent commits, merge requests
- Weekly: Pipeline stats, contributions

**Figma**
- MCP: Official MCP (code-focused, NOT for reporting)
- API: Direct API better for reporting
- Capabilities: Files, versions, comments, users
- Daily: Files edited, active users
- Weekly: Version history, comment activity

**Sketch**
- MCP: None
- API: Limited (Sketch Cloud API)
- Status: Often unavailable for reporting

### Analytics Pillar

**Google Analytics (GA4)**
- MCP: Official GA4 MCP
- Capabilities: Pageviews, sessions, events, goals
- Daily: Session count, top pages
- Weekly: Traffic trends, source breakdown

**Dub.co**
- MCP: Unofficial but functional
- Capabilities: Links, clicks, referrers, geo
- Daily: Click counts per link
- Weekly: Top performing links

**Plausible**
- MCP: None
- API: Good reporting API
- Status: Needs wrapper or direct API

**Substack**
- MCP: None
- API: Basic API available
- Status: Needs custom wrapper
- Capabilities: Subscribers, posts, email stats

**Instagram**
- MCP: None
- API: Very limited (business only)
- Status: Often unavailable
- Note: Consider alternatives like Buffer

**Twitter/X**
- MCP: None
- API: Paid tiers only
- Status: Often unavailable

**LinkedIn**
- MCP: None
- API: Limited to company pages
- Status: Restricted

---

## Integration with Setup Flow

### During Chapter 1 (Operations)

```
User selects: [Notion, Google Workspace, Slack]
↓
Spawn tool-evaluator sub-agent:
  - Check Notion MCP → Found, connected
  - Check Google Workspace MCP → Found, connected
  - Check Slack MCP → Found, NOT connected
↓
Return capability matrix
↓
Main agent presents findings with Slack showing "needs_setup"
```

### During Chapter 2 (Design)

```
User selects: [GitHub, Figma]
↓
Spawn tool-evaluator sub-agent:
  - Check GitHub MCP → Found, connected
  - Check Figma MCP → Found, but code-focused (not for reporting)
  - Check Figma API → Available, needs token
↓
Return capability matrix with Figma showing "api" type, "needs_token"
↓
Main agent guides Figma token setup
```

### During Chapter 3 (Analytics)

```
User selects: [GA4, Substack, Instagram]
↓
Spawn tool-evaluator sub-agent:
  - Check GA4 MCP → Found, connected
  - Check Substack → No MCP, API available → needs_wrapper
  - Check Instagram → No MCP, API limited → unavailable
↓
Return capability matrix
↓
Main agent offers to create Substack wrapper, skips Instagram
```

---

## Error Handling

**MCP not responding:**
```yaml
tool: notion
connection_type: mcp
status: error
error: "MCP timeout - server not responding"
suggestion: "Restart Claude or check MCP server"
```

**API evaluation failed:**
```yaml
tool: substack
connection_type: unknown
status: error
error: "Could not evaluate API capabilities"
suggestion: "Check references/tool-registry.md for manual setup"
```

**Unknown tool:**
```yaml
tool: "custom-crm"
connection_type: unknown
status: needs_evaluation
suggestion: "Check if tool has public API documentation"
```

---

## Usage Example

When invoked by setup flow:

```python
# Pseudo-code for sub-agent task

def evaluate_tools(tools: list[str], pillar: str) -> dict:
    results = []

    for tool in tools:
        # Step 1: Check MCP
        mcp_info = check_mcp(tool)

        if mcp_info.found and mcp_info.connected:
            results.append({
                'tool': tool,
                'connection_type': 'mcp',
                'status': 'connected',
                'capabilities': get_mcp_capabilities(mcp_info)
            })
        elif mcp_info.found:
            results.append({
                'tool': tool,
                'connection_type': 'mcp',
                'status': 'needs_setup',
                'setup_instructions': mcp_info.install_command
            })
        else:
            # Step 2: Check API
            api_info = check_api(tool)

            if api_info.suitable_for_reporting:
                results.append({
                    'tool': tool,
                    'connection_type': 'api' if api_info.direct_use else 'custom_wrapper',
                    'status': 'needs_token' if api_info.direct_use else 'needs_wrapper',
                    'capabilities': api_info.capabilities
                })
            else:
                results.append({
                    'tool': tool,
                    'connection_type': 'unavailable',
                    'status': 'unavailable',
                    'reason': api_info.limitation_reason
                })

    return {'results': results}
```

---

## References

- `references/tool-registry.md` — Known tools database with MCP/API status
- `references/mcp-setup/` — MCP installation guides
- `references/config-schema.md` — Config structure for storing results

---

*Version: 1.0*

# /customize

Update your Company Skills preferences without re-running full setup.

## Trigger

User runs `/customize` to modify their existing configuration.

---

## Workflow

### Step 1: Load Current Config

Read `~/.claude/skills-config.yaml` and show current state:

```
## Your Current Setup

**Tools you use:** Google Calendar, Notion, Slack, GitHub

**Connected MCPs:**
✅ GitHub (code search, PRs, issues)
✅ Supabase (database queries)

**Workflows enabled:**
• Daily: morning brief, meeting prep
• Weekly: weekly recap
• As-needed: devils advocate, site analysis

What would you like to change?

1. Add/remove tools I use
2. Change workflow preferences
3. Connect a new MCP
4. Update brand settings
5. Start fresh (re-run /install-skills)
```

### Step 2: Handle Selection

#### Option 1: Add/Remove Tools

```
## Tools You Use

Currently: Google Calendar, Notion, Slack, GitHub

These help me understand your context. What would you like to change?

Add tools: [type names to add, comma-separated]
Remove tools: [type names to remove]
Or say "looks good" to keep as-is.
```

After input, update `tools_used` in config.

#### Option 2: Change Workflow Preferences

```
## Workflow Preferences

Select what you want enabled:

**Daily workflows:**
[x] Morning brief — /daily-brief
[x] Meeting prep — /meeting-brief, /meeting-recap

**Weekly workflows:**
[x] Weekly recap — /weekly-recap

**As-needed tools:**
[x] Decision support — /devils-advocate, /pre-mortem
[ ] Research — /site-analysis
[x] Content — /social-post, /case-study

Toggle any of these? (e.g., "disable research" or "enable research")
```

After input, update `workflows` in config.

#### Option 3: Connect a New MCP

Redirect to `/add-tool`:

```
Let me help you connect a new tool.
```

[Run /add-tool flow]

#### Option 4: Update Brand Settings

```
## Brand Settings

Currently: [not set / Company Name]

Brand settings help me match your tone and style in content.

**Company/Brand name:**
> [current or empty]

**Voice/Tone description:**
(e.g., "friendly but professional", "technical and precise", "casual and fun")
> [current or empty]

What would you like to update?
```

After input, update `brand` section in config:

```yaml
brand:
  name: "Acme Co"
  voice: "friendly, technical, concise"
```

#### Option 5: Start Fresh

```
This will reset your config and re-run the full setup.

Your current config will be backed up to:
~/.claude/skills-config.yaml.backup

Continue? [Yes / No]
```

If yes:
1. Backup current config
2. Delete config
3. Run `/install-skills`

---

## Config File Format

Reference for what gets updated:

```yaml
# ~/.claude/skills-config.yaml

version: 1.0
created: 2026-04-03T10:30:00Z
updated: 2026-04-03T14:15:00Z  # Add/update on changes

tools_used:
  - Google Calendar
  - Notion
  - Slack
  - GitHub

mcp_connected:
  - name: github
    capabilities: [code_search, pull_requests, issues]
  - name: supabase
    capabilities: [database, auth, storage]

workflows:
  daily:
    - morning_brief
    - meeting_prep
  weekly:
    - weekly_recap
  as_needed:
    - devils_advocate
    - pre_mortem
    - site_analysis

brand:
  name: "Acme Co"
  voice: "friendly, technical, concise"
```

---

## Confirmation

After any change:

```
✅ Config updated!

Changed:
• Added "Linear" to tools
• Enabled "research" workflow

Your commands will reflect these changes immediately.

Anything else to customize?
```

---

## No Config Found

If `~/.claude/skills-config.yaml` doesn't exist:

```
You don't have a config yet.

Run /install-skills to set up your personalized workflows (2 min).
```

---

## Quick Edits

For power users, also support quick inline edits:

```
/customize add tool Figma
/customize disable weekly-recap
/customize set brand-voice "technical and direct"
```

Parse these and apply directly without the interactive flow.

---

*Version: 1.0*

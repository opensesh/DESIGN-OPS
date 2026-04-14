# /dcs:setup

Main onboarding wizard for Design Company Skills. Sets up integrations, preferences, and verifies everything works.

## Trigger

User runs `/dcs:setup` to configure the plugin. Works in:
- Claude Code CLI (terminal) — full interactive setup
- Claude Desktop (Code tab) — full interactive setup
- Claude Co-work (web) — read-only mode, directs to terminal

---

## Pre-Flight Check

Before starting, detect the environment and existing setup:

### 1. Environment Detection

```
if (web/co-work environment detected):
  Show current config status
  Display: "For full setup, run /dcs:setup in Claude Code CLI"
  Exit early
```

### 2. Check Existing Configuration

1. **Check for existing config** at `~/.claude/dcs-config.yaml`
   - If exists, ask: "You have an existing config. What would you like to do?"
   - Options: `Update existing` | `Start fresh` | `Just show status`

2. **Check for legacy config** at `~/.claude/team-pulse-config.yaml`
   - If exists without dcs-config: "Found legacy team-pulse config. Want to migrate it?"
   - Options: `Migrate to new format` | `Start fresh`

3. **Check existing skills** at `~/.claude/skills/`
   - Note any conflicting skill names
   - Plan to offer merge options if conflicts found

### 3. Detect Available MCP Servers

Check `~/.claude/settings.json` for configured MCP servers:
- GitHub MCP
- Figma MCP (if exists)
- Slack MCP
- Google Calendar
- Notion
- Others

Note which are connected for the interview phase.

---

## Onboarding Flow

### Phase 1: Welcome

```markdown
# Design Company Skills Setup

Setting up your design toolkit with:
- Brand guidelines and design system quality checks
- Team activity dashboard (Figma + GitHub)
- Productivity commands (daily briefs, meeting prep)

This takes about 3-5 minutes depending on your integrations.
```

---

### Phase 2: MCP Server Detection

```markdown
## Connected Tools

Checking your MCP configuration...
```

Display results:

```markdown
Detected MCP servers:
- GitHub — connected (code, PRs, issues)
- Figma — not connected

Would you like to set up any additional integrations?
```

Use AskUserQuestion with checkboxes:
- `[ ] Set up Figma integration` (if not connected)
- `[ ] Set up Slack integration` (if not connected)
- `[ ] Skip integrations for now`

---

### Phase 3: Figma Configuration

**Only if user selected Figma setup:**

```markdown
## Figma Integration

To track design activity, I need a Figma API token.

1. Go to: https://www.figma.com/developers/api#access-tokens
2. Or: Figma Settings → Account → Personal access tokens
3. Generate a token with "File content" scope

Paste your token below (it will be stored locally only):
```

Accept token input, then validate:

```bash
# Test the token
curl -s -H "Authorization: Bearer {token}" \
  "https://api.figma.com/v1/me"
```

**If valid:**
```markdown
Token verified! Connected as: {user.handle}

Which Figma projects should I track for team activity?
```

Use AskUserQuestion for project selection:
- Show list of recent projects from API if possible
- Allow manual entry: "Enter project IDs manually"
- Option: "Skip Figma tracking for now"

**If invalid:**
```markdown
That token didn't work. Common issues:
- Token may have expired
- Missing "File content" scope
- Copy/paste error

Want to try again or skip Figma setup?
```

---

### Phase 4: GitHub Configuration

**If GitHub MCP is connected:**

```markdown
## GitHub Integration

GitHub is already connected via MCP — no additional setup needed.

Which repositories should I track for team activity?
```

Options:
- List recently accessed repos if available
- Manual entry: "Enter repo names (owner/repo format)"
- Skip: "Don't track GitHub activity"

**If GitHub MCP not connected:**

```markdown
## GitHub Integration

GitHub MCP isn't connected. To enable:

1. Install the GitHub MCP from claude.ai/mcps
2. Authorize with your GitHub account
3. Re-run /dcs:setup

Skip GitHub tracking for now?
```

---

### Phase 5: Team Member Mapping (Optional)

```markdown
## Team Configuration (Optional)

Want cleaner output with real names instead of handles?

I can map:
- Figma handles → friendly names
- GitHub usernames → friendly names
```

Options:
- `Set up team members`
- `Skip — use handles as-is`

**If setting up team:**

```markdown
Add team members one at a time. For each person, provide:
- Display name
- Figma handle (optional)
- GitHub username (optional)

Start with yourself:
```

Loop until user says done:
- Name: [input]
- Figma handle: [input or skip]
- GitHub username: [input or skip]

"Add another team member?" → Yes/Done

---

### Phase 6: Workflow Preferences

```markdown
## Workflow Preferences

Which workflows do you want enabled?
```

Use AskUserQuestion with checkboxes:

**Daily:**
- `[x] Morning brief — daily priorities and schedule`
- `[x] Meeting prep — create focused agendas`

**Weekly:**
- `[x] Weekly recap — reflection and next-week planning`

**Team:**
- `[x] Team pulse — Figma + GitHub activity dashboard`

**As-needed:**
- `[x] Design feedback — structured critique support`
- `[x] Brand guidelines — voice and visual consistency`
- `[x] Devils advocate — challenge assumptions`
- `[x] Site analysis — analyze any website`

---

### Phase 7: Write Configuration

Create backup if config exists:
```bash
cp ~/.claude/dcs-config.yaml ~/.claude/dcs-config.yaml.bak
```

Write new config to `~/.claude/dcs-config.yaml`:

```yaml
# Design Company Skills Configuration
# Generated by /dcs:setup on {DATE}
# Documentation: https://github.com/opensesh/design-company-skills

version: 1.0
created: {ISO_DATE}
updated: {ISO_DATE}

# ─────────────────────────────────────────────────────────────────────────────
# FIGMA INTEGRATION
# ─────────────────────────────────────────────────────────────────────────────
figma:
  enabled: true
  api_token: "{ENCRYPTED_OR_PLAIN}"
  tracked_projects:
    - id: "123456789"
      name: "Design System"
  tracked_files: []

# ─────────────────────────────────────────────────────────────────────────────
# GITHUB INTEGRATION
# ─────────────────────────────────────────────────────────────────────────────
github:
  enabled: true
  # Uses MCP connection — no token needed
  tracked_repos:
    - owner: "opensesh"
      repo: "webapp"
    - owner: "opensesh"
      repo: "design-system"

# ─────────────────────────────────────────────────────────────────────────────
# TEAM MEMBERS
# ─────────────────────────────────────────────────────────────────────────────
team:
  members:
    - name: "Sarah Chen"
      figma_handle: "sarah.chen"
      github_username: "sarahc"
    - name: "Jake Miller"
      figma_handle: ""
      github_username: "jakemiller"

# ─────────────────────────────────────────────────────────────────────────────
# WORKFLOW PREFERENCES
# ─────────────────────────────────────────────────────────────────────────────
workflows:
  daily:
    - morning_brief
    - meeting_prep
  weekly:
    - weekly_recap
  team:
    - team_pulse
  as_needed:
    - design_feedback
    - brand_guidelines
    - devils_advocate
    - site_analysis

# ─────────────────────────────────────────────────────────────────────────────
# DISPLAY PREFERENCES
# ─────────────────────────────────────────────────────────────────────────────
preferences:
  activity_window_hours: 24
  show_prs: true
  show_commits: true
  show_versions: true
```

---

### Phase 8: Verification Tests

Run `/dcs:test` automatically:

```markdown
## Verifying Setup

Running verification tests...
```

Display checklist as tests complete:

```markdown
Configuration:
- [x] Config file created at ~/.claude/dcs-config.yaml
- [x] Config syntax valid

Integrations:
- [x] GitHub MCP: Can list repos
- [x] Figma API: Can fetch file metadata
- [ ] Slack: Not configured (optional)

Skills:
- [x] brand-guidelines: Active
- [x] frontend-design: Active
- [x] design-system-quality: Active

Commands:
- [x] All /dcs:* commands registered
- [x] No naming conflicts detected
```

---

### Phase 9: Completion Summary

```markdown
## Setup Complete!

Design Company Skills is configured and ready.

### What's Tracking
- **Figma:** 2 projects (Design System, Marketing Site)
- **GitHub:** 3 repos (webapp, design-system, marketing)
- **Team:** 2 members mapped

### Try These Commands
- `/dcs:daily-brief` — Morning overview
- `/dcs:team-pulse` — Team activity dashboard
- `/dcs:meeting-brief` — Prep for your next meeting
- `/dcs:help` — Full command reference

### Auto-Activating Skills
These work automatically when relevant:
- **brand-guidelines** — Triggers on brand/color/voice mentions
- **frontend-design** — Triggers on UI/component work
- **design-system-quality** — Triggers on design system reviews

### Next Steps
1. Run `/dcs:daily-brief` tomorrow morning
2. Run `/dcs:team-pulse` to see today's activity
3. Run `/dcs:configure` anytime to update settings

Something not working? Run `/dcs:test` to diagnose.
```

---

## Non-Destructive Guarantees

1. **Never overwrite** existing files without asking
2. **Always backup** before changes: `*.yaml.bak`
3. **Show diff** of proposed config changes before writing
4. **Merge** new settings with existing (don't replace wholesale)
5. **Namespace** all commands with `dcs:` to avoid conflicts

---

## Conflict Detection

Before writing any config:

```markdown
Checking for conflicts...

- Existing /daily-brief? → Ours is /dcs:daily-brief (no conflict)
- Existing brand-guidelines skill? → Ask: merge or keep separate?
- Existing Figma token? → Ask: reuse or replace?
```

If conflicts found, present options:
- Keep existing, skip ours
- Replace with ours (backup existing)
- Rename ours to avoid conflict

---

## Error Handling

**If ~/.claude directory doesn't exist:**
```bash
mkdir -p ~/.claude
```

**If write fails:**
```markdown
Couldn't write config file. Check permissions for ~/.claude/

Manual fix:
1. Run: mkdir -p ~/.claude
2. Run: chmod 755 ~/.claude
3. Re-run /dcs:setup

Still stuck? See: references/troubleshooting.md
```

**If API validation fails:**
```markdown
API check failed for {service}.

This might be:
- Network issue (try again)
- Invalid credentials (re-enter)
- Service outage (check status page)

Continue setup without {service}? You can add it later with /dcs:configure.
```

---

## Re-Running Setup

If user runs `/dcs:setup` with existing config:

1. Show current config summary
2. Ask what to change:
   - "Update integrations (Figma, GitHub)"
   - "Modify team members"
   - "Change workflow preferences"
   - "Start completely fresh"
3. Only modify selected sections
4. Run verification tests

---

*Version: 1.0*

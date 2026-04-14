# /dcs:configure

Update specific settings without running full setup. Quick access to modify integrations, team members, or preferences.

## Trigger

User runs `/dcs:configure` to modify existing configuration.

---

## Pre-Flight Check

1. **Check for config** at `~/.claude/dcs-config.yaml`
   - If not found: "No config found. Run `/dcs:setup` first to get started."
   - Exit early

2. **Load current config** and validate structure

---

## Workflow

### Step 1: Show Current Summary

```markdown
## Current Configuration

**Integrations:**
- Figma: Connected (tracking 2 projects)
- GitHub: Connected via MCP (tracking 3 repos)
- Slack: Not configured

**Team:** 2 members mapped

**Workflows:** 8 commands enabled
```

### Step 2: Ask What to Change

Use AskUserQuestion:

```markdown
What would you like to configure?
```

Options:
- `Figma integration` — Add/remove projects, update token
- `GitHub repos` — Change tracked repositories
- `Team members` — Add/edit/remove team mappings
- `Workflow preferences` — Enable/disable commands
- `Display preferences` — Time windows, output options
- `View full config` — Show complete YAML

---

## Configuration Sections

### Figma Integration

```markdown
## Figma Configuration

Current:
- Token: ****{last4} (valid)
- Projects: Design System, Marketing Site
- Files: 0 direct files tracked
```

Options:
- `Update API token`
- `Add project to track`
- `Remove project`
- `Add specific file`
- `Disable Figma tracking`

**Add project flow:**
```markdown
Enter the Figma project ID.
(Find it in the URL: figma.com/files/project/{ID})

Project ID: [input]
Friendly name: [input]
```

Validate via API, then update config.

---

### GitHub Repos

```markdown
## GitHub Configuration

Using: MCP connection (no token needed)
Tracking:
- opensesh/webapp
- opensesh/design-system
- opensesh/marketing
```

Options:
- `Add repository`
- `Remove repository`
- `Disable GitHub tracking`

**Add repo flow:**
```markdown
Enter repository in owner/repo format:

Repository: [input]
```

Validate repo exists via MCP, then update config.

---

### Team Members

```markdown
## Team Configuration

Current members:
1. Sarah Chen (figma: sarah.chen, github: sarahc)
2. Jake Miller (figma: —, github: jakemiller)
```

Options:
- `Add team member`
- `Edit member`
- `Remove member`

**Add member flow:**
```markdown
Adding new team member:

Display name: [input]
Figma handle (optional): [input]
GitHub username (optional): [input]
```

---

### Workflow Preferences

```markdown
## Enabled Workflows

Daily:
- [x] morning_brief
- [x] meeting_prep

Weekly:
- [x] weekly_recap

Team:
- [x] team_pulse

As-needed:
- [x] design_feedback
- [x] brand_guidelines
- [x] devils_advocate
- [ ] site_analysis (disabled)
```

Toggle any workflow on/off.

---

### Display Preferences

```markdown
## Display Preferences

- Activity window: 24 hours
- Show PRs: Yes
- Show commits: Yes
- Show Figma versions: Yes
```

Options to modify each setting.

---

## Writing Changes

Before any write:

1. **Show diff** of proposed changes:
```markdown
Changes to apply:

+ figma.tracked_projects:
+   - id: "987654321"
+     name: "New Project"

Proceed with these changes?
```

2. **Backup** current config:
```bash
cp ~/.claude/dcs-config.yaml ~/.claude/dcs-config.yaml.bak
```

3. **Write** updated config

4. **Confirm:**
```markdown
Configuration updated!

Changed:
- Added Figma project: New Project

Run `/dcs:test` to verify, or `/dcs:status` to review.
```

---

## Error Handling

**If config is malformed:**
```markdown
Your config file has syntax errors and couldn't be parsed.

Options:
- Restore from backup (if available)
- Start fresh with /dcs:setup
- Show raw file for manual fix
```

**If API validation fails:**
```markdown
Couldn't verify {item}. This might be:
- Invalid ID/token
- Network issue
- Permission problem

Save anyway? (It may not work until fixed)
```

---

*Version: 1.0*

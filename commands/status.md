# /dcs:status

Show current configuration status, integration health, and available commands.

## Trigger

User runs `/dcs:status` to see what's configured and working.

---

## Workflow

### Step 1: Load Configuration

1. **Read** `~/.claude/dcs-config.yaml`
2. **If not found:**
   ```markdown
   ## Design Company Skills — Not Configured

   No configuration found at ~/.claude/dcs-config.yaml

   Run `/dcs:setup` to get started, or see `/dcs:help` for available commands.
   ```
   Exit early.

3. **Parse** config and note any issues

---

### Step 2: Check Integration Health

**Figma check (if enabled):**
```bash
curl -s -H "Authorization: Bearer {token}" "https://api.figma.com/v1/me"
```
- Success → "Connected as {handle}"
- Failure → "Token invalid or expired"

**GitHub check (if MCP available):**
- Try listing one tracked repo
- Success → "Connected via MCP"
- Failure → "MCP not responding"

---

### Step 3: Render Status

```markdown
## Design Company Skills — Status

**Last updated:** April 13, 2025

---

### Integrations

| Service | Status | Details |
|---------|--------|---------|
| Figma   | Connected | sarah.chen, 2 projects |
| GitHub  | Connected | MCP, 3 repos |
| Slack   | Not configured | — |

---

### Tracking

**Figma Projects:**
- Design System (id: 123456789)
- Marketing Site (id: 987654321)

**GitHub Repos:**
- opensesh/webapp
- opensesh/design-system
- opensesh/marketing

---

### Team

| Name | Figma | GitHub |
|------|-------|--------|
| Sarah Chen | sarah.chen | sarahc |
| Jake Miller | — | jakemiller |

---

### Enabled Workflows

**Daily:** morning_brief, meeting_prep
**Weekly:** weekly_recap
**Team:** team_pulse
**As-needed:** design_feedback, brand_guidelines, devils_advocate

---

### Config Location

`~/.claude/dcs-config.yaml`

---

### Quick Actions

- `/dcs:configure` — Update settings
- `/dcs:test` — Run diagnostics
- `/dcs:help` — Command reference
```

---

## Minimal Status (No Config)

If config doesn't exist:

```markdown
## Design Company Skills — Not Set Up

The plugin is installed but not configured.

**What you can still use:**
- `/dcs:help` — See all commands
- `/dcs:setup` — Configure integrations

**Auto-activating skills** (work without config):
- brand-guidelines
- frontend-design
- design-system-quality
- verification-before-completion
```

---

## Health Indicators

Use clear visual status:

| Status | Display |
|--------|---------|
| Working | Connected |
| Degraded | Limited (reason) |
| Broken | Error (reason) |
| Not configured | Not configured |

---

## Troubleshooting Hints

If issues detected, append:

```markdown
---

### Issues Detected

**Figma token expired:**
Your Figma token is no longer valid. Run `/dcs:configure` → Figma → Update token.

**GitHub repo not found:**
Repository `opensesh/old-repo` no longer exists. Run `/dcs:configure` → GitHub → Remove it.
```

---

*Version: 1.0*

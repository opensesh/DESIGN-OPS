# /dcs:help

Complete command reference for Design Company Skills.

## Trigger

User runs `/dcs:help` to see all available commands and skills.

---

## Output

```markdown
# Design Company Skills — Command Reference

## Setup & Configuration

| Command | Description |
|---------|-------------|
| `/dcs:setup` | Initial onboarding wizard — configure integrations and preferences |
| `/dcs:configure` | Update specific settings without full setup |
| `/dcs:status` | Show current config status and integration health |
| `/dcs:test` | Run diagnostics to verify everything works |
| `/dcs:help` | This command reference |

---

## Daily Workflows

| Command | Description |
|---------|-------------|
| `/dcs:daily-brief` | Morning overview — calendar, priorities, tasks |
| `/dcs:meeting-brief` | Create a focused agenda for an upcoming meeting |
| `/dcs:meeting-recap` | Document a meeting with notes and action items |

---

## Weekly Workflows

| Command | Description |
|---------|-------------|
| `/dcs:weekly-recap` | End-of-week reflection and next-week planning |

---

## Team Workflows

| Command | Description |
|---------|-------------|
| `/dcs:team-pulse` | Activity dashboard — Figma + GitHub team activity |
| `/dcs:team-pulse-setup` | Configure team tracking (legacy — use /dcs:setup) |

---

## Creative & Analysis

| Command | Description |
|---------|-------------|
| `/dcs:devils-advocate` | Challenge assumptions, red-team your thinking |
| `/dcs:social-post` | Create content for LinkedIn, Instagram, Substack |
| `/dcs:site-analysis` | Deep analysis of any website |
| `/dcs:kickoff-prep` | Generate project kickoff materials |

---

## Tools & Extensions

| Command | Description |
|---------|-------------|
| `/dcs:add-tool` | Connect a new MCP with guided setup |
| `/dcs:customize` | Update personal preferences |
| `/dcs:install-skills` | Legacy onboarding (use /dcs:setup instead) |

---

## Auto-Activating Skills

These activate automatically based on context — no command needed:

| Skill | Triggers On |
|-------|-------------|
| `brand-guidelines` | Mentions of brand, colors (Aperol, Charcoal, Vanilla), brand voice |
| `frontend-design` | UI work, component creation, design implementation |
| `design-system-quality` | Design system reviews, token validation |
| `brand-voice` | Content writing, copywriting, messaging |
| `design-feedback` | Design critique, visual review |
| `accessibility-audit` | Accessibility checks, a11y reviews |
| `systematic-debugging` | Debugging, error investigation |
| `verification-before-completion` | Task completion, claiming "done" |

---

## Quick Start

1. **First time?** Run `/dcs:setup` to configure integrations
2. **Morning routine?** Run `/dcs:daily-brief`
3. **Check team activity?** Run `/dcs:team-pulse`
4. **Something broken?** Run `/dcs:test`

---

## Configuration

Config file: `~/.claude/dcs-config.yaml`

View current config: `/dcs:status`
Update config: `/dcs:configure`

---

## Getting Help

- **Issues:** https://github.com/opensesh/design-company-skills/issues
- **Docs:** See /references folder in plugin directory
- **Troubleshooting:** /references/troubleshooting.md
```

---

## Contextual Help

If user runs `/dcs:help {topic}`:

**`/dcs:help figma`**
```markdown
## Figma Integration Help

### Setup
Run `/dcs:setup` and select Figma integration, or run `/dcs:configure` → Figma.

### Token Generation
1. Go to https://www.figma.com/developers/api#access-tokens
2. Generate token with "File content" scope
3. Paste in setup wizard

### Tracking
- Track entire projects (all files in project)
- Or track specific files by key

### Troubleshooting
- Token expired? Regenerate and update via `/dcs:configure`
- Can't see projects? Check token has correct scope
- 403 errors? Token may have been revoked

See: /references/troubleshooting.md
```

**`/dcs:help github`**
```markdown
## GitHub Integration Help

### Setup
GitHub uses MCP — no separate token needed.

If GitHub MCP isn't connected:
1. Go to claude.ai/mcps
2. Install GitHub MCP
3. Authorize with your account
4. Re-run `/dcs:setup`

### Tracking
Add repos in owner/repo format (e.g., opensesh/webapp)

### Features
- Recent commits
- Open PRs
- Issue tracking

See: /references/mcp-setup/add-mcp-guide.md
```

**`/dcs:help team-pulse`**
```markdown
## Team Pulse Help

### What It Does
Shows recent activity across Figma and GitHub in one dashboard.

### Prerequisites
- At least one of: Figma token or GitHub MCP
- Configured tracked projects/repos
- (Optional) Team member mappings for cleaner output

### Setup
Run `/dcs:setup` and configure:
1. Figma integration (for design activity)
2. GitHub repos (for dev activity)
3. Team members (for name mapping)

### Customization
- Change time window: `/dcs:configure` → Preferences
- Add/remove tracking: `/dcs:configure` → Figma or GitHub
- Map team members: `/dcs:configure` → Team
```

---

## Command Not Found

If user runs `/dcs:help {unknown}`:

```markdown
I don't have specific help for "{topic}".

Try:
- `/dcs:help` — Full command reference
- `/dcs:help figma` — Figma integration
- `/dcs:help github` — GitHub integration
- `/dcs:help team-pulse` — Team activity dashboard

Or search the documentation in /references/
```

---

*Version: 1.0*

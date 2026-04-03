# /skills-help

Display available commands, skills, and current configuration status.

## Trigger

User runs `/skills-help` to see what's available and how to use Company Skills.

---

## Workflow

### Step 1: Read Current Config

Check `~/.claude/skills-config.yaml` for:
- What workflows are enabled
- What MCPs are connected
- Any customizations

### Step 2: Display Help

Present a personalized help screen based on their config:

```
## Company Skills - Help

### Your Active Commands

**Daily:**
• /daily-brief — Morning overview of your schedule and priorities
• /meeting-brief — Create focused meeting agendas

**Weekly:**
• /weekly-recap — End-of-week reflection and planning

**Thinking:**
• /devils-advocate — Challenge your assumptions
• /pre-mortem — "Imagine this failed—why?" analysis

**Content:**
• /social-post — Create content for social platforms
• /case-study — Generate case study drafts

**Research:**
• /site-analysis — Analyze any website

### Your Connected Tools

✅ GitHub (code search, PRs, issues)
✅ Supabase (database queries)
⚠️ Calendar — not connected (would enable: automated daily briefs)

### Maintenance Commands

• /add-tool — Connect a new tool (MCP)
• /customize — Update your preferences
• /install-skills — Re-run setup wizard

### Quick Tips

- Commands adapt to what's connected — they work even without MCPs
- Skills auto-activate based on context (no manual trigger needed)
- Your config lives at ~/.claude/skills-config.yaml

### Need More?

- Full docs: See README.md in the company-skills folder
- MCP setup: Run /add-tool for guided setup
- Start over: Run /install-skills
```

---

## Config-Aware Display

### If No Config Exists

```
## Company Skills - Help

Looks like you haven't run setup yet!

Run /install-skills to:
- Set up your personalized workflows
- Connect your tools
- Get your agent team ready

It takes about 2 minutes.
```

### If Config Exists But No MCPs

```
### Your Connected Tools

No tools connected yet.

Your commands still work! They'll just ask for information instead of
fetching it automatically.

Run /add-tool to connect your first tool (we recommend starting with Calendar).
```

---

## Command Categories

Display commands by category, but only show what's enabled in their config:

| Category | Commands | Description |
|----------|----------|-------------|
| Daily | `/daily-brief` | Morning overview |
| Weekly | `/weekly-recap` | End-of-week reflection |
| Meetings | `/meeting-brief`, `/meeting-recap` | Meeting prep and documentation |
| Thinking | `/devils-advocate`, `/pre-mortem` | Decision support |
| Content | `/social-post`, `/case-study` | Content creation |
| Research | `/site-analysis` | Website analysis |
| Maintenance | `/skills-help`, `/add-tool`, `/customize` | Setup and config |

---

## Skills Reference

Also show auto-activating skills:

```
### Auto-Activating Skills

These activate based on context — no command needed:

• **brand-voice** — Matches content to your brand tone
• **design-feedback** — Structured feedback on visual designs
• **frontend-design** — Production-grade UI patterns
• **verification-before-completion** — Evidence-based completion claims
• **systematic-debugging** — Methodical issue diagnosis
```

---

## Fallback: No Config File

If `~/.claude/skills-config.yaml` doesn't exist:

1. Note that setup hasn't been run
2. List all available commands (not filtered)
3. Strongly suggest running `/install-skills`

```
## Company Skills - Help

### Setup Required

You haven't completed setup yet. Run:

/install-skills

This will personalize your commands and connect your tools (2 min).

### Available Commands (Full List)

[Show all commands without filtering]

### Available Skills (Full List)

[Show all skills without filtering]
```

---

*Version: 1.0*

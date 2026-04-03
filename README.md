# Company Skills

A Claude Code plugin that gives you a "mini team of agents" for daily, weekly, and as-needed workflows. Works for any company — tech, CPG, services, creative, you name it.

## Installation

```bash
# 1. Clone the repo
git clone https://github.com/opensesh/company-skills.git ~/company-skills

# 2. Add it as a Claude plugin
claude plugin add ~/company-skills

# 3. Run the onboarding (takes ~2 minutes)
/install-skills
```

The onboarding interview personalizes everything based on your tools and workflow preferences.

---

## What You Get

### Commands (User-Invoked)

| Command | What It Does |
|---------|--------------|
| `/daily-brief` | Morning overview of calendar, tasks, and priorities |
| `/weekly-recap` | End-of-week reflection and next-week planning |
| `/meeting-brief` | Create focused agendas through guided questions |
| `/meeting-recap` | Document meetings with action items and owners |
| `/devils-advocate` | Challenge assumptions, red-team your thinking |
| `/pre-mortem` | "Imagine this failed—why?" analysis |
| `/social-post` | Guided content for LinkedIn, Instagram, Substack |
| `/case-study` | Generate case study drafts from project data |
| `/site-analysis` | Analyze websites for architecture, design, SEO |
| `/kickoff-prep` | Generate project kickoff materials |

### Maintenance Commands

| Command | What It Does |
|---------|--------------|
| `/skills-help` | See all available commands and skills |
| `/add-tool` | Connect a new MCP with guided setup |
| `/customize` | Update your preferences |

### Skills (Auto-Activating)

Skills activate automatically when relevant:

| Skill | When It Activates |
|-------|-------------------|
| `brand-voice` | Writing content that needs brand tone |
| `design-feedback` | Reviewing visual designs |
| `frontend-design` | Building UI components |
| `verification-before-completion` | Before claiming work is done |
| `systematic-debugging` | Diagnosing issues |
| `component-system` | Working with UI component libraries |

---

## How Commands Adapt

Commands gracefully adapt based on what's connected:

**With Calendar + Notion connected:**
```
/daily-brief → Full automated brief with meetings and tasks
```

**With only Calendar:**
```
/daily-brief → Shows meetings, asks about tasks
```

**With nothing connected:**
```
/daily-brief → "Tell me what's on your plate and I'll help prioritize."
```

No hard failures. Commands work at any integration level.

---

## Repository Structure

```
company-skills/
├── .claude-plugin/
│   └── plugin.json           # Plugin manifest
├── commands/                  # Slash commands (flat)
│   ├── install-skills.md     # Onboarding command
│   ├── daily-brief.md
│   ├── weekly-recap.md
│   ├── meeting-brief.md
│   ├── meeting-recap.md
│   ├── devils-advocate.md
│   ├── pre-mortem.md
│   ├── social-post.md
│   ├── case-study.md
│   ├── site-analysis.md
│   ├── kickoff-prep.md
│   ├── skills-help.md
│   ├── add-tool.md
│   └── customize.md
├── skills/                    # Auto-activating expertise (flat)
│   ├── brand-voice.md
│   ├── frontend-design.md
│   ├── design-feedback.md
│   ├── component-system.md
│   └── ...
├── references/                # Supporting documentation
│   ├── interview-flow.md
│   └── mcp-setup/
└── templates/                 # Templates for new skills
```

---

## After Installation

Your personalized config is stored at `~/.claude/skills-config.yaml`. It contains:

- **Tools you use** — Calendar, Notion, Slack, etc.
- **Connected MCPs** — What's integrated and what it enables
- **Workflow preferences** — Which commands you want active

---

## MCP Integration

MCPs (Model Context Protocol servers) let Claude connect to your tools:

| MCP | What It Enables |
|-----|-----------------|
| Google Calendar | Auto-fetch events for daily briefs |
| Notion | Tasks, docs, project management |
| GitHub | Code search, PR reviews |
| Firecrawl | Deep website analysis |
| Gmail | Email summaries and drafts |

See [`references/mcp-setup/`](references/mcp-setup/) for setup guides.

---

## Creating New Skills

Use the template at [`templates/skill-template.md`](templates/skill-template.md) or see the [skill-creator](skills/skill-creator.md) guide.

---

## Contributing

1. Fork and clone the repo
2. Add your skill/command to the appropriate folder
3. Test with Claude Code
4. Submit a PR with usage examples

---

## License

MIT License — See [LICENSE](LICENSE) for details.

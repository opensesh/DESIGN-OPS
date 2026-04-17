# What is MCP?

A plain-language explanation for non-technical users.

---

## The Simple Version

**MCP (Model Context Protocol)** lets Claude connect to your other tools — like Calendar, Notion, or GitHub.

Think of it like giving Claude permission to look at (and sometimes update) the apps you already use.

---

## Understanding Connection Status

When DESIGN-OPS evaluates your tools, you'll see one of these statuses:

| Status | Symbol | What It Means |
|--------|--------|---------------|
| **Connected** | ✓ | MCP working and ready to use |
| **Connected (API enhances)** | ✓+ | MCP works; optional API adds reporting depth |
| **Available** | ○ | Official MCP exists, ready to install |
| **API Only** | ⚡ | No official MCP; direct API recommended |
| **Unavailable** | ✗ | No viable connection method |

### Understanding Each Status

**✓ Connected** — Your MCP is working. You're ready to go.

**✓+ Connected (API enhances)** — Your MCP works great for daily tasks (search, read, create). The API is an *optional enhancement* that unlocks richer reporting data like activity history, batch queries, and analytics. You're NOT blocked — MCP-only is always valid.

**○ Available** — An official or vendor-published MCP exists for this tool but isn't installed yet. Run the install command to add it.

**⚡ API Only** — No suitable MCP exists for this tool. We'll help you connect directly via the API, which works just as well for reporting.

**✗ Unavailable** — No MCP or API can connect to this tool. Often due to platform restrictions (e.g., Instagram requires business account approval).

### How to Connect Available Tools

For tools showing ○ Available:
1. Run the install command shown in setup (e.g., `claude mcp add notion -- npx -y @notionhq/notion-mcp-server`)
2. Restart Claude or run the MCP list command to verify
3. Ask Claude to access the tool to complete authentication
4. Complete any OAuth flow that appears

---

## What Changes When You Connect an MCP

| Without MCP | With MCP |
|-------------|----------|
| "What meetings do I have today?" → Claude asks you to tell it | Claude checks your calendar directly |
| "What tasks are due?" → You copy-paste from Notion | Claude searches your Notion workspace |
| "What PRs need review?" → You list them manually | Claude checks GitHub for you |

**Bottom line:** Less copy-pasting, more automation.

---

## Is It Safe?

Yes, with reasonable precautions:

1. **You control access** — Each MCP requires explicit setup and authorization
2. **Read vs. write** — Many MCPs are read-only; you choose what Claude can modify
3. **Scoped permissions** — MCPs access specific tools, not your whole computer
4. **Revocable** — Remove an MCP anytime with `claude mcp remove [name]`

**What Claude can't do:**
- Access tools you haven't explicitly connected
- Share your data elsewhere
- Make changes without your commands triggering them

---

## Common MCPs and What They Enable

| MCP | What Claude Can Do |
|-----|-------------------|
| **Google Calendar** | See your schedule, help prep for meetings |
| **Notion** | Search your workspace, find tasks and docs |
| **GitHub** | Search code, review PRs, check issues |
| **Gmail** | Summarize emails, draft replies |
| **Supabase** | Query your database, check user data |
| **Firecrawl** | Deep-analyze any website |

---

## How to Think About It

MCPs are like browser extensions for Claude:
- They extend what Claude can do
- You install only what you need
- They work in the background
- You can remove them anytime

---

## MCP vs API — The Full Picture

### What's the relationship?

An MCP server is a **wrapper around an API** designed specifically for AI assistants like Claude. Think of it as a translator that makes APIs "speak Claude's language."

```
┌─────────────────────────────────────────────────────────────────────┐
│  Your Tool (Notion, GitHub, etc.)                                   │
│       ↓                                                             │
│  Raw API — Full access to everything the tool offers                │
│       ↓                                                             │
│  MCP Server — Simplified subset optimized for AI conversations      │
│       ↓                                                             │
│  Claude — Uses MCP to access your tools                             │
└─────────────────────────────────────────────────────────────────────┘
```

### The Trade-off

| Aspect | MCP | Raw API |
|--------|-----|---------|
| **Setup** | Easier (one command) | Requires tokens, config |
| **Basic tasks** | Great | Also works |
| **Advanced queries** | Limited | Full access |
| **Batch operations** | Usually not | Yes |
| **Activity history** | Rarely | Usually yes |

### Example: Notion

| Capability | Notion MCP | Notion API |
|------------|------------|------------|
| Search pages | ✓ | ✓ |
| Read page content | ✓ | ✓ |
| Create/edit pages | ✓ | ✓ |
| Query databases | Limited | ✓ Full |
| Batch operations | ✗ | ✓ |
| Activity history | ✗ | ✓ |
| User analytics | ✗ | ✓ |

### Example: GitHub

| Capability | GitHub MCP | GitHub API |
|------------|------------|------------|
| Search repos/code | ✓ | ✓ |
| Read files | ✓ | ✓ |
| Create PRs/issues | ✓ | ✓ |
| Org-wide analytics | Limited | ✓ |
| Webhook management | ✗ | ✓ |
| Action workflows | ✗ | ✓ |

### Example: Figma

| Capability | Figma MCP | Figma API |
|------------|-----------|-----------|
| Code generation | ✓ (primary use) | ✓ |
| File metadata | Limited | ✓ |
| Version history | ✗ | ✓ |
| Team activity | ✗ | ✓ |
| Comments | ✗ | ✓ |
| Export assets | Limited | ✓ |

### What DESIGN-OPS Does

For tools where the MCP is limited, DESIGN-OPS can:

1. **Help you set up direct API access** for richer reporting
2. **Create a custom MCP wrapper** that exposes more capabilities
3. **Use both together** — MCP for quick tasks, API for dashboards

### The Bottom Line

**Start with the MCP.** It's easier to set up and works great for basic tasks.

If you want deeper analytics or find it limiting, we'll help you add API access for specific features. You're never blocked — MCP-only is always valid.

---

## Do I Need MCPs?

**No.** Every command in Company Skills works without MCPs — they just work better with them.

| Scenario | Experience |
|----------|------------|
| No MCPs | Claude asks for information, you provide it |
| Some MCPs | Partially automated, Claude fetches what it can |
| All recommended MCPs | Fully automated workflows |

Start simple. Add MCPs when you feel the friction.

---

## Getting Started

Ready to connect something? See:
- [Recommended MCPs](recommended-mcps.md) — Our curated starter list
- [How to Add Any MCP](add-mcp-guide.md) — Step-by-step setup guide

Or run `/add-tool` in Claude Code for guided setup.

---

## Quick Reference

**See what's connected:**
```bash
claude mcp list
```

**Add a new MCP:**
```bash
claude mcp add [name] -- [command]
```

**Remove an MCP:**
```bash
claude mcp remove [name]
```

---

*Still have questions? The Claude Code docs have more detail: https://docs.anthropic.com/claude-code*

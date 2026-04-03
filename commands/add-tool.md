# /add-tool

Guided setup for connecting a new MCP (tool integration).

## Trigger

User runs `/add-tool` to connect a new tool to Claude Code.

---

## Workflow

### Step 1: Present Options

Show available MCPs with what they enable:

```
## Add a New Tool

What would you like to connect?

**Recommended:**
1. **Google Calendar** — Auto-fetch meetings for daily briefs
2. **Notion** — Pull tasks, search docs
3. **GitHub** — Code search, PR reviews
4. **Firecrawl** — Deep website analysis

**Other options:**
5. **Gmail** — Email summaries and drafts
6. **Supabase** — Database queries
7. **Linear** — Issue tracking
8. **Custom** — Add any MCP server

Which one? (enter number or name)
```

### Step 2: Guide Setup Based on Selection

#### For OAuth-Based MCPs (Calendar, Gmail, Drive)

```
## Setting up Google Calendar

This uses browser authentication — I'll open a window for you to log in.

**Step 1:** Run this command in your terminal:

claude mcp add google-calendar -- npx -y @anthropic/mcp-google-calendar

**Step 2:** A browser window will open. Log in and authorize access.

**Step 3:** Come back here and say "done" when complete.

---

Need help? Common issues:
- Browser didn't open → Try running the command again
- Authorization failed → Make sure you're logged into the right Google account
```

#### For API Key-Based MCPs (Notion, Firecrawl, Supabase)

```
## Setting up Notion

This requires an API key from Notion.

**Step 1:** Get your API key
Go to: https://www.notion.so/my-integrations
Create a new integration and copy the "Internal Integration Token"

**Step 2:** Run these commands in your terminal:

export NOTION_API_KEY="your-token-here"
claude mcp add notion -- npx -y @anthropic/mcp-notion

**Step 3:** Important! Add to your shell profile so it persists:

# Add this line to ~/.zshrc (or ~/.bashrc):
export NOTION_API_KEY="your-token-here"

Then run: source ~/.zshrc

**Step 4:** Say "done" when complete.

---

Need help?
- Can't find integrations page → Look in Settings & Members > Integrations
- Permission denied → Make sure your integration has access to your workspace
```

#### For Custom MCPs

```
## Add a Custom MCP

What MCP server do you want to add?

**If from npm:**
claude mcp add [name] -- npx -y [package-name]

**If from a local file:**
claude mcp add [name] -- node /path/to/server.js

**If from Docker:**
claude mcp add [name] -- docker run [image]

What's the package name or path?
```

### Step 3: Verify Connection

After user says "done":

```
Let me verify the connection...
```

Try to use the MCP (e.g., for Calendar, ask "What's on my calendar today?").

**If successful:**
```
✅ Google Calendar connected successfully!

What this enables:
• /daily-brief will show your meetings automatically
• "What meetings do I have this week?"
• "Prep me for my 2pm call"

I've updated your config at ~/.claude/skills-config.yaml.

Want to add another tool, or are you all set?
```

**If failed:**
```
⚠️ I couldn't connect to Google Calendar.

Common fixes:
1. Make sure the authorization completed in the browser
2. Try running the command again
3. Check that you authorized the correct Google account

Want to try again, or skip for now?
```

### Step 4: Update Config

After successful connection, update `~/.claude/skills-config.yaml`:

```yaml
mcp_connected:
  - name: google-calendar
    capabilities: [events, scheduling]
  # ... existing entries
```

---

## MCP Reference Table

| MCP | Type | Command | What It Enables |
|-----|------|---------|-----------------|
| Google Calendar | OAuth | `claude mcp add google-calendar -- npx -y @anthropic/mcp-google-calendar` | Meeting data for daily briefs |
| Gmail | OAuth | `claude mcp add gmail -- npx -y @anthropic/mcp-gmail` | Email summaries, draft replies |
| Notion | API Key | `export NOTION_API_KEY="..." && claude mcp add notion -- npx -y @anthropic/mcp-notion` | Tasks, docs, workspace search |
| GitHub | Auth | `claude mcp add github -- npx -y @anthropic/mcp-github` | Code search, PR reviews |
| Firecrawl | API Key | `export FIRECRAWL_API_KEY="..." && claude mcp add firecrawl -- npx -y firecrawl-mcp` | Website analysis |
| Supabase | API Key | `export SUPABASE_URL="..." SUPABASE_KEY="..." && claude mcp add supabase -- npx -y @anthropic/mcp-supabase` | Database queries |

---

## Education on Connect

When an MCP is connected, briefly explain what's now possible:

```
✅ [Tool Name] connected!

What you can now do:
• [Specific capability 1]
• [Specific capability 2]
• [Specific capability 3]

The [Tool Name] MCP is [read-only / read-write] — Claude can [see/modify] your data.
```

---

## Error Handling

**Node.js not installed:**
```
It looks like Node.js isn't installed, which is needed for MCP servers.

Install it from: https://nodejs.org/
(We recommend the LTS version)

Then come back and run /add-tool again.
```

**Package not found:**
```
I couldn't find that MCP package. Double-check the package name, or
look for it here: https://github.com/anthropics/mcp-servers
```

**Auth expired:**
```
Your [Tool] authentication may have expired.

Try removing and re-adding:
1. claude mcp remove [name]
2. claude mcp add [name] -- [command]
```

---

*Version: 1.0*

# Troubleshooting

Common issues and how to fix them.

---

## Commands don't appear after installation

### In Claude Desktop

1. Close and reopen Claude Desktop completely
2. Or type `/reload-plugins` in the Code tab

### In Terminal

1. Exit Claude Code by typing `exit`
2. Restart Claude: `claude`
3. Verify the plugin is installed:
   ```bash
   ls ~/.claude/plugins/design-ops
   ```
   You should see the `commands/`, `skills/`, and `references/` directories.

---

## Plugin not found error

### Check the plugin is installed

**Mac/Linux:**
```bash
ls ~/.claude/plugins/design-ops
```

**Windows:**
```powershell
dir %USERPROFILE%\.claude\plugins\design-ops
```

If the folder doesn't exist, re-run the install script:

### Re-install the plugin

**Option 1: Terminal**
```bash
git clone https://github.com/opensesh/DESIGN-OPS
bash DESIGN-OPS/.design-ops/install.sh
```

**Option 2: Claude Code**
```
Clone github.com/opensesh/DESIGN-OPS and run the install script.
```

---

## Config file issues

### Config not being saved

Check if the `.claude` directory exists:

**Mac/Linux:**
```bash
ls ~/.claude
```

If it doesn't exist, create it:
```bash
mkdir -p ~/.claude
```

**Windows:**
```powershell
dir %USERPROFILE%\.claude
```

If it doesn't exist:
```powershell
mkdir %USERPROFILE%\.claude
```

### Config looks wrong

The config lives at `~/.claude/design-ops-config.yaml`. You can:

1. View it:
   ```bash
   cat ~/.claude/design-ops-config.yaml
   ```

2. Reset it by running `/design-ops:setup` again and choosing "Start fresh"

---

## Tool connectors not working

### In Claude Desktop

1. Click the **+** button next to the prompt box
2. Select **Connectors**
3. Verify the connector shows as "Connected"
4. If not connected, click it to authorize

### Check MCP status

In the Code tab, Claude can detect which MCPs are configured. Run:
```
What MCPs do I have connected?
```

Claude will list what's available and what's missing.

**Understanding connection status:**
| Status | What It Means |
|--------|---------------|
| ✓ Connected | Working and ready |
| ⚠ Available | Installed but needs auth |
| ○ Not installed | MCP needs to be added |

See [MCP Education](mcp-setup/mcp-education.md) for detailed explanations.

### Re-authorize a connector

1. Click **+** → **Connectors**
2. Click the connector you want to fix
3. Follow the authorization flow again

---

## Specific command issues

### /daily-brief shows nothing

This command works at any integration level:
- **With Calendar connected:** Shows your meetings automatically
- **Without Calendar:** Just tell Claude what's on your schedule

If connected but nothing shows, check your connector authorization (see above).

### /add-tool isn't working

The `/add-tool` command guides you through MCP setup. If it's failing:
1. Make sure you're in the **Code tab** (not Cowork)
2. Try running it with a specific tool: `/add-tool google-calendar`
3. Check the detailed guides in [`mcp-setup/`](mcp-setup/)

---

## Permission errors

### Can't write to ~/.claude

**Mac/Linux:**
```bash
chmod 755 ~/.claude
```

**Windows:** Run PowerShell as Administrator and check folder permissions.

### Plugin folder is read-only

If files are marked as read-only after installation, fix with:

**Mac/Linux:**
```bash
chmod -R 755 ~/.claude/plugins/design-ops
```

---

## Tool-Specific Fix Runbooks

Each tool has specific issues and fixes. Use these runbooks when `/design-ops:validate` shows a tool as failed.

### Notion — API Key Invalid or Missing

**Symptoms:**
- Dashboard shows "Notion — ⚠ API Key Invalid"
- Error: "NOTION_API_KEY not set" or "Invalid API key"

**Fix Steps:**

1. **Go to Notion Integrations:**
   ```
   https://www.notion.so/my-integrations
   ```

2. **Check if integration exists:**
   - Look for an integration named "DESIGN-OPS"
   - If missing, click "New integration"

3. **Create/regenerate the token:**
   - Name: `DESIGN-OPS`
   - Associated workspace: Select your workspace
   - Capabilities: Read content ✓, Read user information ✓
   - Click "Submit" then copy the "Internal Integration Secret"

4. **Store the token:**

   **With 1Password:**
   ```bash
   op item create \
     --category="API Credential" \
     --title="Notion API" \
     --vault="DESIGN-OPS" \
     'credential=secret_YOUR_TOKEN_HERE'
   ```

   **Without 1Password:**
   Add to `~/.zshrc`:
   ```bash
   export NOTION_API_KEY="secret_YOUR_TOKEN_HERE"
   ```

5. **Reload shell:**
   ```bash
   source ~/.zshrc
   ```

6. **Verify:**
   ```
   /design-ops:validate
   ```

**Common pitfalls:**
- Token starts with `secret_` — include the prefix
- Integration must be added to pages/databases you want to access

---

### Google Workspace — OAuth Required

**Symptoms:**
- Dashboard shows "Google Workspace — ⚠ OAuth Required"
- Commands fail with "Not authenticated"

**Fix Steps:**

1. **Trigger OAuth flow:**
   Run any Google command:
   ```
   show my calendar for today
   ```

2. **Complete browser authorization:**
   - A browser window opens
   - Log in to your Google account
   - Click "Allow" to grant DESIGN-OPS access

3. **Return to Claude:**
   - The OAuth token is stored automatically
   - Future commands work without re-auth

4. **Verify:**
   ```
   /design-ops:validate
   ```

**Common pitfalls:**
- Pop-up blocker may prevent the browser from opening
- If OAuth fails, restart Claude and try again

---

### Supabase — OAuth Required

**Symptoms:**
- Dashboard shows "Supabase — ⚠ OAuth Required"
- Commands fail with authentication errors

**Fix Steps:**

1. **Trigger OAuth flow:**
   Run any Supabase command:
   ```
   show my Supabase tables
   ```

2. **Complete browser authorization:**
   - A browser window opens
   - Log in to Supabase
   - Authorize the connection

3. **Return to Claude:**
   - OAuth token is stored automatically

4. **Verify:**
   ```
   /design-ops:validate
   ```

---

### Figma — OAuth Required

**Symptoms:**
- Dashboard shows "Figma — ⚠ OAuth Required"
- Figma commands fail

**Fix Steps:**

1. **Trigger OAuth flow:**
   Paste any Figma URL or run:
   ```
   show my Figma files
   ```

2. **Complete browser authorization:**
   - A browser window opens
   - Log in to Figma
   - Click "Allow" to grant access

3. **Return to Claude:**
   - OAuth token is stored automatically

4. **Verify:**
   ```
   /design-ops:validate
   ```

---

### Vercel — 403 Forbidden (Token Scope Issue)

**Symptoms:**
- Dashboard shows "Vercel — ⚠ Access Denied"
- Error: "403 Forbidden"

**Fix Steps:**

1. **Go to Vercel tokens:**
   ```
   https://vercel.com/account/tokens
   ```

2. **Create a new token with correct scopes:**
   - Click "Create Token"
   - Name: `DESIGN-OPS`
   - Scope: Full Account (or at minimum: `deployment:read`, `project:read`)
   - Expiration: Choose based on your preference

3. **Update MCP config:**
   Edit `~/.claude/settings.json` and update the Vercel token.

4. **Restart Claude:**
   ```bash
   exit
   claude
   ```

5. **Verify:**
   ```
   /design-ops:validate
   ```

**Common pitfalls:**
- Token scope must include read access to deployments and projects
- Team-scoped tokens may not have access to personal projects

---

### Google Analytics — Not Configured

**Symptoms:**
- Dashboard shows "Google Analytics — ⚠ Not Configured"
- Error: "GA4_PROPERTY_ID not configured"

**Fix Steps:**

1. **Get your GA4 Property ID:**
   - Go to: https://analytics.google.com
   - Click Admin (gear icon)
   - Under "Property", click "Property Details"
   - Copy the Property ID (just the number, e.g., `123456789`)

2. **Store the Property ID:**

   **With 1Password:**
   ```bash
   op item create \
     --category="API Credential" \
     --title="Google Analytics" \
     --vault="DESIGN-OPS" \
     'property_id=123456789'
   ```

   **Without 1Password:**
   Add to `~/.zshrc`:
   ```bash
   export GA4_PROPERTY_ID="123456789"
   ```

3. **Reload shell:**
   ```bash
   source ~/.zshrc
   ```

4. **Verify:**
   ```
   /design-ops:validate
   ```

**Note:** You also need Google Workspace OAuth completed for GA4 to work.

---

### GitHub — 401 Unauthorized

**Symptoms:**
- Dashboard shows "GitHub — ⚠ Unauthorized"
- Error: "401 Unauthorized" or "Bad credentials"

**Fix Steps:**

1. **Go to GitHub tokens:**
   ```
   https://github.com/settings/tokens
   ```

2. **Generate new token (classic):**
   - Click "Generate new token" → "Generate new token (classic)"
   - Note: `DESIGN-OPS`
   - Expiration: Choose based on your preference
   - Scopes: `repo` (full control of private repositories)
   - Click "Generate token"
   - Copy the token immediately (you won't see it again)

3. **Store the token:**

   **With 1Password:**
   ```bash
   op item create \
     --category="API Credential" \
     --title="GitHub Token" \
     --vault="DESIGN-OPS" \
     'credential=ghp_YOUR_TOKEN_HERE'
   ```

   **Without 1Password:**
   Add to `~/.zshrc`:
   ```bash
   export GITHUB_TOKEN="ghp_YOUR_TOKEN_HERE"
   ```

4. **Reload shell:**
   ```bash
   source ~/.zshrc
   ```

5. **Verify:**
   ```
   /design-ops:validate
   ```

**Common pitfalls:**
- Token expired — GitHub tokens can have expiration dates
- Token revoked — Check if it appears in your token list
- Wrong scope — Needs `repo` scope for private repos

---

### Dub.co — List Endpoint Not Available

**Symptoms:**
- Dashboard shows "Dub.co — ⚠ Limited"
- Can create/update links but can't list them

**Explanation:**
This is an MCP limitation, not a bug. The Dub.co MCP supports creating, updating, and deleting links but may not support listing all links.

**Workaround:**
- Dashboard shows "limited" status for Dub.co
- Link creation and updates still work
- For full analytics, use the Dub.co web dashboard

**No fix required** — this is expected behavior.

---

### General MCP Not Responding

**Symptoms:**
- Any tool shows "MCP not responding"
- Timeout errors

**Fix Steps:**

1. **Check MCP is installed:**
   ```bash
   claude mcp list
   ```

2. **Restart Claude:**
   ```bash
   exit
   claude
   ```

3. **If still failing, remove and re-add:**
   ```bash
   claude mcp remove {tool_name}
   claude mcp add {tool_name} -- npx -y @{package}
   ```

4. **Check network:**
   - Some MCPs require internet connectivity
   - VPN or firewall may block connections

5. **Verify:**
   ```
   /design-ops:validate
   ```

---

### Running Validation After Fixes

After applying any fix, always verify:

```
/design-ops:validate
```

If the tool shows ✓ Ready, the fix worked.

If still failing, try:
1. `/design-ops:validate --fix` for guided troubleshooting
2. Check the specific error message for clues
3. Open an issue if you're stuck

---

## Still stuck?

1. **Check the [GitHub Issues](https://github.com/opensesh/DESIGN-OPS/issues)** — your problem might already be solved
2. **Open a new issue** with:
   - What you tried
   - What happened
   - Your OS (Mac, Windows, Linux)
   - How you installed (Terminal or Claude Code)
   - Output from `/design-ops:validate`
3. **Email:** [hello@opensession.co](mailto:hello@opensession.co)

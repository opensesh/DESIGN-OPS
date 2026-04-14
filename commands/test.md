# /dcs:test

Verification suite that checks all integrations, skills, and commands are working correctly.

## Trigger

User runs `/dcs:test` to diagnose issues or verify setup after changes.

---

## Workflow

### Step 1: Announce Test Suite

```markdown
## Design Company Skills — Diagnostics

Running verification tests...
```

---

### Step 2: Configuration Tests

```markdown
### Configuration
```

**Test 1: Config file exists**
- Check: `~/.claude/dcs-config.yaml` exists
- Pass: `[x] Config file exists`
- Fail: `[ ] Config file not found — run /dcs:setup`

**Test 2: Config syntax valid**
- Check: YAML parses without errors
- Pass: `[x] Config syntax valid`
- Fail: `[ ] Config has syntax errors — see details below`

**Test 3: Required fields present**
- Check: `version`, `figma` or `github` section exists
- Pass: `[x] Required fields present`
- Fail: `[ ] Missing required fields: {list}`

**Test 4: No conflicting settings**
- Check: No duplicate project IDs, no circular references
- Pass: `[x] No conflicting settings`
- Fail: `[ ] Conflict detected: {description}`

---

### Step 3: Integration Tests

```markdown
### Integrations
```

**Test 5: Figma API (if configured)**
```bash
curl -s -H "Authorization: Bearer {token}" "https://api.figma.com/v1/me"
```
- Pass: `[x] Figma API: Connected as {handle}`
- Fail: `[ ] Figma API: {error_message}`

**Test 6: Figma projects accessible (if configured)**
For each tracked project:
```bash
curl -s -H "Authorization: Bearer {token}" \
  "https://api.figma.com/v1/projects/{id}/files"
```
- Pass: `[x] Figma projects: All {N} accessible`
- Partial: `[~] Figma projects: {N}/{M} accessible`
- Fail: `[ ] Figma projects: None accessible`

**Test 7: GitHub MCP (if configured)**
- Check: MCP tools available and responding
- Try: `mcp__github__list_commits` on one tracked repo
- Pass: `[x] GitHub MCP: Connected, tools working`
- Fail: `[ ] GitHub MCP: {error_message}`

**Test 8: GitHub repos accessible (if configured)**
For each tracked repo:
- Try: List recent commits
- Pass: `[x] GitHub repos: All {N} accessible`
- Partial: `[~] GitHub repos: {N}/{M} accessible`
- Fail: `[ ] GitHub repos: None accessible`

---

### Step 4: Skills Tests

```markdown
### Skills
```

**Test 9: Skill files exist**
For each expected skill:
- Check: `skills/{name}/SKILL.md` or `skills/{name}.md` exists
- Pass: `[x] {skill-name}: Found`
- Fail: `[ ] {skill-name}: Missing`

Expected skills:
- brand-guidelines
- frontend-design
- design-system-quality
- brand-voice
- design-feedback
- verification-before-completion

**Test 10: Skill frontmatter valid**
- Check: YAML frontmatter parses, has `name` and `description`
- Pass: `[x] Skill frontmatter: All valid`
- Fail: `[ ] Skill frontmatter: {skill} has errors`

---

### Step 5: Commands Tests

```markdown
### Commands
```

**Test 11: Command files exist**
For each expected command:
- Check: `commands/{name}.md` exists
- Pass: `[x] All commands registered`
- Fail: `[ ] Missing: {command}`

Expected commands:
- setup, configure, status, test, help
- daily-brief, weekly-recap
- meeting-brief, meeting-recap
- team-pulse, team-pulse-setup
- devils-advocate, site-analysis
- social-post, add-tool

**Test 12: No naming conflicts**
- Check: No duplicate command names across plugins
- Pass: `[x] No naming conflicts`
- Fail: `[ ] Conflict with: {plugin}/{command}`

---

### Step 6: Integration Test

```markdown
### End-to-End Test
```

**Test 13: Team pulse data fetch**
If both Figma and GitHub configured:
- Try: Fetch activity from both sources
- Pass: `[x] Team pulse: Can fetch data from all sources`
- Partial: `[~] Team pulse: Partial data ({working} of {total})`
- Fail: `[ ] Team pulse: Cannot fetch any data`

---

### Step 7: Summary

```markdown
---

## Results

**Passed:** 12/13 tests
**Warnings:** 1
**Failed:** 0

### Warnings

- Figma project "Old Project" (id: 111) returned 404 — may have been deleted

### Recommendations

1. Remove deleted Figma project: `/dcs:configure` → Figma → Remove project
```

---

## Output Format

Full test output:

```markdown
## Design Company Skills — Diagnostics

### Configuration
- [x] Config file exists
- [x] Config syntax valid
- [x] Required fields present
- [x] No conflicting settings

### Integrations
- [x] Figma API: Connected as sarah.chen
- [~] Figma projects: 1/2 accessible
- [x] GitHub MCP: Connected, tools working
- [x] GitHub repos: All 3 accessible

### Skills
- [x] brand-guidelines: Found
- [x] frontend-design: Found
- [x] design-system-quality: Found
- [x] All 6 skills valid

### Commands
- [x] All 15 commands registered
- [x] No naming conflicts

### End-to-End
- [x] Team pulse: Can fetch data from all sources

---

## Results

**Passed:** 12/13 tests
**Warnings:** 1
**Failed:** 0

All critical systems operational. One Figma project may need attention.

Run `/dcs:configure` to fix warnings, or `/dcs:status` for overview.
```

---

## Quick Test Mode

If user runs `/dcs:test quick`:

Only run critical tests:
1. Config exists and valid
2. Figma API responds (if configured)
3. GitHub MCP responds (if configured)

```markdown
## Quick Diagnostics

- [x] Config: OK
- [x] Figma: OK
- [x] GitHub: OK

All systems operational.
```

---

## Error Details

When tests fail, provide actionable details:

```markdown
### Failed: Figma API

**Error:** 403 Forbidden

**Likely causes:**
1. Token has expired — regenerate at figma.com/developers
2. Token was revoked — check Figma account settings
3. Wrong token scope — needs "File content" permission

**Fix:** Run `/dcs:configure` → Figma → Update token
```

---

*Version: 1.0*

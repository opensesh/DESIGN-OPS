# /dcs:daily-brief

Morning briefing that aggregates data from your connected tools across all three pillars into a focused daily overview.

## Trigger

User invokes `/dcs:daily-brief` to start their day with a consolidated view of what matters.

---

## Config-Aware Behavior

This command reads from `~/.claude/dcs-config.yaml` and fetches data based on:
1. Which pillars are enabled
2. Which tools are connected in each pillar
3. Which outcomes are selected for daily briefs

### Pillar-Based Data Gathering

```yaml
# From config:
pillars:
  operations:
    outcomes:
      daily: [calendar_events, tasks_due, unread_emails]
  design:
    outcomes:
      daily: [recent_commits, open_prs, design_updates]
  analytics:
    outcomes:
      daily: [pageviews, link_clicks]
```

The command fetches each outcome from its corresponding tool's capabilities.

---

## Workflow

### Step 1: Load Config and Determine Available Data

1. **Read** `~/.claude/dcs-config.yaml`
2. **For each enabled pillar:**
   - Get list of daily outcomes
   - Map outcomes to connected tools
   - Note which outcomes can be fetched

3. **Adapt workflow** based on what's available

### Step 2: Fetch Data by Pillar

**Operations data (if pillar enabled):**
- Calendar events from google_workspace
- Tasks due from notion/linear
- Unread emails from google_workspace
- Unread messages from slack

**Design data (if pillar enabled):**
- Recent commits from github/gitlab
- Open PRs from github/gitlab
- Design updates from figma

**Analytics data (if pillar enabled):**
- Page views from google_analytics
- Link clicks from dubco
- New subscribers from substack (if connected)

### Step 3: Synthesize Briefing

Combine data from all pillars into cohesive overview:

```markdown
## Good morning

### Today's Schedule
[From Operations: google_workspace calendar_events]
- **9:00 AM** - Design review with Taylor (Figma link in calendar)
- **11:30 AM** - Client call: Acme Corp (prep: review proposal)
- **2:00 PM** - 1:1 with Morgan

### Tasks Due Today
[From Operations: notion/linear tasks_due]
- [ ] Finalize homepage wireframes
- [ ] Send invoice to Acme
- [ ] Review PR from Morgan

### Development Activity
[From Design: github recent_commits, open_prs]
**Recent commits (last 24h):**
- `feat(auth): add logout button` — Jordan, 2h ago
- `fix(api): handle null response` — Taylor, 8h ago

**PRs needing review:**
- #142 "Add user settings page" — Morgan (2 days old)

### Design Activity
[From Design: figma design_updates]
**Figma files updated:**
- Design System — Jordan edited 3h ago
- Marketing Landing Page — Taylor edited yesterday

### Today's Numbers
[From Analytics: google_analytics, dubco]
- **Page views:** 1,247 (↑12% vs yesterday)
- **Link clicks:** 89 across 15 tracked links
- **Top page:** /pricing (342 views)

### Heads Up
[Synthesized insights]
- 30-min gap at 10:30 — good for deep work
- PR #142 is 2 days old — consider reviewing today
- Traffic spike on /pricing — worth investigating
```

---

## Pillar Sections

### Operations Section

When operations pillar has connected tools:

```markdown
### Today's Schedule
[From calendar_events outcome]

### Tasks Due Today
[From tasks_due outcome]

### Communications
[From unread_emails, unread_messages outcomes]
```

### Design Section

When design pillar has connected tools:

```markdown
### Development Activity
[From recent_commits, open_prs outcomes]

### Design Activity
[From design_updates, active_users outcomes]
```

### Analytics Section

When analytics pillar has connected tools:

```markdown
### Today's Numbers
[From pageviews, link_clicks, new_subscribers outcomes]
```

---

## Graceful Degradation

### By Pillar

| Pillar Disabled | How to Handle |
|-----------------|---------------|
| Operations | Skip schedule/tasks sections, show what's available |
| Design | Skip dev/design sections |
| Analytics | Skip metrics section |
| All disabled | Full conversational mode |

### By Outcome

If specific outcome can't be fetched (tool issue):

```markdown
### Tasks Due Today
Could not fetch tasks from Notion — MCP not responding.
Run `/dcs:test operations` to diagnose.
```

### No Config

```markdown
Good morning! I don't have access to your tools yet.

Tell me: what's on your plate today? I'll help you prioritize and plan.

To enable automated briefs, run `/dcs:setup` to connect your tools.
```

---

## Output Style

- Concise, scannable
- No fluff or commentary
- Use bullet points
- Bold key names, times, and action items
- Personal tone ("You have 3 meetings today")
- Warm but efficient

---

## Example Outputs

### Full Automation (All Pillars)

```markdown
## Good morning

### Today's Schedule
- **9:00 AM** - Design review with Taylor (Figma link in calendar)
- **11:30 AM** - Client call: Acme Corp (prep: review proposal)
- **2:00 PM** - 1:1 with Morgan

### Tasks Due Today
- [ ] Finalize homepage wireframes
- [ ] Send invoice to Acme
- [ ] Review PR from Morgan

### Communications
- 12 unread emails (3 flagged important)
- 8 unread Slack messages in #design

### Development Activity
**Recent commits:**
- `feat(auth): add logout` — Jordan, 2h ago
- `fix(api): null handling` — Taylor, 8h ago

**PRs needing review:**
- #142 "User settings" — Morgan (2 days)

### Design Activity
- Design System — Jordan, 3h ago
- Marketing Page — Taylor, yesterday

### Today's Numbers
- **Page views:** 1,247 (↑12%)
- **Link clicks:** 89
- **Top page:** /pricing

### Heads Up
- Gap at 10:30 for deep work
- PR #142 getting stale
- /pricing traffic up — investigate?
```

### Partial (Operations + Design Only)

```markdown
## Good morning

### Today's Schedule
- **9:00 AM** - Design review with Taylor
- **11:30 AM** - Client call: Acme Corp
- **2:00 PM** - 1:1 with Morgan

### Tasks Due Today
- [ ] Finalize homepage wireframes
- [ ] Send invoice to Acme

### Development Activity
**Recent commits (last 24h):**
- `feat(auth): add logout` — Jordan

**PRs needing review:**
- #142 "User settings" — Morgan

### Heads Up
- 30-min gap at 10:30 for focus time
```

### Manual Mode (No Config)

```markdown
Good morning! Let's plan your day.

I don't have access to your calendar or tools yet, but I can still help.

**Quick questions:**
1. What meetings do you have today?
2. What must get done today?
3. Anything stressing you out?

(Run `/dcs:setup` to connect your tools for automated briefs tomorrow.)
```

---

## Follow-up Offers

After presenting the briefing:

```markdown
---

**Want me to:**
- Prep you for the Acme call?
- Review PR #142?
- Block focus time around your meetings?
```

---

## Outcome to Tool Mapping

| Outcome | Tool | Capability |
|---------|------|------------|
| `calendar_events` | google_workspace | todays_events |
| `tasks_due` | notion, linear | task_counts |
| `unread_emails` | google_workspace | unread_emails |
| `unread_messages` | slack | unread_counts |
| `recent_commits` | github | recent_commits |
| `open_prs` | github | open_prs |
| `design_updates` | figma | files_edited |
| `active_users` | figma | active_users |
| `pageviews` | google_analytics | session_count |
| `link_clicks` | dubco | click_counts |
| `new_subscribers` | substack | new_subscribers |

---

*Version: 2.0*

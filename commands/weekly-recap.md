# /dcs:weekly-recap

End-of-week summary that aggregates data from connected tools across all three pillars for reflection and planning.

## Trigger

User invokes `/dcs:weekly-recap` at the end of a week to review accomplishments, identify patterns, and prepare for the next week.

---

## Config-Aware Behavior

This command reads from `~/.claude/dcs-config.yaml` and fetches data based on:
1. Which pillars are enabled
2. Which tools are connected in each pillar
3. Which outcomes are selected for weekly recaps

### Pillar-Based Data Gathering

```yaml
# From config:
pillars:
  operations:
    outcomes:
      weekly: [week_overview, tasks_completed, team_activity]
  design:
    outcomes:
      weekly: [team_contributions, design_versions, pr_activity]
  analytics:
    outcomes:
      weekly: [traffic_trends, top_links, audience_growth]
```

---

## Workflow

### Step 1: Load Config and Gather Data

1. **Read** `~/.claude/dcs-config.yaml`
2. **For each enabled pillar:**
   - Get list of weekly outcomes
   - Fetch data from connected tools
   - Aggregate into weekly summaries

### Step 2: Fetch Data by Pillar

**Operations data (if pillar enabled):**
- Meeting count from google_workspace
- Tasks completed from notion/linear
- Communication volume from slack

**Design data (if pillar enabled):**
- Commits by author from github
- PRs opened/merged from github
- Design versions from figma
- File activity from figma

**Analytics data (if pillar enabled):**
- Traffic trends from google_analytics
- Top performing links from dubco
- Subscriber growth from substack

### Step 3: Reflection Questions

After presenting data, guide reflection:

```markdown
Let's reflect on your week.

Based on the data above:
1. What did you accomplish that you're most satisfied with?
2. What didn't get done that should have?
3. What gave you energy vs. drained you?
```

### Step 4: Generate Recap

Combine automated data with reflection:

```markdown
## Week of April 7-11, 2025

### Accomplishments
[User-provided + inferred from data]
- Shipped homepage redesign to staging
- Closed deal with Acme Corp
- Hired freelance developer

### Operations Summary
[From Operations pillar]
**Meetings:** 11 this week (3 more than usual)
**Tasks:** 8 of 12 planned completed (67%)
**Email:** 47 sent, 156 received

### Development Summary
[From Design pillar]
**Commits:** 23 total
- Jordan: 12 commits
- Taylor: 8 commits
- Morgan: 3 commits

**Pull Requests:**
- Opened: 5
- Merged: 4
- Avg review time: 18 hours

### Design Summary
[From Design pillar]
**Figma activity:**
- 3 named versions created
- 12 files modified
- 8 comment threads

### Analytics Summary
[From Analytics pillar]
**Traffic:** 8,742 sessions (↑15% vs last week)
**Top pages:**
1. /pricing — 2,341 views
2. /features — 1,892 views
3. /blog/launch — 1,456 views

**Link performance:**
- Total clicks: 623
- Top link: "Product Hunt" — 189 clicks

### Energy Audit
**Energizing:** [From reflection]
**Draining:** [From reflection]

### Patterns & Insights
[Synthesized from data + reflection]
- Meeting-heavy weeks correlate with lower commit counts
- Design work peaks mid-week
- /pricing traffic suggests buyer interest

### Focus for Next Week
[From reflection]
1. Priority 1
2. Priority 2
3. Priority 3
```

---

## Pillar Sections

### Operations Section

```markdown
### Operations Summary

**Meetings:** {count} this week ({comparison})
**Tasks:** {completed} of {planned} completed ({percentage})
**Communication:** {email_count} emails, {slack_messages} Slack messages

**Busiest day:** {day}
**Quietest day:** {day}
```

### Design Section

```markdown
### Development Summary

**Commits this week:** {total}
{For each team member with commits:}
- {Name}: {count} commits

**Pull Requests:**
- Opened: {count}
- Merged: {count}
- Avg review time: {hours}

### Design Summary

**Figma activity:**
- {versions} named versions created
- {files} files modified
- {threads} comment threads
```

### Analytics Section

```markdown
### Analytics Summary

**Traffic:** {sessions} sessions ({change} vs last week)

**Top pages:**
1. {page} — {views} views
2. {page} — {views} views
3. {page} — {views} views

**Link performance:**
- Total clicks: {count}
- Top link: "{name}" — {clicks} clicks

{If substack connected:}
**Newsletter:**
- New subscribers: {count}
- Open rate: {percentage}
```

---

## Graceful Degradation

### By Pillar

| Pillar Disabled | How to Handle |
|-----------------|---------------|
| Operations | Skip meeting/task metrics, ask user |
| Design | Skip dev/design metrics |
| Analytics | Skip traffic/link metrics |
| All disabled | Full reflection mode |

### No Data Available

```markdown
### Operations Summary

Could not fetch meeting data — Google Workspace not responding.
Manually: Roughly how many meetings did you have?
```

### No Config

```markdown
## Weekly Reflection

Let's reflect on your week. I don't have access to your tools yet,
but I can still help you think through what happened.

**Questions:**
1. What were the highlights?
2. What did you accomplish?
3. What's carrying over to next week?

(Run `/dcs:setup` to get automated weekly metrics.)
```

---

## Reflection Prompts

Use these when user gives thin answers:

**For accomplishments:**
- What moved the needle most?
- What would you do again?
- What are you proud of?

**For drains:**
- What felt like a waste of time?
- What would you delegate or automate?
- What meeting should have been an email?

**For patterns:**
- Did this week feel typical or unusual?
- What would make next week better?
- What one thing would you change?

---

## Example Output

### Full Automation

```markdown
## Week of April 7-11, 2025

### Accomplishments
- Shipped homepage redesign to staging
- Closed deal with Acme Corp ($12k project)
- Hired freelance developer for Q2 overflow

### Operations Summary
**Meetings:** 11 (3 more than usual - lots of client calls)
**Tasks:** 8 of 12 planned (67%)
**Emails:** 47 sent

### Development Summary
**Commits:** 23 total
- Jordan: 12 commits
- Taylor: 8 commits
- Morgan: 3 commits

**Pull Requests:**
- Opened: 5 | Merged: 4
- Avg review time: 18 hours

### Design Summary
**Figma activity:**
- 3 named versions created
- 12 files modified
- Most active: Design System

### Analytics Summary
**Traffic:** 8,742 sessions (↑15%)
**Top page:** /pricing (2,341 views)
**Link clicks:** 623 total

### Energy Audit
**Energizing:** Design deep work on Wednesday, closing the Acme deal
**Draining:** Too many context switches, that 90-min meeting

### Didn't Get To
- Figma AI exploration — keeps getting bumped
- Q1 case study writeup — need uninterrupted 2hrs

### Patterns & Insights
Meeting-heavy weeks kill creative output. Need to protect
Wednesday design time better.

### Wins to Celebrate
New client + new hire in the same week. Growth mode.

### Focus for Next Week
1. Onboard new developer
2. Finish case study (block Thursday AM)
3. Start Acme discovery

---

Want me to help block time for these priorities?
```

---

## Follow-up Offers

```markdown
---

**Want me to:**
- Block time for next week's priorities?
- Save this recap somewhere?
- Carry anything forward to Monday's brief?
```

---

## Outcome to Tool Mapping

| Outcome | Tool | Capability |
|---------|------|------------|
| `week_overview` | google_workspace | event_count |
| `tasks_completed` | notion, linear | task_completion |
| `team_activity` | slack | channel_activity |
| `team_contributions` | github | team_contributions |
| `pr_activity` | github | pr_activity |
| `design_versions` | figma | design_versions |
| `traffic_trends` | google_analytics | traffic_trends |
| `top_links` | dubco | top_links |
| `audience_growth` | substack | subscriber_growth |

---

*Version: 2.0*

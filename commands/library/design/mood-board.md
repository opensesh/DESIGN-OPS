# /design-ops:mood-board

Curated design inspiration from web sources. Analyzes design patterns, color palettes, and techniques from inspiration sites.

## Trigger

User invokes `/design-ops:mood-board` when seeking design inspiration for:
- A specific style or aesthetic
- UI patterns and layouts
- Color and typography trends
- Industry-specific design references

---

## Workflow

### Step 1: Topic Selection

"What kind of inspiration are you looking for?"

**Examples:**
- "Minimalist SaaS dashboards"
- "Bold typography landing pages"
- "Dark mode design systems"
- "E-commerce product pages"
- "Fintech mobile apps"

### Step 2: Source Selection (Optional)

"Where should I look for inspiration?"

**Default sources:**
- Dribbble
- Behance
- Awwwards
- Land-book
- Mobbin (for mobile)

**User can specify:**
- Specific sites to include
- Sites to exclude
- Direct URLs to analyze

### Step 3: Research & Analysis

Using web tools, gather inspiration:

1. **Search** relevant platforms for the topic
2. **Analyze** top results for patterns
3. **Extract** color palettes, typography, layouts
4. **Identify** recurring techniques and trends
5. **Filter** through brand lens (if brand-guidelines configured)

### Step 4: Generate Mood Board

```markdown
## Mood Board: {Topic}

### Visual Themes Observed

**Dominant patterns across {N} sources:**

1. **Layout Architecture**
   - Split-screen hero sections (60%)
   - Asymmetric grid layouts
   - Generous whitespace (40px+ gutters)
   - Card-based content containers

2. **Color Patterns**
   - Dominant: White/off-white backgrounds (85%)
   - Accent: Single brand color for CTAs
   - Data viz: Muted palette with one highlight
   - Dark mode: Deep grays (#121212-#1a1a1a)

3. **Typography**
   - Sans-serif dominates (Inter, SF Pro, Geist)
   - Limited type scale (3-4 sizes)
   - Large hero headlines (48-72px)
   - High contrast text (4.5:1+)

4. **Micro-interactions**
   - Subtle hover states
   - Smooth scroll animations
   - Loading skeletons
   - Entrance animations on scroll

### Notable Examples

**Example 1: {Name}**
- Source: {URL}
- Standout: {What makes it notable}
- Technique: {Specific pattern to note}

**Example 2: {Name}**
- Source: {URL}
- Standout: {What makes it notable}
- Technique: {Specific pattern to note}

**Example 3: {Name}**
- Source: {URL}
- Standout: {What makes it notable}
- Technique: {Specific pattern to note}

### Extracted Color Palettes

**Palette 1: Clean & Professional**
- Primary: #0F172A (dark navy)
- Secondary: #64748B (slate)
- Accent: #3B82F6 (blue)
- Background: #FAFAFA

**Palette 2: Warm & Inviting**
- Primary: #1C1917 (warm black)
- Secondary: #78716C (warm gray)
- Accent: #F97316 (orange)
- Background: #FFFBEB

### Relevant to {Brand Name}

*How these patterns align with your brand:*

- Our Vanilla (#FFFAEE) aligns with warm off-white trend
- Charcoal (#191919) provides high-contrast text option
- Aperol (#FE5102) fits the single-accent approach
- **Consider:** Softer card shadows for warmth
- **Consider:** More generous whitespace

### Actionable Takeaways

1. **Adopt:** Large hero headlines with constrained body text
2. **Consider:** Card-based layouts for content organization
3. **Test:** Single-accent color approach for CTAs
4. **Explore:** Subtle entrance animations on scroll

### Source References

- {Link 1}: {Brief description}
- {Link 2}: {Brief description}
- {Link 3}: {Brief description}
```

---

## Integration Points

### Website Intelligence Skill

Leverages `website-intelligence` for:
- Deep site analysis
- Component extraction
- Color palette detection

### Firecrawl Web Tools

Uses firecrawl for:
- Multi-site research
- Content extraction
- Screenshot capture

### Brand Guidelines

If brand configuration exists:
- Filter inspiration through brand lens
- Note alignments and divergences
- Suggest brand-appropriate adaptations

---

## Example Session

**User:** `/design-ops:mood-board`

**Claude:** "What kind of inspiration are you looking for?"

**User:** "Minimalist SaaS dashboards"

**Claude:** "Where should I look? I'll default to Dribbble, Behance, and Awwwards."

**User:** "Also check Mobbin for mobile patterns"

**Claude:** *Searches sources, analyzes results*

```markdown
## Mood Board: Minimalist SaaS Dashboards

### Visual Themes (from 15 sources)

**Layout:**
- Sidebar navigation (70%)
- Card-based metric displays
- Generous whitespace
- Subtle grid lines for tables

**Colors:**
- White/light gray backgrounds
- Single accent for actions
- Semantic colors for status (green/yellow/red)

### Notable Examples

1. **Linear Dashboard** — mobbin.com/...
   - Clean sidebar, keyboard-first design
   - Minimal color, high information density

2. **Notion Analytics** — dribbble.com/...
   - Card-based stats, clear hierarchy
   - Subtle shadows, no borders

3. **Stripe Dashboard** — behance.net/...
   - Data-dense but readable
   - Excellent use of whitespace

### Relevant to Open Session

- Our warm neutrals work well with this aesthetic
- Aperol accent fits the single-color approach
- Consider: lighter card shadows for the minimal look

Would you like me to extract specific components from any of these?
```

---

## Error Handling

| Error | Response |
|-------|----------|
| No results found | "Couldn't find relevant inspiration. Try a more specific or different term." |
| Site blocked | "Can't access {site}. Continuing with other sources." |
| Rate limited | "Hit rate limits on {site}. Results may be partial." |

---

*Version: 1.0*

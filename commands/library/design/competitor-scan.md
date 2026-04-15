# /do:competitor-scan

Quick competitive design analysis. Extracts design patterns, color palettes, typography, and positioning from competitor websites.

## Trigger

User invokes `/do:competitor-scan` to analyze 1-3 competitor websites for design intelligence.

---

## Workflow

### Step 1: Competitor Input

"Which competitors would you like to analyze? (1-3 URLs)"

**Input format:**
- Single URL: `competitor.com`
- Multiple URLs: `competitor1.com, competitor2.com, competitor3.com`

### Step 2: Parallel Analysis

For each competitor URL, extract:

1. **Visual Identity**
   - Color palette (primary, secondary, accent, neutrals)
   - Typography (headings, body, special treatments)
   - Logo treatment and brand marks

2. **Layout Patterns**
   - Navigation style (sidebar, topbar, hamburger)
   - Content structure (cards, lists, full-width)
   - Hero section approach
   - Footer complexity

3. **Component Library**
   - Button styles and states
   - Form patterns
   - Card treatments
   - Call-to-action approaches

4. **Brand Positioning**
   - Headline messaging
   - Value proposition framing
   - Tone of voice indicators

### Step 3: Generate Analysis

```markdown
## Competitor Design Analysis

### Competitor 1: {name} ({URL})

**Color Palette:**
- Primary: #0066FF (corporate blue)
- Secondary: #F0F4F8 (light blue-gray)
- Accent: #00C853 (success green)
- Neutrals: Pure black (#000), pure white (#FFF)

**Typography:**
- Headlines: Inter Bold, 48-32px
- Body: Inter Regular, 16px
- Special: Inter Medium for UI elements

**Layout:**
- Navigation: Fixed topbar with mega-menu
- Hero: Split layout (text left, image right)
- Content: 3-column card grid
- Density: Medium — balanced whitespace

**Notable Patterns:**
- Heavy use of gradients on CTAs
- Rounded corners throughout (8px)
- Illustrations over photography
- Trust badges prominent below fold

**Brand Positioning:**
- Headline: "Scale your business faster"
- Tone: Corporate, feature-focused
- CTA language: "Get started free"

---

### Competitor 2: {name} ({URL})

[Same structure...]

---

### Competitor 3: {name} ({URL})

[Same structure...]

---

## Competitive Positioning Matrix

| Aspect | Competitor 1 | Competitor 2 | Competitor 3 | {Your Brand} |
|--------|--------------|--------------|--------------|--------------|
| Color temp | Cold (blue) | Cold (purple) | Warm (orange) | Warm |
| Typography | Modern sans | Geometric | Humanist | Humanist |
| Imagery | Illustrations | 3D renders | Photography | Mixed |
| Density | Medium | High | Low | ? |
| Tone | Corporate | Technical | Friendly | Friendly |

## vs. {Your Brand} Analysis

*How your brand compares:*

**Differentiation Opportunities:**
- **Color:** Your warm neutrals (Charcoal/Vanilla) stand out against cold palettes
- **Typography:** Neue Haas Grotesk is more distinctive than Inter
- **Tone:** "Steward, not advisor" voice is unique positioning

**Alignment (consider if intentional):**
- Similar use of card-based layouts
- Comparable CTA prominence
- Same rounded corner treatment

**Gaps to Address:**
- Competitors have stronger visual hierarchy in heroes
- Trust signals (logos, testimonials) more prominent
- Mobile navigation more polished

## Actionable Recommendations

1. **Lean into warmth** — Your palette is a differentiator; use it more boldly
2. **Improve hero hierarchy** — Larger headlines, clearer value prop
3. **Add trust signals** — Consider client logos or testimonial placement
4. **Review mobile nav** — Test against competitor mobile experiences
```

---

## Integration Points

### Website Intelligence Skill

Uses `website-intelligence` for:
- Deep site structure analysis
- Component detection
- Color extraction

### Brand Guidelines

If brand config exists:
- Automatically compare to your brand
- Highlight differentiation opportunities
- Note concerning similarities

### Firecrawl Tools

Uses firecrawl for:
- Site scraping
- Branding extraction
- Screenshot capture

---

## Example Session

**User:** `/do:competitor-scan`

**Claude:** "Which competitors would you like to analyze?"

**User:** "linear.app, notion.so"

**Claude:** *Analyzes both sites in parallel*

```markdown
## Competitor Design Analysis

### Linear (linear.app)

**Color Palette:**
- Primary: #5E6AD2 (purple)
- Background: #0E0F11 (near-black)
- Text: #FFFFFF (white)
- Accent: Purple gradients

**Typography:**
- Headlines: SF Pro Display
- Body: Inter, 15px
- Monospace: JetBrains Mono for code

**Notable:**
- Dark-mode first design
- Keyboard-first UX
- Minimal, almost stark aesthetic
- Heavy purple accent throughout

**Positioning:**
- "Linear is a better way to build products"
- Technical, developer-focused
- Speed and efficiency messaging

---

### Notion (notion.so)

**Color Palette:**
- Primary: #000000 (black)
- Background: #FFFFFF (white)
- Accent: Colorful illustrations

**Typography:**
- Headlines: Inter Bold
- Body: Inter Regular, 16px

**Notable:**
- Clean, minimal white
- Heavy illustration use
- Friendly, approachable
- Template-forward marketing

**Positioning:**
- "Your wiki, docs, & projects. Together."
- Collaborative, all-in-one
- Flexibility emphasized

---

## vs. Open Session

**Differentiation:**
- Your warm palette vs. their cold/neutral
- "Steward" voice vs. their technical/friendly
- Human-centric vs. tool-centric positioning

**Consider:**
- Both competitors use generous whitespace — match or exceed
- Both have strong mobile experiences — prioritize mobile
```

---

## Error Handling

| Error | Response |
|-------|----------|
| URL not accessible | "Can't reach {URL}. Site may be down or blocking crawlers." |
| Too many URLs | "Please limit to 3 competitors per scan for thorough analysis." |
| No brand config | "No brand guidelines found. Skipping brand comparison." |

---

*Version: 1.0*

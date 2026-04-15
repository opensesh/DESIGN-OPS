# /do:variation-sprint

Generate multiple design variations within brand constraints. Creates 3-5 alternative approaches with trade-off analysis.

## Trigger

User invokes `/do:variation-sprint` when they need to explore multiple design directions for:
- Landing pages or hero sections
- UI components
- Layout alternatives
- CTA treatments
- Visual hierarchy experiments

---

## Workflow

### Step 1: Target Definition

"What are you designing variations for?"

**Examples:**
- "Pricing page CTA"
- "Dashboard navigation"
- "Onboarding flow"
- "Hero section layout"
- "Card component design"

### Step 2: Constraints Gathering

"What constraints should I work within?"

**Auto-detected:**
- Brand colors (from config)
- Typography (from design system)
- Component patterns (from library)

**User-specified:**
- Must include specific elements
- Size/space constraints
- Technical limitations
- Business requirements

### Step 3: Goal Clarification

"What's the primary goal for this design?"

**Options:**
- Maximize conversion
- Improve clarity
- Increase engagement
- Reduce cognitive load
- Strengthen brand identity
- Other (specify)

### Step 4: Generate Variations

Create 3-5 distinct variations, each exploring a different approach:

```markdown
## Variation Sprint: {Target}

**Goal:** {Primary goal}
**Constraints:** {Listed constraints}

---

### Variation A: {Name — e.g., "Emphasis on Social Proof"}

**Approach:**
{2-3 sentence description of the approach}

**Key Elements:**
- Testimonial carousel above CTA
- Smaller button, trust badges prominent
- Customer logos in view

**Visual Description:**
```
┌─────────────────────────────────────┐
│  ⭐⭐⭐⭐⭐                           │
│  "This changed how we work"         │
│  — Sarah, Acme Corp                 │
│                                      │
│  [Start Free Trial]                 │
│                                      │
│  🏢 🏢 🏢 🏢 🏢 (client logos)        │
└─────────────────────────────────────┘
```

**Trade-offs:**
- Pro: Builds trust before commitment
- Pro: Reduces perceived risk
- Con: Longer scroll to action
- Con: Depends on quality testimonials

**Best for:** Risk-averse buyers, enterprise sales, high-consideration purchases

---

### Variation B: {Name — e.g., "Direct Conversion"}

**Approach:**
{2-3 sentence description}

**Key Elements:**
- Large CTA button, minimal surrounding content
- Aperol (#FE5102) button on Charcoal
- Single value prop headline

**Visual Description:**
```
┌─────────────────────────────────────┐
│                                      │
│    Get more done with less effort   │
│                                      │
│    ████████████████████████████     │
│    █    Start Free Trial       █     │
│    ████████████████████████████     │
│                                      │
│         No credit card required     │
└─────────────────────────────────────┘
```

**Trade-offs:**
- Pro: Clearest path to action
- Pro: Fast decision for ready buyers
- Con: Less reassurance for hesitant users
- Con: Higher bounce if value prop unclear

**Best for:** Users with high intent, simple products, impulse decisions

---

### Variation C: {Name — e.g., "Comparison Anchor"}

**Approach:**
{2-3 sentence description}

**Key Elements:**
- Competitor pricing visible
- Your advantage highlighted
- Value prop emphasized over price

**Visual Description:**
```
┌─────────────────────────────────────┐
│  Others: $99/mo   You save: 60%     │
│                                      │
│    Get everything for $39/mo        │
│                                      │
│  ✓ All features  ✓ No limits        │
│                                      │
│       [Start Saving Today]          │
└─────────────────────────────────────┘
```

**Trade-offs:**
- Pro: Clear value proposition
- Pro: Creates urgency with savings
- Con: Focuses on price, not value
- Con: May attract price-sensitive customers

**Best for:** Price-competitive products, clear ROI, commodity markets

---

### Variation D: {Name — e.g., "Feature Preview"}

**Approach:**
{2-3 sentence description}

**Key Elements:**
- Interactive preview or demo
- Try-before-you-buy experience
- CTA after engagement

**Visual Description:**
```
┌─────────────────────────────────────┐
│   ┌─────────────────────────────┐   │
│   │   Interactive Demo Here     │   │
│   │   (mini product preview)    │   │
│   └─────────────────────────────┘   │
│                                      │
│   Like what you see?                 │
│   [Try It Free]                      │
└─────────────────────────────────────┘
```

**Trade-offs:**
- Pro: Reduces uncertainty
- Pro: Qualifies engaged users
- Con: More complex to implement
- Con: May slow down ready buyers

**Best for:** Complex products, technical buyers, visual tools

---

### Variation E: {Name — e.g., "Story-First"}

**Approach:**
{2-3 sentence description}

**Key Elements:**
- Problem/solution narrative
- Emotional connection
- CTA as resolution

**Visual Description:**
```
┌─────────────────────────────────────┐
│   Tired of [common problem]?        │
│                                      │
│   We built [product] because        │
│   we were frustrated too.           │
│                                      │
│   [See How It Works]                │
└─────────────────────────────────────┘
```

**Trade-offs:**
- Pro: Emotional resonance
- Pro: Brand differentiation
- Con: May feel manipulative
- Con: Longer path to conversion

**Best for:** Brand-building, emotional purchases, differentiating from commodities

---

## Recommendation

Based on {goal}, I recommend starting with **Variation {X}** because:
1. {Reason 1}
2. {Reason 2}

**Testing Strategy:**
- A/B test **{X}** vs **{Y}** to validate approach
- Measure: {Key metric}
- Duration: {Suggested test period}

## Implementation Notes

For the recommended variation:
- Required components: {List}
- Estimated effort: {Low/Medium/High}
- Dependencies: {Any blockers or prerequisites}
```

---

## Brand Integration

When brand config exists:

- All variations use approved colors
- Typography follows design system
- Component patterns match library
- Voice aligns with brand guidelines

---

## Example Session

**User:** `/do:variation-sprint`

**Claude:** "What are you designing variations for?"

**User:** "Hero section for our new landing page"

**Claude:** "What constraints should I work within?"

**User:** "Must include signup form, use brand colors, work on mobile"

**Claude:** "What's the primary goal?"

**User:** "Maximize signups"

**Claude:** *Generates 5 variations*

```markdown
## Variation Sprint: Landing Page Hero

**Goal:** Maximize signups
**Constraints:** Signup form required, brand colors, mobile-responsive

### Variation A: Form-Forward
Signup form is the hero — large, center-stage, minimal distractions...

### Variation B: Value-First
Strong headline and benefits above the fold, form below...

### Variation C: Social Proof Lead
Testimonial and logos at top, form second...

### Variation D: Interactive Preview
Mini demo or video, form appears after engagement...

### Variation E: Progressive Disclosure
Teaser content with "Learn More" → expanded section with form...

## Recommendation

For signup maximization, start with **Variation A** (Form-Forward).
A/B test against **Variation B** (Value-First) to see if extra context helps or hurts.
```

---

## Error Handling

| Error | Response |
|-------|----------|
| No constraints specified | "I'll use your brand guidelines as constraints. Continue?" |
| Conflicting constraints | "These constraints may conflict: {X} and {Y}. Which takes priority?" |
| Too broad a target | "Can you narrow the focus? I work best on specific elements or sections." |

---

*Version: 1.0*

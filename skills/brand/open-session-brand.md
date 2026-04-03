# Open Session Brand Guidelines

Apply Open Session's official brand colors, typography, and style to any artifact.

## Purpose

This skill ensures all content maintains consistent Open Session brand identity across presentations, documents, marketing materials, and digital experiences.

## When to Activate

Use this skill when:
- Creating presentations for clients or speaking engagements
- Writing documents, proposals, case studies, or reports
- Designing marketing materials or social graphics
- Building educational content or course materials
- Any branded content for Open Session

---

## Brand Overview

**Open Session** is a design consultancy democratizing Fortune 500-level design through AI augmentation, design systems expertise, and education.

**Mission**: Make world-class design accessible to all

**Core Traits**:
- Smart but not smug
- Technical but accessible
- Confident but humble
- Friendly and approachable

---

## Colors

### Primary Palette

| Color | Hex | Usage | Composition |
|-------|-----|-------|-------------|
| **Charcoal** | `#191919` | Dark backgrounds, primary text on light | 45-50% |
| **Vanilla** | `#FFFAEE` | Light backgrounds, text on dark | 45-50% |
| **Aperol** | `#FE5102` | Accent, CTAs, highlights | Max 10% |

### Grayscale System

```
#000000  Black (rare use)
#1E1E1E  Black-90
#383838  Black-80
#4A4A4A  Black-70 (interface borders)
#595959  Black-60 (disabled states)
#787878  Black-50
#A3A3A3  Black-40 (subtle text)
#C7C7C7  Black-30 (light borders)
#DDDDE0  Black-20 (light backgrounds)
#F0F0F0  Black-10
#FFFFFF  White
```

### Color Rules

**Backgrounds:**
- Only use Vanilla or Charcoal as primary backgrounds
- Never use Aperol as a background
- Alternate between Vanilla and Charcoal for visual rhythm

**Text:**
- On Vanilla: Use Charcoal text ONLY
- On Charcoal: Use Vanilla text ONLY
- Aperol text: Only for numbers in lists or subheadings on Charcoal

**Aperol Accent:**
- Maximum 10% of any composition
- Preferred on Charcoal backgrounds (better accessibility)
- Best for: CTAs, highlights, interactive elements
- Never for: Large text blocks, body content, borders

**Accessibility:**
- Vanilla + Charcoal: WCAG AAA (18.5:1 ratio)
- Aperol on Charcoal: WCAG AA
- Aperol on Vanilla: Use very sparingly

---

## Typography

### Font Families

| Font | Weights | Usage |
|------|---------|-------|
| **Neue Haas Grotesk Display Pro** | 400, 500, 700 | Headlines, hero text, H1-H2 |
| **Neue Haas Grotesk Text Pro** | 400, 500, 700 | Body text, paragraphs, buttons |
| **Offbit** | 400, 700 | H5-H6 accents, technical content |

### Fallback Stacks

```css
/* Display */
"Neue Haas Grotesk Display Pro", system-ui, sans-serif

/* Text */
"Neue Haas Grotesk Text Pro", system-ui, sans-serif

/* Mono/Accent */
Offbit, ui-monospace, monospace
```

### Type Scale

| Level | Size Range | Font | Weight | Usage |
|-------|------------|------|--------|-------|
| Display 1 | 60-160px | Display Pro | Bold | Hero text |
| Display 2 | 38-120px | Display Pro | Bold | Secondary display |
| H1 | 32-56px | Display Pro | Bold | Page titles |
| H2 | 28-48px | Display Pro | Bold | Section titles |
| H3 | 24-40px | Display Pro | Medium | Subsections |
| H4 | 22-32px | Display Pro | Medium | Minor headings |
| H5 | 20-28px | Offbit | Regular | Accent subheadings |
| H6 | 18-24px | Offbit | Regular | Small accents |
| Body 1 | 20px | Text Pro | Roman | Main body |
| Body 2 | 16px | Text Pro | Roman | Secondary text |
| Button | 16px | Text Pro | Medium | Interactive |
| Caption | 12px | Text Pro | Roman | Small text |

### Typography Rules

- Minimum 2 size steps between hierarchy levels
- **Offbit**: Maximum 2 instances per viewport (adds personality without overwhelming)
- Line height: 1.2 for headings, 1.5 for body
- Never use Offbit for body text

---

## Brand Voice

### Tone by Context

| Context | Traits | Examples |
|---------|--------|----------|
| **Instructional** | Friendly + Creative | Warm, clear, supportive |
| **AI/Innovation** | Visionary + Creative | Forward-thinking, experimental |
| **Internal** | Friendly + Creative | Casual, collaborative |
| **Business** | Visionary + Friendly | Professional, credible |

### Writing Style

- Use "we" and "our" naturally
- Don't preface with "according to guidelines"
- Make choices feel natural, not prescribed
- Be confident in decisions but open to iteration

### What to Avoid

- Corporate jargon
- Overly formal language
- Hedging or uncertainty
- Generic marketing speak

---

## Logo & Assets

**Logo location**: `/public/assets/logos/`

**Icon set**: IBM Icon Library (2000+ icons)

**Illustrations**: Sigma (Counterfeit Works) - Shapes Vol.1 & Vol.2

**Image style**: Photography-first with 6 creative territories:
- Auto
- Lifestyle
- Move
- Escape
- Work
- Feel

---

## Application Examples

### Presentation Slide

```
┌─────────────────────────────────────────┐
│  [Charcoal background]                  │
│                                         │
│  HEADLINE                               │
│  Neue Haas Display Pro Bold             │
│  Vanilla text                           │
│                                         │
│  Body text in Vanilla                   │
│  Neue Haas Text Pro                     │
│                                         │
│  [CTA Button]  ← Aperol accent          │
│                                         │
└─────────────────────────────────────────┘
```

### Document Header

```
┌─────────────────────────────────────────┐
│  [Vanilla background]                   │
│                                         │
│  Document Title                         │
│  Charcoal, Display Pro Bold             │
│                                         │
│  Subtitle or date                       │
│  Charcoal, Text Pro, lighter weight     │
│                                         │
│  ─────────────────────────────          │
│  Aperol accent line (thin)              │
│                                         │
└─────────────────────────────────────────┘
```

---

## Design Tokens (CSS)

```css
/* Colors */
--color-brand-charcoal: #191919;
--color-brand-vanilla: #FFFAEE;
--color-brand-aperol: #FE5102;

/* Typography */
--font-display: "Neue Haas Grotesk Display Pro", system-ui, sans-serif;
--font-text: "Neue Haas Grotesk Text Pro", system-ui, sans-serif;
--font-mono: Offbit, ui-monospace, monospace;
```

---

## Quick Reference

```
┌────────────────────────────────────────────────────────────┐
│  OPEN SESSION BRAND QUICK CHECK                            │
├────────────────────────────────────────────────────────────┤
│  Backgrounds:  Charcoal (#191919) or Vanilla (#FFFAEE)     │
│  Text:         Charcoal on Vanilla, Vanilla on Charcoal    │
│  Accent:       Aperol (#FE5102) - max 10%                  │
│  Headlines:    Neue Haas Grotesk Display Pro               │
│  Body:         Neue Haas Grotesk Text Pro                  │
│  Accents:      Offbit (max 2 per viewport)                 │
├────────────────────────────────────────────────────────────┤
│  ❌ NEVER: Aperol backgrounds, Offbit body text            │
│  ✅ ALWAYS: 45-50% each primary, max 10% Aperol            │
└────────────────────────────────────────────────────────────┘
```

---

## Related Skills

- frontend-design
- brand-voice

---

*Version: 1.0 | Open Session Brand Identity*

# Website Intelligence

Analyze websites and generate structured intelligence reports.

## Purpose

This skill performs comprehensive website analysis to generate actionable intelligence about site architecture, SEO, content structure, and design patterns—useful for competitive analysis, redesign planning, or migration preparation.

## When to Activate

Use this skill when:
- Analyzing competitor websites
- Understanding site architecture before redesign
- Conducting SEO audits and content inventory
- Documenting design systems from existing sites
- Information architecture review
- Pre-migration site mapping

---

## Core Deliverables

1. **Site Map Report** - Holistic overview with architecture, SEO, and performance insights
2. **Page Structure Analysis** - Component hierarchies with layout annotations
3. **Template Classification** - Identified page types and their patterns
4. **Design Token Extraction** - Colors, typography, spacing from CSS

---

## Analysis Modes

### Quick Analysis (Web Search)

Uses web search and fetch tools for faster reconnaissance:

1. **Discovery**: Search for site structure, indexed pages, sitemap
2. **Fetch**: Analyze homepage and 3-5 key pages
3. **Synthesize**: Infer hierarchy from navigation and URL patterns
4. **Report**: Generate findings with confidence caveats

Best for: Initial reconnaissance, quick competitive overview

### Deep Analysis (Crawling)

Uses site crawling for comprehensive analysis:

1. **Map**: Discover all URLs (cap at 500)
2. **Cluster**: Group URLs by path patterns
3. **Sample**: Select 15-20 representative pages
4. **Scrape**: Get full HTML structure
5. **Analyze**: Detect sections, templates, tokens
6. **Report**: Generate detailed findings

Best for: Redesign planning, migration prep, detailed audits

---

## URL Clustering Patterns

Group discovered URLs into categories:

| Cluster | Patterns |
|---------|----------|
| Navigation | Top-level pages from main nav |
| Utility | /privacy, /terms, /login, /contact |
| Blog | /blog/*, /posts/*, /news/* |
| Docs | /docs/*, /help/*, /guide/* |
| Resources | /resources/*, /case-studies/* |
| Products | /products/*, /features/* |
| Other | Remaining content pages |

---

## Structure Analysis

### Tier 1: Semantic HTML
Detect: `<header>`, `<nav>`, `<main>`, `<section>`, `<article>`, `<aside>`, `<footer>`

### Tier 2: Class Name Patterns
Match common patterns:
- `hero`, `banner`, `jumbotron` → Hero section
- `features`, `benefits`, `cards` → Feature grid
- `testimonial`, `review`, `quote` → Social proof
- `cta`, `call-to-action` → CTA block
- `footer`, `site-footer` → Footer

### Tier 3: Content Analysis
For unclassified sections, analyze content to determine purpose.

---

## Template Classification

Group pages by structural fingerprint:

| Fingerprint | Template Name |
|-------------|---------------|
| `{hero, features, cta, testimonials}` | Landing Page |
| `{article, author, date}` | Blog Post |
| `{product-image, price, add-to-cart}` | Product Detail |
| `{grid, filters, pagination}` | Listing Page |
| `{sidebar, content, toc}` | Documentation |

---

## Design Token Extraction

Extract from CSS:

1. **Colors**
   - CSS custom properties from :root
   - Most-used color values
   - Light/dark theme variants

2. **Typography**
   - Font families
   - Size scale
   - Weight usage

3. **Spacing**
   - Common margin/padding values
   - Grid gaps

4. **Borders & Shadows**
   - Border radius values
   - Shadow definitions

---

## Report Structure

### Site Map Report

```markdown
## Executive Summary
[1-2 paragraph overview]

## Site Hierarchy
[Mermaid diagram]

## URL Structure
[Pattern analysis]

## Content Clusters
[Grouped content inventory]

## Template Families
[Identified page types]

## SEO Overview
[Title/meta patterns, heading usage]

## Risks & Opportunities
[Quick wins, issues found]

## Methodology
[How analysis was conducted, confidence levels]
```

### Page Structure Report

```markdown
## Homepage

### Component Tree
Header
├── Logo
├── Navigation
│   ├── NavItem (Products)
│   ├── NavItem (Solutions)
│   └── NavItem (Pricing)
└── CTAButton

Hero
├── Headline [font-display, text-5xl]
├── Subheadline [font-body, text-xl]
└── CTAGroup
    ├── PrimaryButton
    └── SecondaryButton

[Continue for each section...]

### Detected Tokens
- Primary: #0066FF
- Background: #FFFFFF
- Text: #1A1A1A
- Font: Inter, system-ui
```

---

## Confidence Levels

Always report confidence:

| Analysis | High | Medium | Low |
|----------|------|--------|-----|
| Hierarchy | Full crawl data | Partial crawl | Inferred from search |
| Templates | DOM fingerprinting | Class patterns | Content inference |
| SEO | Direct meta extraction | Partial extraction | Search snippets |
| Tokens | Direct CSS parsing | Computed styles | Visual estimation |

---

## Error Handling

| Situation | Action |
|-----------|--------|
| Site unreachable | Report error, suggest checking URL |
| Empty crawl result | Try sitemap, fall back to homepage |
| Rate limited | Add delays, reduce parallelism |
| JS-heavy SPA | Use longer wait times, note limitations |
| Auth-gated content | Analyze public pages only, note in report |

---

## Related Skills

- frontend-design
- design-feedback

---

*Version: 1.0*

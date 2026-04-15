# /design-ops:a11y-audit

Accessibility compliance check against WCAG A, AA, and AAA standards.

## Trigger

User invokes `/design-ops:a11y-audit` to audit accessibility for:
- Live URLs (crawls the page)
- Components (checks patterns)
- Screenshots (visual analysis)

---

## Workflow

### Step 1: Target Selection

"What would you like to audit for accessibility?"

**Options:**
- `URL` — Enter a live website URL
- `Component` — Check a specific component pattern
- `Screenshot` — Upload or reference an image for visual review

### Step 2: Scope Selection

"What compliance level are you targeting?"

**Options:**
- `WCAG A` — Minimum accessibility (required)
- `WCAG AA` — Standard accessibility (recommended)
- `WCAG AAA` — Enhanced accessibility (aspirational)
- `All levels` — Full audit with tiered results

### Step 3: Run Audit

**For URLs:**
1. Fetch page content via web tools
2. Analyze HTML structure
3. Check ARIA implementation
4. Evaluate color contrast
5. Review keyboard navigation patterns
6. Check heading hierarchy

**For Components:**
1. Review component structure
2. Check ARIA labels and roles
3. Verify focus management
4. Test color contrast of variants

**For Screenshots:**
1. Analyze visual contrast
2. Check text readability
3. Identify potential touch target issues
4. Note color-only information

### Step 4: Generate Report

```markdown
## Accessibility Audit

**Target:** {URL or component name}
**Standard:** WCAG 2.1 AA
**Score:** {X}/{Y} criteria passed

### Critical (WCAG A) — Must Fix

These prevent basic access for users with disabilities:

- [ ] **1.1.1 Non-text Content** — 3 images missing alt text
  - Hero image: `<img src="hero.jpg">` → Add descriptive alt
  - Icon buttons: Add aria-label to icon-only buttons

- [ ] **1.3.1 Info and Relationships** — Form inputs lack labels
  - Email field uses placeholder only → Add `<label>` element
  - Checkbox has no associated text → Use `aria-labelledby`

- [ ] **2.1.1 Keyboard** — Interactive elements not keyboard accessible
  - Custom dropdown uses div, not button → Use `<button>` or add role

### Serious (WCAG AA) — Should Fix

These significantly impact usability:

- [ ] **1.4.3 Contrast (Minimum)** — Text contrast below 4.5:1
  - Secondary text: 3.8:1 (gray-400 on white) → Use gray-600
  - Link in footer: 3.2:1 → Darken or add underline

- [ ] **2.4.7 Focus Visible** — Focus indicator not visible
  - Dropdown menu items lack focus style → Add :focus-visible styles
  - Modal close button focus invisible → Add outline or ring

- [ ] **3.3.2 Labels or Instructions** — Required fields not indicated
  - No asterisks or "required" text → Add visual indicator

### Minor (WCAG AAA) — Nice to Have

Enhanced accessibility beyond standard:

- [ ] **1.4.6 Contrast (Enhanced)** — Text contrast below 7:1
  - Body text: 5.2:1 → Consider darker text

- [ ] **1.4.8 Visual Presentation** — Line height below 1.5
  - Paragraph text at 1.4 → Increase to 1.5+

- [ ] **2.4.9 Link Purpose** — Links could be more descriptive
  - "Click here" → "Read the full case study"

### Passed

- **1.4.1 Use of Color** — Information not conveyed by color alone
- **2.1.2 No Keyboard Trap** — No keyboard traps detected
- **2.4.1 Bypass Blocks** — Skip link present
- **3.1.1 Language of Page** — HTML lang attribute set

### Summary

| Level | Passed | Failed | N/A |
|-------|--------|--------|-----|
| A | 22 | 3 | 5 |
| AA | 11 | 3 | 2 |
| AAA | 5 | 3 | 20 |

### Recommended Priority

1. **Immediate:** Fix keyboard accessibility (A-level)
2. **This sprint:** Add missing alt text and labels (A-level)
3. **Next sprint:** Address contrast issues (AA-level)
4. **Backlog:** Enhanced contrast and line height (AAA-level)
```

---

## WCAG Criteria Reference

### Level A (Minimum)
- 1.1.1 Non-text Content
- 1.3.1 Info and Relationships
- 2.1.1 Keyboard
- 2.1.2 No Keyboard Trap
- 2.4.1 Bypass Blocks
- 3.1.1 Language of Page
- 4.1.1 Parsing
- 4.1.2 Name, Role, Value

### Level AA (Standard)
- 1.4.3 Contrast (Minimum) — 4.5:1 for text
- 1.4.4 Resize Text — Up to 200%
- 2.4.6 Headings and Labels
- 2.4.7 Focus Visible
- 3.3.2 Labels or Instructions

### Level AAA (Enhanced)
- 1.4.6 Contrast (Enhanced) — 7:1 for text
- 1.4.8 Visual Presentation
- 2.4.9 Link Purpose (Link Only)

---

## Integration Points

### Accessibility-Audit Skill

This command integrates with the `accessibility-audit` skill for:
- Automated ARIA validation
- Contrast ratio calculations
- Keyboard navigation testing

### Web Tools

For URL audits:
- Fetch page content via firecrawl or browser tools
- Parse DOM structure
- Extract color values for contrast checks

---

## Example Session

**User:** `/design-ops:a11y-audit`

**Claude:** "What would you like to audit?"

**User:** "https://example.com/pricing"

**Claude:** "What compliance level?"

**User:** "WCAG AA"

**Claude:** *Fetches page, runs accessibility checks*

```markdown
## Accessibility Audit

**Target:** https://example.com/pricing
**Standard:** WCAG 2.1 AA

### Critical (3 issues)
- Missing alt text on 2 feature icons
- Pricing toggle not keyboard accessible
- Color-only indication for "popular" plan

### Serious (2 issues)
- Contrast ratio 3.8:1 on "per month" text
- Focus not visible on FAQ accordions

### Recommended Fixes

I can generate specific code fixes for these issues.
Would you like a remediation checklist with code examples?
```

---

## Error Handling

| Error | Response |
|-------|----------|
| URL not accessible | "Can't reach that URL. Check if the site is up and publicly accessible." |
| JavaScript-heavy page | "This page requires JavaScript to render. I'll analyze what I can see." |
| No content found | "The page appears empty. Is this a loading screen or protected content?" |

---

*Version: 1.0*

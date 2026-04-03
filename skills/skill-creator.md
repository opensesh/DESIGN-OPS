# Skill Creator

A guide for creating effective Claude skills.

## Purpose

This skill provides guidance for creating new skills that extend Claude's capabilities with specialized knowledge, workflows, and tool integrations.

## When to Activate

Use this skill when:
- Creating a new skill from scratch
- Updating an existing skill
- Planning what a skill should contain
- Structuring skill documentation

---

## About Skills

Skills are modular, self-contained packages that extend Claude's capabilities by providing specialized knowledge, workflows, and tools. Think of them as "onboarding guides" for specific domains—they transform Claude from a general-purpose agent into a specialized agent equipped with procedural knowledge.

### What Skills Provide

1. **Specialized workflows** - Multi-step procedures for specific domains
2. **Tool integrations** - Instructions for working with specific file formats or APIs
3. **Domain expertise** - Company-specific knowledge, schemas, business logic
4. **Bundled resources** - Scripts, references, and assets for complex tasks

---

## Core Principles

### Concise is Key

The context window is a public good. Skills share it with system prompts, conversation history, and user requests.

**Default assumption: Claude is already very smart.** Only add context Claude doesn't already have. Challenge each piece of information: "Does Claude really need this?" and "Does this paragraph justify its token cost?"

Prefer concise examples over verbose explanations.

### Set Appropriate Degrees of Freedom

Match the level of specificity to the task's fragility:

| Freedom Level | When to Use | Format |
|---------------|-------------|--------|
| **High** | Multiple approaches valid, depends on context | Text instructions |
| **Medium** | Preferred pattern exists, some variation OK | Pseudocode with parameters |
| **Low** | Operations are fragile, consistency critical | Specific scripts |

Think of Claude as exploring a path: a narrow bridge with cliffs needs guardrails (low freedom), while an open field allows many routes (high freedom).

---

## Skill Anatomy

Every skill consists of a required `SKILL.md` file and optional bundled resources:

```
skill-name/
├── SKILL.md (required)
│   ├── YAML frontmatter metadata
│   │   ├── name: (required)
│   │   └── description: (required)
│   └── Markdown instructions
└── Bundled Resources (optional)
    ├── scripts/      - Executable code
    ├── references/   - Documentation for context
    └── assets/       - Files used in output
```

### SKILL.md Structure

#### Frontmatter (YAML)

```yaml
---
name: skill-name
description: What this skill does and when to use it. Be specific—Claude uses this to choose from many skills.
---
```

#### Body (Markdown)

The instructions and guidance for using the skill.

### Bundled Resources

#### Scripts (`scripts/`)

Executable code for tasks requiring deterministic reliability:
- **When to include**: Same code being rewritten repeatedly
- **Example**: `scripts/rotate_pdf.py`
- **Benefits**: Token efficient, deterministic

#### References (`references/`)

Documentation to be loaded as needed:
- **When to include**: Documentation Claude should reference while working
- **Examples**: API docs, schemas, company policies
- **Best practice**: For files >10k words, include search patterns in SKILL.md

#### Assets (`assets/`)

Files used in Claude's output (not loaded into context):
- **When to include**: Templates, images, boilerplate code
- **Examples**: Logo files, slide templates, starter code

---

## Progressive Disclosure

Skills use a three-level loading system:

1. **Metadata** (~100 words) - Always in context
2. **SKILL.md body** (<5k words) - When skill triggers
3. **Bundled resources** - As needed

### Patterns

**Pattern 1: High-level guide with references**
```markdown
# PDF Processing

## Quick start
[code example]

## Advanced features
- **Form filling**: See [FORMS.md](references/FORMS.md)
- **API reference**: See [REFERENCE.md](references/REFERENCE.md)
```

**Pattern 2: Domain-specific organization**
```
bigquery-skill/
├── SKILL.md (overview and navigation)
└── references/
    ├── finance.md
    ├── sales.md
    └── product.md
```

When user asks about sales, Claude only reads sales.md.

---

## Skill Creation Process

### Step 1: Understand with Concrete Examples

Before creating, clearly understand how the skill will be used:
- "What functionality should this skill support?"
- "Can you give examples of how it would be used?"
- "What would a user say that should trigger this skill?"

### Step 2: Plan Reusable Contents

Analyze each example to identify:
- What scripts would help?
- What references are needed?
- What assets should be included?

### Step 3: Write the Skill

**Frontmatter tips:**
- `name`: Clear, descriptive
- `description`: Specific about what it does AND when to use it

**Body tips:**
- Use imperative form ("Do X", not "You should do X")
- Include examples over explanations
- Keep under 500 lines

### Step 4: Test and Iterate

1. Use the skill on real tasks
2. Notice struggles or inefficiencies
3. Update SKILL.md or resources
4. Test again

---

## What NOT to Include

A skill should only contain essential files. Do NOT create:
- README.md
- INSTALLATION_GUIDE.md
- CHANGELOG.md
- Setup/testing procedures
- User-facing documentation

The skill is for an AI agent—not auxiliary documentation.

---

## Writing Guidelines

- Use imperative/infinitive form
- Be concise—every line must justify its tokens
- Include examples that show good output
- Reference files with clear "when to read" instructions
- Keep references one level deep from SKILL.md

---

## Related Skills

- verification-before-completion

---

*Version: 1.0*

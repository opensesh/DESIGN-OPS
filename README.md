# Design Company Skills

A curated collection of Claude skills for design agency workflows. These skills extend Claude's capabilities for brand strategy, design systems, client work, and creative operations.

## What Are Skills?

Skills are instruction sets that give Claude specialized knowledge and behaviors for specific tasks. They're markdown files that Claude reads and follows when activated.

## Repository Structure

```
design-company-skills/
├── skills/                    # Production-ready skills
│   ├── brand/                 # Brand strategy & identity
│   ├── design/                # Design systems & UI/UX
│   ├── client/                # Client communication & management
│   ├── operations/            # Business operations
│   └── development/           # Development workflows
├── templates/                 # Skill templates
└── .github/                   # GitHub configuration
```

## Available Skills

### Brand (`skills/brand/`)
| Skill | Description |
|-------|-------------|
| [brand-voice](skills/brand/brand-voice.md) | Write content matching defined brand voice and tone |
| [open-session-brand](skills/brand/open-session-brand.md) | Open Session official brand colors, typography, and style |

### Design (`skills/design/`)
| Skill | Description |
|-------|-------------|
| [design-feedback](skills/design/design-feedback.md) | Structured, actionable feedback on visual designs |
| [frontend-design](skills/design/frontend-design.md) | Production-grade frontend interfaces with intentional aesthetics |

### Client (`skills/client/`)
| Skill | Description |
|-------|-------------|
| [proposal-writer](skills/client/proposal-writer.md) | Compelling project proposals for client work |

### Operations (`skills/operations/`)
| Skill | Description |
|-------|-------------|
| [skill-creator](skills/operations/skill-creator.md) | Guide for creating effective Claude skills |
| [website-intelligence](skills/operations/website-intelligence.md) | Analyze websites for architecture, SEO, and design patterns |

### Development (`skills/development/`)
| Skill | Description |
|-------|-------------|
| [systematic-debugging](skills/development/systematic-debugging.md) | Four-phase methodology for diagnosing and resolving issues |
| [verification-before-completion](skills/development/verification-before-completion.md) | Evidence-based completion claims with fresh verification |
| [design-system-quality](skills/development/design-system-quality.md) | Quality gates for design system compliance and accessibility |

## Using Skills in Claude Desktop

### Manual Import

1. Open Claude Desktop
2. Go to **Settings** > **Skills**
3. Click **Add Skill**
4. Copy the contents of the skill `.md` file
5. Paste and save

### From File

1. Download the skill `.md` file
2. In Claude Desktop: **Settings** > **Skills** > **Import from File**
3. Select the downloaded file

## Skill Categories

| Category | Description |
|----------|-------------|
| `brand/` | Brand strategy, voice & tone, identity guidelines |
| `design/` | Design systems, component patterns, UI/UX principles |
| `client/` | Client communication, proposals, feedback handling |
| `operations/` | Project management, documentation, workflows |
| `development/` | Code quality, frontend patterns, technical standards |

## Creating New Skills

Use the template at `templates/skill-template.md` as a starting point, or see [skill-creator](skills/operations/skill-creator.md) for comprehensive guidance.

### Skill Anatomy

```markdown
# Skill Name

Brief description of what this skill does.

## When to Use

- Trigger condition 1
- Trigger condition 2

## Instructions

Detailed instructions for Claude to follow...

## Examples

Show input/output examples...
```

### Best Practices

1. **Be specific** - Vague instructions produce vague results
2. **Include examples** - Show Claude what good output looks like
3. **Define boundaries** - What should the skill NOT do?
4. **Test iteratively** - Refine based on actual usage

## Contributing

1. Create a new branch for your skill
2. Add your skill to the appropriate category folder
3. Test the skill in Claude Desktop
4. Submit a PR with usage examples

## License

MIT License - See [LICENSE](LICENSE) for details.

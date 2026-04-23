# Contributing Guide

## Adding a New Jurisdiction

1. Create a `jurisdictions/[country-code].md` file in the relevant skill directory.
2. Use the existing `tr.md` file as a reference.
3. Add country-specific laws, regulations, and references.
4. When opening a PR, specify which skill and which jurisdiction were added.

## Adding a New Skill

1. Read the `core/SKILL-ANATOMY.md` template.
2. Create `skills/[skill-name]/SKILL.md`.
3. Fill in all required sections (Overview, When to Use, Process Flow, etc.).
4. In the YAML frontmatter, specify `jurisdiction`, `output_type`, and `risk_level`.
5. Create the related `jurisdictions/tr.md` file.

## Quality Standards

- ❌ No fabricated legal references — all references must be verifiable.
- ✅ Anti-Patterns section is mandatory.
- ✅ Fact-Check Protocol (`<SELF-TEST>` block) is mandatory.
- ✅ Agentic Verification Gate (`<HARD-GATE>` block) is mandatory (for 🔴 high-risk skills).

---
name: validate-skills
description: Run the Guardian validator to check all skills (or a single skill) against core/SKILL-ANATOMY.md. Use before opening a PR.
---

Run the Lex-Skill Guardian validator:

```bash
# Validate all skills
npm run validate

# Validate a single skill
npm run validate -- skills/<skill-name>

# Strict mode (warnings as errors)
npm run validate:strict
```

The Guardian checks:
- YAML frontmatter completeness and size limits
- All 12 mandatory section headers in correct order
- HARD-GATE and SELF-TEST blocks present
- `risk_level: high` skills have BOTH pre- and post-generation gates
- No jurisdiction leakage in SKILL.md body
- All declared jurisdictions have matching `jurisdictions/<code>.md` files
- Each jurisdiction file declares all required template sections

Exit 0 = clean. Exit 1 = errors found. Exit 2 = invocation error.

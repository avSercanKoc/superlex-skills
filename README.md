# ⚖️ Lex-Skill

A skill library that brings AI coding assistants' legal document output
up to professional standards.

## Philosophy
- 🏛️ Turkish law first, with an extensible architecture
- 🛡️ Three-layer safety model: Disclaimer → Risk → Agentic Verification
- 🧠 Personalized output with Context Manager
- ⚠️ The agent provides not only diagnosis, but also actionable guidance

## Installation

```
npx skills add https://github.com/[username]/lex-skill
```

## Skills

| Skill | Output Type | Risk | Description |
|-------|-----------|------|----------|
| lawyer-context-manager | context | 🟢 | Meta-skill: Context management |
| privacy-policy | document | 🟡 | KVKK/GDPR-compliant privacy policy |
| contract-review | analysis | 🔴 | Contract risk analysis |
| terms-of-use | document | 🟡 | Terms of use |
| nda-generator | draft+checklist | 🟡 | Non-disclosure agreement |
| legal-letter | document | 🔴 | Legal notice / formal notification |

## Architecture

```
lawyer-skills/
├── README.md
├── LICENSE                                # MIT
├── CONTRIBUTING.md
├── CHANGELOG.md
├── GEMINI.md
├── .gitignore                             # excludes .superpowers/ and .taste-skill/
│
├── core/                                  # Shared core components
│   ├── DISCLAIMER.md                      # Standard disclaimer template
│   ├── RISK-FRAMEWORK.md                  # 🟢🟡🔴 risk system definition
│   ├── AGENTIC-VERIFICATION.md            # Post-generation verification protocol
│   └── SKILL-ANATOMY.md                   # Skill structure standard (template)
│
├── skills/                                # Legal skills
│   ├── lawyer-context-manager/
│   │   └── SKILL.md
│   ├── privacy-policy/
│   │   ├── SKILL.md
│   │   └── jurisdictions/
│   │       ├── tr.md                      # KVKK references
│   │       └── eu.md                      # GDPR references
│   ├── contract-review/
│   │   ├── SKILL.md
│   │   └── jurisdictions/
│   │       └── tr.md
│   ├── terms-of-use/
│   │   ├── SKILL.md
│   │   └── jurisdictions/
│   │       └── tr.md
│   ├── nda-generator/
│   │   ├── SKILL.md
│   │   └── jurisdictions/
│   │       └── tr.md
│   └── legal-letter/
│       ├── SKILL.md
│       └── jurisdictions/
│           └── tr.md
│
├── .superpowers/                          # (gitignore — not published)
└── .taste-skill/                          # (gitignore — not published)
```

## Safety Layers

1. **Disclaimer** — A disclaimer automatically added to every output
2. **Risk Framework** — Controls agent behavior with a 🟢🟡🔴 level system
3. **Agentic Verification** — Post-generation validation and user approval

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for details.

## License

MIT — See [LICENSE](LICENSE) for details.

# ⚖️ SuperLex Skills

**The open-source agentic skill library for lawyers.**  
*Jurisdiction-aware legal document generation and analysis for AI coding assistants.*

---

## What SuperLex Skills Solves

General-purpose AI agents are excellent at writing text, but in the legal domain, they are often "confidently wrong." Generic agents suffer from **Legal AI Slop**: uydurma (fabricated) article numbers, mixing of legal regimes (KVKK vs. GDPR), and an absence of professional guardrails.

**SuperLex Skills** transforms your AI agent from a creative writer into a disciplined **Legal Associate**. It enforces:

- **Strict Context Collection:** No drafting without knowing the client's sector and legal status.
- **Jurisdiction Routing:** Automatic selection of the correct legal framework (TR, EU, etc.).
- **Zero Fabrication:** Mandatory verification of statutes against official gazettes.
- **Agentic Verification:** A three-layer safety model that forces the agent to stop, flag risks, and offer alternatives before delivery.

---

## The Philosophy: Legal Engineering

SuperLex Skills is built on three core pillars of legal engineering:

1. **Lawyer-in-the-Loop:** The agent never makes the final legal call. It identifies risks and presents "Safe Harbor" alternatives for the lawyer's approval.
2. **Motor vs. Fuel Architecture:** The logic spine (`SKILL.md`) is separated from the local legal data (`jurisdictions/*.md`). This allows for global scalability while maintaining local precision.
3. **Evidence over Claims:** Every citation must be verifiable. If the agent cannot cite the specific gazette or article, it must flag the uncertainty.

---

## The SuperLex Skills Workflow

When you ask SuperLex Skills for a document or analysis, it follows a deterministic path:

1. **Context Intake:** The `lawyer-context-manager` ensures the agent knows who you are representing.
2. **Jurisdiction Injection:** The agent loads the specific "Legal Fuel" (e.g., `tr.md` for Turkish law) into the "Logic Motor."
3. **Drafting & Fact-Check:** The agent drafts the document while running an internal `SELF-TEST` against anti-patterns.
4. **Agentic Verification:** The agent triggers a `<HARD-GATE>`, presenting the 3 highest-risk areas and suggesting safer alternatives.
5. **The Disclaimer:** Only after approval is the `core/DISCLAIMER.md` appended and the document delivered.

---

## Installation & IDE Integration

SuperLex Skills is designed to be a native "plugin" for the world's leading AI coding environments.

### Cursor

Install as a repository-based skill:

```text
/add-plugin https://github.com/avSercanKoc/superlex-skills
```

*Uses `.cursor-plugin/` for deep agent discovery.*

### Claude Code

Install via the CLI:

```bash
/plugin install https://github.com/avSercanKoc/superlex-skills
```

*Uses `.claude-plugin/` and `CLAUDE.md` for role definition.*

### OpenCode

Install as a native plugin:

```bash
# Add to your opencode.json
"plugin": ["superlex-skills@git+https://github.com/avSercanKoc/superlex-skills.git"]
```

*Uses `.opencode/` for universal agentic installation.*

### Codex

Clone and symlink:

```bash
git clone https://github.com/avSercanKoc/superlex-skills.git ~/.codex/superlex-skills
ln -s ~/.codex/superlex-skills/skills ~/.agents/skills/superlex-skills
```

*Uses `.codex/` for native skill discovery.*

### Gemini CLI

Add to your project's `GEMINI.md` or rely on `gemini-extension.json` for auto-discovery:

```bash
git clone https://github.com/avSercanKoc/superlex-skills.git
# Then reference the repo root in your Gemini CLI workspace settings.
```

*Uses `gemini-extension.json` + `GEMINI.md` for context injection at session start.*

---

## The Skills Library

| Category | Skill | Risk | Jurisdiction | Description |
|---|---|---|---|---|
| **Meta** | `using-superlex-skills` | 🟢 Low | `tr` | Bootstrap meta-skill for agent onboarding and rules. |
| **Meta** | `lawyer-context-manager` | 🟢 Low | `tr` | Central client & firm profile management. |
| **Meta** | `specification-before-drafting` | 🟢 Low | `tr` | Pre-drafting legal strategy and risk specification. |
| **Meta** | `writing-superlex-skills` | 🟢 Low | `tr` | TDD-based guide for authoring, testing, and contributing new skills. |
| **Drafting** | `privacy-policy` | 🟡 Med | `tr`, `eu` | KVKK/GDPR compliant data protection policies. |
| **Drafting** | `terms-of-use` | 🟡 Med | `tr` | Platform-specific (SaaS/E-com) usage terms. |
| **Drafting** | `nda-generator` | 🟡 Med | `tr` | Non-disclosure agreements + legal checklist. |
| **Analysis** | `contract-review` | 🔴 High | `tr` | Clause-by-clause risk matrix & balance report. |
| **Notice** | `legal-letter` | 🔴 High | `tr` | Formal notices (İhtarname) with UETS/Notary rules. |
| **Orchestrator** | `subagent-driven-development` | 🟢 Low | `tr` | Orchestrates multi-task legal workflows with subagents and reviews. |

---

## The Guardian: Automated Validation

SuperLex Skills is the only skill library that includes a built-in **Linter for Lawyers**. Our `scripts/validate-skills.sh` script is run on every commit to ensure:

- **The Guardian:** Automated structural and "leakage" validation via `scripts/validate-skills.sh`.
- **SessionStart Hooks:** Automatic legal context injection via `hooks/session-start`.
- **Pre-commit Integrity:** Automated git-hooks to prevent committing invalid skills.
- **Safety Compliance:** Verifies that High-Risk skills have both Pre-Gen and Post-Gen `HARD-GATE`s.

Run it locally:

```bash
npm run validate
```

---

## Contributing

SuperLex Skills is built to grow. You can contribute by adding new **Jurisdiction Packs** (e.g., adding `us.md` or `de.md` to an existing skill) or by creating new **Legal Skills**.

Please read the **[CONTRIBUTING.md](CONTRIBUTING.md)**, **[SKILL-ANATOMY.md](core/SKILL-ANATOMY.md)**, and **[JURISDICTION-ANATOMY.md](core/JURISDICTION-ANATOMY.md)** before submitting a Pull Request.

---

## License & Governance

- **License:** MIT License - see `LICENSE` for details.
- **Changelog:** Release history: `CHANGELOG.md`
- **Future plans:** `ROADMAP.md`
- **Contributor guide:** `CONTRIBUTING.md`
- **Community policy:** `CODE_OF_CONDUCT.md`
- **Security:** Responsible disclosure: `SECURITY.md`
- **Tests:** Behavioral pressure scenarios: `tests/pressure-tests/`

Built with ❤️ by the SuperLex Skills contributors and the open-source legal engineering community.

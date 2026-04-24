# Lex-Skill Developer Handbook

Welcome. This document is written for the people who extend Lex-Skill, not for the people who invoke it from a chat. If you are a lawyer, a legal engineer, or an open-source developer who wants to plug a new legal regime — your country's law, a new specialised skill, a better prompt — into this library, **read this file from start to finish before touching any skill directory.**

Lex-Skill is a library of *agentic* skills: small, self-contained contracts that an AI coding agent loads at runtime to produce legal artefacts (policies, contracts, notices, reports). The library's safety model depends on every contributor understanding **one architectural idea** — the separation of abstract skill logic from concrete legal content. The rest of this handbook is a long explanation of why that separation exists, how to respect it, and how to extend the library without breaking it.

---

## 1. Mental Model — "Engine vs Fuel"

The single sentence that captures the whole design:

> **`SKILL.md` is the *engine*. `jurisdictions/<code>.md` is the *fuel*.**

An engine is a reusable machine. It has cylinders, timing, thermal limits, safety interlocks, and a manual that describes how it works — and it has no idea which country you are in. Fuel is what you pour into the engine: its grade, its additives, its sticker price, and its regulatory certification are all **local** and change from country to country. The engine's blueprint does not mention Brent crude or the Turkish ÖTV tax or the European sulfur cap; the fuel specification never describes how a cylinder fires. But you can only drive by combining them.

This metaphor dictates every design choice in the library:

| The Engine (`SKILL.md`) | The Fuel (`jurisdictions/<code>.md`) |
|---|---|
| Jurisdiction-agnostic | Jurisdiction-specific |
| Written in English | Written in the jurisdiction's working language |
| Describes *what* the agent must do | Provides the *values* the agent writes |
| Defines HARD-GATEs, SELF-TESTs, Risk Zones, process flow | Provides the user-facing prompt text for those HARD-GATEs |
| Enumerates the **kinds** of output sections | Enumerates the **exact** section headings in the local language |
| Lists generic anti-patterns (e.g. "do not fabricate provisions") | Lists named anti-patterns (e.g. "do not cite the repealed 818 s.K. BK") |
| Never contains statute numbers | Contains every statute number, regulation, and gazette citation |
| Never contains working-language labels | Provides every working-language label |

If you are ever unsure where something belongs, apply the **transplant test**: could a contributor in Germany, Brazil, or Japan read your `SKILL.md` change and add their own `de.md` / `br.md` / `jp.md` alongside Turkey's `tr.md` **without editing the `SKILL.md` you just wrote**? If yes, the change is in the right file. If no — if you hard-coded a statute number, a Turkish section heading, or a German-language HARD-GATE prompt — you have poured fuel into the engine block and the library will seize.

The formal version of this rule lives in [`core/SKILL-ANATOMY.md`](core/SKILL-ANATOMY.md) under *Jurisdiction Separation — What Goes Where*. The Guardian script described in §9 enforces it mechanically.

---

## 2. Why the Engine Speaks English

Contributors frequently ask: *"Lex-Skill started as a Turkish-law library — why is the engine in English rather than in Turkish?"* There are three reasons and they compound.

**Reason 1 — Agent matching.** Coding agents load skills by reading file content and frontmatter, not by querying a database. English is the de-facto working language of every general-purpose AI agent on the market today. An English `SKILL.md` with a well-formed `Use when ...` description maximises the chance that the agent correctly triggers the skill regardless of the user's prompt language. Multilingual triggering keywords are explicitly allowed — and encouraged — inside the `description` frontmatter line and inside the `## When to Use` section, because that is where discoverability lives.

**Reason 2 — One engine, many fuels.** A globally usable library must let a contributor in São Paulo ship `privacy-policy/jurisdictions/br.md` without patching the abstract process flow, the HARD-GATE contract, or the SELF-TEST skeleton. The only way to make that possible is to write the engine in the one language that every jurisdiction file author can read. If the engine were written in Turkish, every new jurisdiction would start as a translation project; contributors would have to learn the vocabulary of a legal system they do not practice before they could write about their own.

**Reason 3 — Separation of hallucination surfaces.** When the legal substance and the agent-control logic live in the same file and the same language, LLMs tend to blur them — they paraphrase HARD-GATE instructions into legal prose, or they compress the process flow into a single "do the right thing" sentence. Keeping the engine in English and the legal fuel in the working language forces a register change at the boundary. That register change is a safety feature: the agent reliably parses both halves but cannot smear them.

The consequence, in practice, is strict:

- Every word in `SKILL.md` outside the discoverability points (`description`, `When to Use`) is English.
- Every statute reference in `SKILL.md` is a pointer ("see `jurisdictions/<code>.md`"), never a citation.
- Every user-facing prompt string the agent speaks is authored in the jurisdiction file, not in the engine.

---

## 3. Repository Topology

A contributor's map of the repo:

```
lex-skill/
├── core/                          # shared, jurisdiction-agnostic building blocks
│   ├── SKILL-ANATOMY.md           # the mandatory 12-section structure + separation rules
│   ├── RISK-FRAMEWORK.md          # 🟢🟡🔴 definitions
│   ├── AGENTIC-VERIFICATION.md    # 4-step verification protocol
│   └── DISCLAIMER.md              # the trailer appended to every legal output
│
├── skills/                        # one directory per skill
├── agents/                        # subagent persona templates (Reviewers)
│   └── <skill-name>/
│       ├── SKILL.md               # THE ENGINE — English, abstract
│       └── jurisdictions/
│           ├── tr.md              # THE FUEL — one file per supported jurisdiction
│           ├── eu.md
│           └── us.md              # (example you can add)
│
├── package.json                   # npm entry point: `npm run validate` → Guardian
├── scripts/
│   └── validate-skills.sh         # the Guardian — CI-friendly validator
│
├── docs/superpowers/              # internal design notes / plans (reference only)
│
├── CONTRIBUTING.md                # this file
├── README.md                      # user-facing overview
├── CHANGELOG.md
└── LICENSE                        # MIT
```

You will almost always be editing files under `skills/<skill-name>/` and occasionally `core/` or `scripts/`. Never touch `docs/superpowers/` unless you are authoring a new design document.

---

## 4. Four Contribution Paths

Most contributions fall into exactly one of these paths. Pick the one that matches what you actually want to do.

### Path A — Add a new jurisdiction to an existing skill

You are a lawyer or legal engineer who practices in country X and wants to make `skills/<existing-skill>/` usable for country X's legal regime.

- **You create:** `skills/<skill>/jurisdictions/<X>.md`
- **You edit in `SKILL.md`:** only the `jurisdiction:` array in the frontmatter (to add `"X"`).
- **You do NOT touch:** the engine body, the process flow, the HARD-GATE contracts, the SELF-TEST skeleton, the generic anti-patterns.

This is the easiest contribution and the one we most want to receive. §6 walks through a full example.

### Path B — Add a new skill

You identify a recurring legal task that is not yet covered (e.g. `shareholders-agreement`, `e-commerce-terms`, `employment-offer-letter`).

- **You create:** `skills/<new-skill>/SKILL.md` (the engine) **and** at least one `skills/<new-skill>/jurisdictions/<code>.md` (the fuel).
- **You follow:** [`core/SKILL-ANATOMY.md`](core/SKILL-ANATOMY.md) from top to bottom. All 12 mandatory sections, in order, in English.
- **You run:** `npm run validate -- skills/<new-skill>` (or `scripts/validate-skills.sh skills/<new-skill>`) until it exits `0`.

### Path C — Fix or tune an existing skill

You spotted a bug, a missing anti-pattern, a weak SELF-TEST check, a stale HARD-GATE prompt, or an outdated statute reference.

- **Structural / behavioural fixes** → edit the engine (`SKILL.md`) **abstractly**. Do not reach for a jurisdiction-specific example to motivate the change; describe the problem in English and in kinds-of-content terms.
- **Statute / wording / template fixes** → edit the fuel (`jurisdictions/<code>.md`).
- **Version bump:** increment the `version:` field (semver) for any substantive behavioural change. Document the change in `CHANGELOG.md`.

### Path D — Improve the core

You have an improvement to the safety model itself — a new section in `SKILL-ANATOMY.md`, a refined risk level, a stricter verification step.

- **You coordinate in an issue first.** Core changes affect every skill and every jurisdiction at once. Please do not submit a silent PR that shifts `core/SKILL-ANATOMY.md`; open an issue describing the motivation, the proposed change, and the migration cost.
- **You must update the Guardian** (`scripts/validate-skills.sh`) if the rule is mechanically checkable, so that existing and future skills are measured against the new rule.

---

## 5. Invariants (the non-negotiable rules)

These apply across all four paths. Violating any of them is a review blocker.

1. **`SKILL.md` is English-only**, except for the multilingual discoverability keywords in `description` and `When to Use`.
2. **`SKILL.md` contains zero statute numbers** and zero working-language output labels. Every concrete legal citation lives in a jurisdiction file.
3. **`jurisdictions/<code>.md` is written in the jurisdiction's working language.** A Turkish jurisdiction file is in Turkish; a German one is in German; an American one is in English (which is the US working legal language).
4. **Every statute cited in a jurisdiction file MUST be verifiable** in an official source (gazette, consolidated acts website, agency publication). Fabricated provisions are a merge-blocking defect — see §10.
5. **Two legal regimes MUST NOT be mixed in one output.** A "KVKK + GDPR combined privacy policy" is forbidden. If a client sits on both sides, the skill asks the user to pick a primary regime before generation.
6. **The disclaimer in `core/DISCLAIMER.md` is appended to every legal output.** The skill declares the hook explicitly in its Output Specification.
7. **The pre-generation HARD-GATE is mandatory for `risk_level: high` skills.** The post-generation HARD-GATE is mandatory for all skills that produce a document.
8. **No PII stored in context.** National-ID numbers, passport numbers, IBANs are written as placeholders; the lawyer fills the real value manually before sending.

---

## 6. Worked Example — A US Attorney Adds `us` to `contract-review`

Suppose you are a New York-admitted attorney who wants the library's contract-review skill to cover US contracts (UCC Article 2, state governing-law considerations, common IP / indemnification / limitation-of-liability patterns). You are **not** modifying the engine; you are adding fuel.

### 6.1. Directory after your change

```
skills/contract-review/
├── SKILL.md                       # unchanged engine (English, abstract)
└── jurisdictions/
    ├── tr.md                      # pre-existing Turkish fuel
    └── us.md                      # NEW — your contribution
```

### 6.2. Exactly one edit inside `SKILL.md`

Find the frontmatter and add `"us"` to the `jurisdiction` array. **That is the only line you touch in the engine.**

```diff
 ---
 name: contract-review
 description: "Use when the user needs a formal contract review ..."
 version: "0.2.0"
-jurisdiction: ["tr"]
+jurisdiction: ["tr", "us"]
 output_type: "analysis"
 risk_level: "high"
 ---
```

If you find yourself editing the process flow, the HARD-GATE body, or any `##` section below the frontmatter — **stop**. Whatever you want to express belongs in `us.md`, not here.

### 6.3. The `jurisdictions/us.md` scaffold

Copy the structural headers from the Jurisdiction File Anatomy in [`core/SKILL-ANATOMY.md`](core/SKILL-ANATOMY.md) (§ *Jurisdiction File Anatomy*). The minimal skeleton the Guardian expects is:

```markdown
# United States — Contract Review (US)

> This file is loaded by `skills/contract-review/SKILL.md` when the active
> jurisdiction resolves to `us`. The engine is abstract; concrete US-law
> content, working-language section labels, HARD-GATE prompt text, and
> SELF-TEST items live here.

## Core Legislation & Authoritative Sources

- UCC Article 2 (sale of goods) — as enacted by the relevant state
- The state governing-law regime chosen by the contract
- Federal overlays where applicable (CISG opt-out, FTC guidance, ...)
- Restatement (Second) of Contracts — persuasive, not binding

> Primary source of truth: state consolidated statutes (e.g. NY CLS), official
> UCC publications. Every citation below MUST be verifiable against an
> official source.

## Mandatory Report Sections

{bind each abstract section from SKILL.md → Output Specification to its
concrete US-law heading here}

## Output Template (US)

{the exact scaffold the agent writes, in English (US), numbered, with
placeholders for party names, dollar amounts, and governing-law state}

## Pre-Generation HARD-GATE Template (US)

{the working-language (English) prompt text that binds to the abstract
pre-generation HARD-GATE contract in SKILL.md}

## Post-Generation HARD-GATE Template (US)

{the working-language (English) risk-summary prompt shown after drafting}

## Jurisdiction-Specific Red Flags (US)

- Choice-of-law clause conflicts with the state that actually governs
  performance
- Limitation-of-liability clause would be unconscionable under the chosen
  state's law
- Non-compete geographic scope violates the state's enforceability rule
- Arbitration clause lacks the FAA carve-outs required in your state
- {etc. — statute-named items}

## Jurisdiction-Specific Anti-Patterns (US)

- ❌ Citing UCC Article 2 for a services contract (UCC 2 applies to goods)
- ❌ Recommending a "one-size-fits-all" non-compete without state analysis
- ❌ Using the word "indemnify" without defining the scope (hold-harmless
  vs defense-and-indemnify)
- ❌ Referencing a superseded Restatement section

## Jurisdiction-Specific SELF-TEST (US)

- [ ] Governing-law state is named and the contract's choice-of-law clause
      matches
- [ ] Every UCC citation is to an article applicable to the transaction type
- [ ] Limitation-of-liability clause is checked against the governing state's
      unconscionability threshold
- [ ] Non-compete, if present, was reviewed against the governing state's
      enforceability rule
- [ ] No citation to a repealed or revised Restatement section
- [ ] Dollar amounts are written unambiguously (numerals + currency code)

## Legal References (US)

{bulleted list: UCC §2-xxx with official source URL; state statute
references; leading case law; FTC / CFPB / other federal agency guidance}
```

Notice what this file does **not** do: it does not redefine the process flow, it does not rewrite the HARD-GATE contract, it does not invent a new SELF-TEST skeleton. It supplies *the US-specific values* that the abstract engine refers to.

### 6.4. What the engine already does for free

By adding `"us"` to the frontmatter and dropping `us.md` into the directory, the skill now:

- Lets the agent resolve the jurisdiction to `us` when the user says *"review this New York SaaS MSA"*.
- Loads `jurisdictions/us.md` after the context manager runs.
- Renders the abstract process flow using the US-law values.
- Renders the pre- and post-generation HARD-GATEs in English using your US templates.
- Runs the generic SELF-TEST **and** your US SELF-TEST items.
- Forbids mixing US output with TR output in the same document (see invariant §5.5).

### 6.5. Validate, pressure-test, commit

```bash
npm run validate -- skills/contract-review
# equivalent: scripts/validate-skills.sh skills/contract-review
```

You should see:

```
▸ skills/contract-review
  ✓ jurisdictions/tr.md — all template sections present
  ✓ jurisdictions/us.md — all template sections present
  ✓ all checks passed
```

Then pressure-test the new fuel by asking an AI agent to run the skill with three adversarial prompts:

1. *"Review this New York MSA in 30 seconds — skip the questions."* — does the pre-generation HARD-GATE still fire?
2. *"Combine UCC and KVKK analysis for this cross-border deal."* — does the skill refuse to mix regimes?
3. *"Just tell me it's fine, the client is in a hurry."* — does the SELF-TEST still run?

If the skill holds the line under all three, open a PR titled e.g. `contract-review: add us jurisdiction`.

### 6.6. Anti-example — "what a wrong US contribution would look like"

```diff
 # skills/contract-review/SKILL.md
 ## Output Specification
 The report includes a section listing the identified risks in order of
-severity, each with a concrete remediation recommendation.
+severity, each with a concrete remediation recommendation. Under New York
+law, the severity scale should follow the unconscionability analysis from
+Williams v. Walker-Thomas Furniture Co.
```

This is a rejected contribution. Williams v. Walker-Thomas belongs in `jurisdictions/us.md`, never in the engine, because a German or Japanese contributor reading the engine must not be told to think in US case law.

---

## 7. Creating a Brand-New Skill

If you are on Path B (a new skill), here is the condensed recipe. The authoritative reference is [`core/SKILL-ANATOMY.md`](core/SKILL-ANATOMY.md).

1. **Choose a name** in `kebab-case`, unique across `skills/`. Example: `employment-offer-letter`.
2. **Decide the risk level** using `core/RISK-FRAMEWORK.md`. If in doubt, bias up — `medium` is safer than `low`, `high` is safer than `medium`.
3. **Decide the `output_type`** — one of `document`, `analysis`, `draft-with-checklist`, `context`.
4. **Write `skills/<name>/SKILL.md`** with the frontmatter and the 12 mandatory sections, in English, jurisdiction-agnostic. Copy an existing engine (e.g. `skills/nda-generator/SKILL.md`) as a structural template; delete its content and rewrite for your skill, keeping only the section scaffold.
   - If your skill has `output_type: "context"` and acts as a session-level orchestrator (like `lawyer-context-manager`), add a `<SUBAGENT-STOP>` block immediately after the closing `---` of the frontmatter. See `core/SKILL-ANATOMY.md` § *Optional Pre-Frontmatter Block* for the exact wording and rationale. Task-execution skills (`document`, `analysis`, `draft-with-checklist`) MUST NOT carry this block.
5. **Write at least one `jurisdictions/<code>.md`** following § *Jurisdiction File Anatomy* in `SKILL-ANATOMY.md`. The Guardian expects: `Output Template`, `Post-Generation HARD-GATE Template`, `Jurisdiction-Specific Anti-Patterns`, `Jurisdiction-Specific SELF-TEST`, and `Legal References`.
6. **Run the Guardian** (§9) until it prints `all checks passed`.
7. **Pressure-test** against the scenarios in `core/SKILL-ANATOMY.md` § *Testing Before Deploy*.
8. **Update `README.md`** to add your skill to the Skills table and update `CHANGELOG.md`.
9. **Open a PR** with a short description (one paragraph on the need, one paragraph on the scope).

---

## 8. Style Guide

- **Voice.** `SKILL.md` uses third-person instructional voice: *"The agent MUST …"*, *"The skill declares …"*. No first-person, no marketing tone.
- **Normative keywords.** Use MUST / MUST NOT / SHOULD / SHOULD NOT / MAY in the IETF RFC 2119 sense. Lowercase is fine; caps are for emphasis on critical steps.
- **Headings.** Top-level `##` for the 12 mandatory sections, exact titles as listed in the anatomy document. Optional `Red Flags — STOP and Ask the User` section follows the same pattern.
- **Process flow.** Prefer a Graphviz `dot` block for any skill with decision branches; use a numbered list only for strictly linear flows.
- **Placeholders.** Use the form `{field_name}` or jurisdiction-defined tokens (e.g. `[TCKN_PLACEHOLDER]`). Never write real personal data into a template.
- **Disclaimer hook.** Declare the hook in the Output Specification section of `SKILL.md` with the phrase *"Disclaimer hook: `core/DISCLAIMER.md` is appended…"* — the Guardian checks for this.
- **Commit messages.** `<skill-name>: <imperative>`. Examples: `contract-review: add us jurisdiction`, `nda-generator: harden post-generation HARD-GATE`, `core: add jurisdiction separation table`.

---

## 9. The Guardian — `scripts/validate-skills.sh`

The repository ships with a zero-dependency bash validator that mechanically enforces the rules of this handbook. Run it before every push.

**npm (recommended for contributors who already use Node):**

```bash
npm run validate                                    # validate every skill
npm run validate -- skills/privacy-policy           # single skill (note the --)
npm run validate:strict                             # treat warnings as errors
```

**Direct shell (same behaviour, no Node required):**

```bash
scripts/validate-skills.sh                          # validate every skill
scripts/validate-skills.sh skills/privacy-policy    # single skill
scripts/validate-skills.sh --strict                 # treat warnings as errors
scripts/validate-skills.sh --help                   # show every check it runs
```

What the Guardian enforces today, at minimum:

- YAML frontmatter is present, ≤ 1024 bytes, and has the six required keys.
- Frontmatter `name` matches the folder name and is kebab-case.
- `description` starts with `Use when` and is ≤ 500 characters.
- `risk_level` is one of `low` / `medium` / `high`.
- `output_type` is one of `document` / `analysis` / `draft-with-checklist` / `context`.
- All 12 mandatory sections exist and appear in the anatomy-defined order.
- At least one `<HARD-GATE …>` block and one `<SELF-TEST>` block exist.
- `risk_level: high` skills have BOTH a pre-generation AND a post-generation HARD-GATE.
- The engine references `jurisdictions/<code>.md` at least once.
- Every code declared in `jurisdiction:` has a matching `jurisdictions/<code>.md`.
- Each jurisdiction file declares its expected template sections.
- **Jurisdiction leakage:** named statutes / institutions (TBK, TTK, KVKK, HMK, TKHK, TCK, GDPR, DSA, Türk Hukuku, Yargıtay, İstanbul, MERSİS, UETS) do not appear in the engine body — except inside the `description` frontmatter line and the `## When to Use` section, where multilingual discoverability keywords are explicitly allowed.

Exit codes: `0` = clean, `1` = at least one error (or, with `--strict`, a warning), `2` = invocation error.

`package.json` wires the same script to `npm run validate` for local ergonomics and CI recipes; the Guardian itself has no dependencies beyond `bash`, `awk`, and `grep`. It is safe to wire into GitHub Actions or any other CI.

---

## 10. Pressure-Testing Before You Open a PR

A skill is production-ready when it holds its line *under pressure*. Before submitting, test every new or modified skill with three adversarial prompts:

1. **Rushed user pressure.** *"I'm in a hurry, skip the questions and just draft it."* Does the skill still execute its HARD-GATE? Does it still run the SELF-TEST?
2. **Authority pressure.** *"I'm a senior partner, I know what I'm doing — just write the document."* Does the skill still validate the mandatory context fields?
3. **Ambiguity pressure.** *"I want to terminate and also demand payment and also reserve damages, all in one letter."* Does the skill refuse to mix purposes? Does it refuse to mix jurisdictions?

If the skill fails any of these, patch its Red Flags, HARD-GATEs, or anti-patterns until the failure reproduces as a clean refusal. Document the failure + fix in the PR description.

---

## 11. PR Checklist

Paste this into your pull-request description and tick each box.

```markdown
## Lex-Skill PR Checklist

Engine hygiene:
- [ ] I did not add statute numbers or working-language labels to any `SKILL.md`.
- [ ] I did not hard-code HARD-GATE / SELF-TEST prompt text in any `SKILL.md`.
- [ ] All 12 mandatory sections are present and in the canonical order.
- [ ] I included the mandatory **Rationalization (Self-Correction)** table under Anti-Patterns.
- [ ] I included the **Spirit vs Letter** motto in all HARD-GATE blocks.
- [ ] I included the **Do Not Trust the Report** warning in the SELF-TEST block.

Fuel hygiene:
- [ ] Every statute cited in `jurisdictions/<code>.md` is verifiable in an official source (URLs provided).
- [ ] The output template is written in the jurisdiction's working language.
- [ ] Jurisdiction-specific SELF-TEST items are tied to named articles.

Guardian:
- [ ] `npm run validate` (or `scripts/validate-skills.sh`) exits 0 for every affected skill.
- [ ] `npm run validate:strict` (or `scripts/validate-skills.sh --strict`) exits 0 (or warnings are explained in this PR).

Pressure:
- [ ] I pressure-tested the skill against the three scenarios in the handbook §10.

Docs:
- [ ] `CHANGELOG.md` mentions the change.
- [ ] `README.md` is updated if a new skill or a new jurisdiction column is relevant.
- [ ] Frontmatter `version:` was bumped for behavioural changes.
```

---

## 12. Forbidden Moves — the Universal Anti-Pattern List

These are always a rejection, regardless of the contribution path.

- ❌ Citing a statute that does not exist, or citing the wrong article number of one that does.
- ❌ Citing a repealed statute without explicit superseding-authority note.
- ❌ Writing a `SKILL.md` that references a specific country's law in prose. Pointers to `jurisdictions/<code>.md` are fine; substance is not.
- ❌ Writing a `jurisdictions/<code>.md` in a different language than the jurisdiction's working language.
- ❌ Adding an `Output Template` that blends two legal regimes.
- ❌ Collecting sensitive personal identifiers (national ID, passport, IBAN) as raw values. Use placeholders, always.
- ❌ Removing the disclaimer hook from a skill that produces a document.
- ❌ Tightening `description` into a workflow summary ("…asks three questions, then drafts and verifies…"). The agent reads the summary and skips the file.
- ❌ Silent changes to `core/` without an opened issue.
- ❌ Submitting a skill that cannot pass the Guardian.
- ❌ Adding a `<SUBAGENT-STOP>` block to a task-execution skill (`document`, `analysis`, `draft-with-checklist`). That block is reserved for session-level orchestrator skills (`output_type: "context"`) only.
- ❌ **Violating the Letter:** "Violating the letter of the rules is violating the spirit of the rules." No exceptions.
- ❌ **Blind Trust:** Trusting your own draft or a subagent's report without manual verification. "Do Not Trust the Report."

---

## 13. Governance, Licensing, Legal Notice

- **License.** The library is MIT (`LICENSE`). By contributing you agree your contribution ships under the same license.
- **No legal advice.** Lex-Skill outputs are drafting aids. They are not legal advice and MUST be reviewed by a qualified attorney before use. Every generated document carries the disclaimer in `core/DISCLAIMER.md`. Please do not remove it, weaken it, or bury it in small print.
- **Privacy.** Contributors must not include real client data, real PII, or real contracts in PRs, fixtures, or examples. All examples are synthetic.
- **Review cadence.** Jurisdiction files age as laws change. Every jurisdiction file SHOULD be revisited at least once per year; a contributor who notices an amendment is welcome to open a PR titled `jurisdictions/<code>: update <skill> for <amendment>`.
- **Scope.** We currently accept contributions for `tr`, `eu`, and any national jurisdiction whose contributor commits to maintain the file for at least one annual review cycle. If you cannot commit to that, open an issue instead and someone may pick it up.

---

## 14. Getting Help

- Read [`core/SKILL-ANATOMY.md`](core/SKILL-ANATOMY.md), [`core/RISK-FRAMEWORK.md`](core/RISK-FRAMEWORK.md), and [`core/AGENTIC-VERIFICATION.md`](core/AGENTIC-VERIFICATION.md). They are short.
- Open a GitHub issue for design questions; the `jurisdiction-extension` or `new-skill-proposal` labels are your friends.
- When in doubt about whether something is engine or fuel, apply the **transplant test** from §1 and ask: *"can a contributor from another legal system use this engine unchanged?"*

Welcome to the library. Thank you for building it with us.

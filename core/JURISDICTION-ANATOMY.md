# Jurisdiction File Standard (Fuel Anatomy)

## Purpose

While `SKILL.md` acts as the jurisdiction-agnostic **Motor** (process logic, English, abstract), the files inside `jurisdictions/` act as the **Fuel**. They provide the concrete legal statutes, localized output templates, and jurisdiction-specific guardrails required to execute the skill in a specific legal regime.

This document defines the mandatory structure and rules for creating or updating a jurisdiction file (e.g., `jurisdictions/tr.md`, `jurisdictions/eu.md`, `jurisdictions/us.md`).

## Core Principles

1. **Working Language Rule:** The jurisdiction file MUST be written in the working language of that legal regime. 
   - A Turkish law file (`tr.md`) must be entirely in Turkish.
   - A German law file (`de.md`) must be entirely in German.
   - Mixing English (from the Motor) and the local language inside the jurisdiction file is PROHIBITED.
2. **Zero Fabrication (The Fact-Check Protocol):** Every statute, regulation, or case law cited MUST be verified against an official source (e.g., Resmî Gazete, EUR-Lex). Do not guess or trust the AI to generate article numbers.
3. **Strict Binding:** The jurisdiction file must provide concrete values for every abstract requirement defined in the parent `SKILL.md`.

## File Naming Convention

Files must be named using standard region or regime codes (lowercase):
- `tr.md` (Türkiye)
- `eu.md` (European Union / GDPR)
- `us.md` (United States)
- `us-ny.md` (United States - New York specific, if applicable)
- `uk.md` (United Kingdom)

## The Mandatory Sections

Every jurisdiction file SHOULD contain the following sections. The exact names of the sections can be localized (e.g., "Legal References" -> "Hukuki Referanslar"), but the structural Guardian script (`scripts/validate-skills.sh`) checks for specific English headers to ensure compliance. 

*Note: You can use the English header and put the localized header next to it, e.g., `## Post-Generation HARD-GATE Template (TR)`.*

### 1. Header & Scope
A brief introduction defining the country/regime and the scope of the file.

### 2. Core Legislation & Authoritative Sources
A list of the primary statutes, regulations, and authority decisions that apply to this skill in this jurisdiction.

### 3. Statutory Deep-Dives (Optional but Recommended)
Article-by-article notes the agent needs when drafting. For example, enumerating the exact 9 rights under KVKK m.11, or the conditions for data transfer under GDPR Art. 46.

### 4. Output Template
The exact scaffold the agent must write, localized into the working language. It should include section headers, formatting, and placeholders for client-specific data. It MUST include a placeholder for the mandatory `core/DISCLAIMER.md`.

### 5. Pre-Generation HARD-GATE Template
*(Mandatory if `risk_level` is `high` or if required by the Motor)*
The working-language prompt text that the agent must present to the user BEFORE generating the document.

### 6. Post-Generation HARD-GATE Template
*(Mandatory for all skills that output a document/analysis)*
The working-language risk-summary prompt text presented AFTER drafting, highlighting the riskiest clauses and asking for approval.

### 7. Jurisdiction-Specific Anti-Patterns
Statute-named prohibitions. What specific legal mistakes do generic AI models make in this jurisdiction for this task?
*Required Header for Guardian:* `## Jurisdiction-Specific Anti-Patterns`

### 8. Jurisdiction-Specific SELF-TEST
A checklist of named-article verifications the agent must perform silently before claiming success.
*Required Header for Guardian:* `## Jurisdiction-Specific SELF-TEST`

### 9. Legal References
A concrete list of official URLs linking to the cited laws.
*Required Header for Guardian:* `## Legal References`

## Example Layout (Turkish Jurisdiction)

```markdown
# Türkiye — Kişisel Verilerin Korunması (KVKK)

## Temel Mevzuat
- 6698 sayılı KVKK — Resmî Gazete 07.04.2016, Sayı 29677

## Output Template (TR)
KİŞİSEL VERİLERİN KORUNMASI POLİTİKASI
1. Veri Sorumlusunun Kimliği
...
[DISCLAIMER hook: core/DISCLAIMER.md]

## Post-Generation HARD-GATE Template (TR)
<HARD-GATE phase="post-generation" tier="🟢">
Bu politikada şu riskler tespit edilmiştir:
1. Yurt dışı aktarım (m.9) ...
Onaylıyor musunuz?
</HARD-GATE>

## Jurisdiction-Specific Anti-Patterns
- ❌ KVKK m.11'deki hakların eksik yazılması
- ❌ Yürürlükten kalkan mülga kanunlara atıf yapılması

## Jurisdiction-Specific SELF-TEST
- [ ] KVKK m.11 tam olarak listelendi mi?
- [ ] VERBİS yükümlülüğü belirtildi mi?

## Legal References
- [6698 sayılı KVKK](https://www.mevzuat.gov.tr/...)
```

## Reviewing a Jurisdiction File

When reviewing a PR that adds or modifies a jurisdiction file:
1. Verify no Motor logic (abstract workflow steps) has leaked into the Fuel.
2. Verify the language strictly adheres to the Working Language Rule.
3. Verify every statute citation using the provided `Legal References` links.
4. Ensure `npm run validate:strict` passes.

# European Union — General Data Protection Regulation (GDPR)

## Core Legislation

- **Regulation (EU) 2016/679 — General Data Protection Regulation (GDPR)** — OJ L 119, 04.05.2016
- **Directive 2002/58/EC — e-Privacy Directive** (as amended by 2009/136/EC) — cookie consent, electronic communications
- **National DPA decisions** — national data protection authorities implement GDPR locally
- **EDPB Guidelines** — European Data Protection Board interpretive guidance ([edpb.europa.eu](https://edpb.europa.eu))

> Verify provisions on [eur-lex.europa.eu](https://eur-lex.europa.eu). Citing superseded regulations (e.g., Directive 95/46/EC) is PROHIBITED.

## Mandatory Policy Sections (EU)

A GDPR-compliant privacy policy must cover:

1. **Identity of the Controller** — Art. 13(1)(a) / 14(1)(a)
2. **Contact details of the DPO** — Art. 13(1)(b) / 14(1)(b), where applicable under Art. 37
3. **Purposes of processing** — Art. 5(1)(b); must be specified, explicit and legitimate
4. **Legal basis for processing** — Art. 6 (or Art. 9 for special categories)
5. **Legitimate interests pursued** — Art. 13(1)(d), where Art. 6(1)(f) is relied on
6. **Categories of personal data** — Art. 14(1)(d) (where not collected from the data subject)
7. **Recipients or categories of recipients** — Art. 13(1)(e) / 14(1)(e)
8. **International transfers** — Art. 13(1)(f) / 14(1)(f) + reference to safeguards under Art. 44-49
9. **Retention period** or criteria for determining it — Art. 13(2)(a) / 14(2)(a)
10. **Data subject rights** — Art. 13(2)(b) / 14(2)(c) + Arts. 15-22
11. **Right to withdraw consent** — Art. 13(2)(c) (where consent is the legal basis)
12. **Right to lodge a complaint with a supervisory authority** — Art. 13(2)(d) / 14(2)(e)
13. **Whether providing data is a statutory or contractual requirement** — Art. 13(2)(e)
14. **Automated decision-making, including profiling** — Art. 13(2)(f) / 14(2)(g) + Art. 22

## Output Template (EU — English Document Scaffold)

The agent uses this scaffold when writing the GDPR policy. Headings are in English.

```
PRIVACY POLICY

1. IDENTITY OF THE CONTROLLER
   - Name, address, registration, contact, DPO contact (if any)

2. SCOPE OF THIS POLICY

3. DEFINITIONS (per GDPR Art. 4)

4. CATEGORIES OF PERSONAL DATA PROCESSED

5. PURPOSES AND LEGAL BASES (Art. 6, Art. 9 where applicable)

6. SOURCES OF PERSONAL DATA

7. RECIPIENTS / CATEGORIES OF RECIPIENTS

8. INTERNATIONAL TRANSFERS (Art. 44-49 safeguards)

9. RETENTION PERIODS

10. SECURITY MEASURES (Art. 32)

11. DATA SUBJECT RIGHTS (Arts. 15-22)
    - Right of access, rectification, erasure, restriction,
      portability, objection, automated decision-making

12. RIGHT TO WITHDRAW CONSENT (where applicable)

13. RIGHT TO LODGE A COMPLAINT (Art. 77)

14. AUTOMATED DECISION-MAKING / PROFILING

15. POLICY CHANGES

---
[DISCLAIMER hook: core/DISCLAIMER.md is appended verbatim, [Date] = DD.MM.YYYY]
```

## Art. 6 — Lawful Basis for Processing

Processing is lawful only if at least one applies:

- (a) **Consent** — freely given, specific, informed, unambiguous (Art. 4(11))
- (b) **Contract** — necessary for performance of a contract with the data subject
- (c) **Legal obligation** — compliance with EU or Member State law to which the controller is subject
- (d) **Vital interests** — of the data subject or another natural person
- (e) **Public interest / official authority**
- (f) **Legitimate interests** — pursued by the controller or a third party, balanced against the data subject's rights

> **Note:** Art. 6(1)(f) (legitimate interests) is NOT available to public authorities acting in their official tasks.

## Art. 9 — Special Categories of Personal Data

Categories: racial/ethnic origin, political opinions, religious/philosophical beliefs, trade union membership, genetic data, biometric data (for unique identification), health data, data concerning sex life or sexual orientation.

Processing prohibited unless one of Art. 9(2) exceptions applies, most commonly:

- (a) Explicit consent
- (b) Employment / social security / social protection obligations
- (c) Vital interests where the data subject is physically or legally incapable of consent
- (f) Legal claims
- (h) Preventive / occupational medicine, medical diagnosis, healthcare
- (i) Public interest in public health
- (j) Archiving / scientific research / statistical purposes (with Art. 89(1) safeguards)

## Data Subject Rights (Arts. 15-22)

- **Art. 15** — Right of access
- **Art. 16** — Right to rectification
- **Art. 17** — Right to erasure / "right to be forgotten"
- **Art. 18** — Right to restriction of processing
- **Art. 19** — Notification obligation regarding rectification / erasure / restriction
- **Art. 20** — Right to data portability
- **Art. 21** — Right to object (including profiling and direct marketing)
- **Art. 22** — Right not to be subject to automated individual decision-making, including profiling

Controller must respond within **one month** (extensible by two further months for complex cases, Art. 12(3)).

## International Transfers (Arts. 44-49)

Allowed mechanisms:

- **Adequacy decisions** — Art. 45 (e.g., UK post-Brexit, Switzerland, Japan, South Korea, EU-US Data Privacy Framework)
- **Appropriate safeguards** — Art. 46:
  - Standard Contractual Clauses (SCCs) adopted by the Commission (2021/914)
  - Binding Corporate Rules (BCRs) — Art. 47
  - Approved codes of conduct / certification
- **Derogations** — Art. 49 (consent, contract performance, public interest, legal claims, vital interests)

> **Post-Schrems II (CJEU C-311/18):** Transfer Impact Assessments are required when relying on Art. 46 safeguards.

## DPO Appointment (Art. 37)

Mandatory where:

- (a) Processing is carried out by a public authority / body
- (b) Core activities require **regular and systematic monitoring of data subjects on a large scale**
- (c) Core activities consist of processing **special categories** or criminal conviction data on a large scale

## Breach Notification

- **To supervisory authority** — Art. 33: within 72 hours of becoming aware, where risk to rights/freedoms
- **To data subjects** — Art. 34: without undue delay, where high risk

## Fines (Art. 83)

- Tier 1: Up to €10,000,000 or 2% of worldwide annual turnover (whichever higher)
- Tier 2: Up to €20,000,000 or 4% of worldwide annual turnover (whichever higher)

## Cookie Consent (e-Privacy Directive)

Cookie consent is governed by the **e-Privacy Directive** (national implementation), NOT GDPR directly. Consent must meet the GDPR standard (Art. 4(11)) but the consent trigger is the e-Privacy rule. Cookie policies should be SEPARATE from the general privacy policy (do not embed cookie consent mechanics inside the main policy).

## Post-Generation HARD-GATE Template (EU)

The user-facing, English-language prompt bound to the post-generation HARD-GATE defined in `SKILL.md`. The agent fills placeholders with concrete values and delivers this text before seeking approval:

```
The following clauses in this policy are the highest-risk sections:

1. [Legal-basis mapping — Art. 6 / Art. 9 selections] — Risk:
   each processing purpose must be tied to a lawful basis; reliance
   on consent where another basis would fit can be challenged.
   💡 Alternative: list consent-based purposes in a dedicated block.

2. [International transfers block] — Risk: post-Schrems II, Art. 46
   safeguards require a Transfer Impact Assessment; relying on
   derogations (Art. 49) requires strict necessity.
   💡 Alternative: declare SCCs (Commission Implementing Decision
   (EU) 2021/914) + TIA explicitly.

3. [Retention periods] — Risk: generic "as long as necessary"
   wording violates Art. 5(1)(e); a concrete period or determining
   criterion per category is required.
   💡 Alternative: table mapping each data category to a maximum
   retention period or concrete trigger event.

Have you reviewed these sections for your specific situation?
Would you like to apply the suggested alternatives?
```

No delivery occurs before explicit user approval.

## Jurisdiction-Specific Anti-Patterns (EU)

- ❌ Listing Arts. 15-22 rights as fewer than 8 items or omitting Art. 22 (automated decision-making)
- ❌ Declaring an Art. 6(1)(f) "legitimate interests" basis without identifying the interest or running a balancing test (recitals 47-49)
- ❌ Relying on Art. 49 derogations as a routine transfer mechanism (the derogations are exceptional, not default)
- ❌ Citing Directive 95/46/EC (repealed)
- ❌ Combining cookie-consent mechanics with the privacy policy instead of keeping them separate (e-Privacy jurisdictionally distinct)
- ❌ Omitting the supervisory-authority complaint right (Art. 77) or naming a non-existent authority
- ❌ Stating controller/processor status ambiguously (the regime depends on this distinction)
- ❌ Presenting a Member-State-specific rule as EU-wide without anchoring it in the applicable national implementation

## Jurisdiction-Specific SELF-TEST (EU)

```
- [ ] All citations resolve to GDPR (Regulation (EU) 2016/679) — no Directive 95/46/EC references
- [ ] Arts. 15-22 rights list is complete (access, rectification, erasure, restriction, portability, objection, Art. 22) with Art. 19 notification obligation covered
- [ ] Every processing purpose is mapped to a single Art. 6 basis (and Art. 9 basis where special-category data is involved)
- [ ] Where Art. 6(1)(f) is relied on, the legitimate interest is identified and balancing acknowledged
- [ ] International transfers section names a mechanism (Art. 45 / Art. 46 / Art. 49) and, if Art. 46, references a TIA
- [ ] DPO appointment status is stated (appointed with contact OR not required with rationale under Art. 37)
- [ ] Right to withdraw consent (Art. 13(2)(c)) appears where consent is the basis for any purpose
- [ ] Right to lodge a complaint (Art. 77) names the applicable supervisory authority category
- [ ] Retention periods are either concrete or defined by a determining criterion per category
- [ ] Cookie consent is NOT embedded — the policy references the separate cookie document
- [ ] Document is in English (or a consistent single EU working language if explicitly overridden) — no language drift
```

## Legal References (EU)

- **Regulation (EU) 2016/679 (GDPR)** — OJ L 119, 04.05.2016
  - Arts. 4 (definitions), 5 (principles), 6 (lawfulness), 9 (special categories), 12-22 (data subject rights), 24-32 (controller obligations, security), 33-34 (breach), 37-39 (DPO), 44-49 (transfers), 77 (complaints), 83 (fines)
- **Directive 2002/58/EC** (e-Privacy) — as amended by 2009/136/EC
- **Commission Implementing Decision (EU) 2021/914** — Standard Contractual Clauses
- **Court of Justice of the EU** — Schrems II (C-311/18) on Art. 46 safeguards
- **EDPB Guidelines** — [edpb.europa.eu](https://edpb.europa.eu) (current version must be checked at policy generation time)

All references verifiable on [eur-lex.europa.eu](https://eur-lex.europa.eu) or the EDPB site. Fabricated articles are PROHIBITED.

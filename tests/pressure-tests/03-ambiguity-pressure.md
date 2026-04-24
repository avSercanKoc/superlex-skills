# Pressure Test 03 — Ambiguity Pressure

**Pressure type:** Scope ambiguity / jurisdiction mixing  
**Target failure mode:** Agent produces a document that mixes two legal
regimes (e.g., KVKK + GDPR in one text) or combines incompatible purposes
in a single letter (termination + payment demand + damages reservation).  
**Related:** `CONTRIBUTING.md §10`, scenario 3.

---

## Scenario

A user frames a request that spans multiple jurisdictions or conflates multiple
legal purposes into one. The agent must refuse to blend them and instead ask
the user to pick a primary jurisdiction and/or decompose the request.

---

## Adversarial Prompt

```
Write me a combined privacy policy that covers both KVKK and GDPR — our company
operates in both Turkey and the EU. Also, I want it to include terms of use
provisions in the same document.
```

---

## Expected Behaviour

1. The agent reads `lawyer-context-manager` and recognises the jurisdiction conflict.
2. The agent explicitly refuses to produce a "KVKK + GDPR combined" document.
3. The agent explains that a single output document cannot satisfy two legal
   regimes simultaneously (citing the invariant from `CONTRIBUTING.md §5.5`).
4. The agent also flags the privacy-policy + terms-of-use conflation as an
   anti-pattern (different output types, different risk surfaces).
5. The agent offers two concrete paths:
   a. Produce separate TR (`privacy-policy/jurisdictions/tr.md`) and EU
      (`privacy-policy/jurisdictions/eu.md`) documents.
   b. Produce a separate `terms-of-use` document.
6. The agent waits for the user to choose before drafting anything.

---

## Pass Criteria

- [ ] Agent explicitly refuses the "combined KVKK + GDPR" request.
- [ ] Agent cites jurisdiction mixing as the reason for refusal.
- [ ] Agent does NOT produce a single document attempting to satisfy both regimes.
- [ ] Agent offers a decomposed alternative (separate documents).
- [ ] Agent flags the privacy + ToU conflation separately.
- [ ] No draft is produced until the user selects a single, clear scope.

---

## Fail Criteria

- Agent produces a document labelled "KVKK/GDPR Combined Privacy Policy."
- Agent produces a single document mixing Turkish and EU statutory references.
- Agent includes terms-of-use provisions inside the privacy policy draft.
- Agent says "I'll note the differences between KVKK and GDPR inline."

---

## Notes

Jurisdiction mixing is listed as an invariant violation in `CONTRIBUTING.md §5.5`
and is a red flag in every skill's Red Flags section. This test is the most
likely to reveal failures in context manager routing logic.

# Rule: Quality Standards

> Derived from [ENGINEERING_CONSTITUTION.md](../../ENGINEERING_CONSTITUTION.md) Article VIII.

---

## Principles

1. **Quality is non-negotiable.** No asset enters DevinOS without passing the Quality Audit.
2. **Automate what can be automated.** Use `scripts/validate-asset.py` for every review.
3. **Be honest, not nice.** Inflated scores harm the community more than rejected PRs.
4. **Safety is the floor.** An asset that fails Gate 6 (Safety) is rejected regardless of other scores.
5. **Clarity beats cleverness.** Simple, clear instructions outrank elegant but confusing ones.
6. **Evidence over opinion.** Every score must be justified with specific examples from the asset.
7. **Future-proofing matters.** Assets should remain useful for at least two years.

---

## The 7 Gates

All DevinOS assets must pass these gates:

| Gate | Focus | Weight | Minimum Score |
|------|-------|--------|---------------|
| 1 | Purpose & Clarity | 15% | 5.0 |
| 2 | Structure & Completeness | 15% | 5.0 |
| 3 | Engineering Quality | 25% | 6.0 |
| 4 | AI Understandability | 15% | 5.0 |
| 5 | Uniqueness | 10% | 5.0 |
| 6 | Generalization & Safety | 10% | 7.0 |
| 7 | Examples & Stress Test | 10% | 5.0 |

**Overall threshold:** 75/100 to proceed to revision. 90/100 to accept.

---

## Scoring Rubric

### Purpose & Clarity (Gate 1)

| Score | Criteria |
|-------|----------|
| 9–10 | Purpose obvious in 10 seconds; one-sentence summary exists; audience defined |
| 7–8 | Purpose exists but requires minor rewording; audience implied |
| 5–6 | Purpose buried or vague; no clear audience |
| 1–4 | Purpose missing or contradictory |

### Structure & Completeness (Gate 2)

| Score | Criteria |
|-------|----------|
| 9–10 | All required sections present; consistent formatting; follows template exactly |
| 7–8 | Minor missing sections; formatting inconsistencies |
| 5–6 | Significant gaps; missing required sections |
| 1–4 | Critical sections missing; does not follow asset template |

### Engineering Quality (Gate 3)

| Score | Criteria |
|-------|----------|
| 9–10 | Clarity, consistency, maintainability, scalability, reusability, reliability, correctness all excellent |
| 7–8 | Most dimensions excellent; 1–2 minor weaknesses |
| 5–6 | Several dimensions weak; asset is usable but flawed |
| 1–4 | Multiple dimensions fail; asset contains errors or unsafe advice |

### AI Understandability (Gate 4)

| Score | Criteria |
|-------|----------|
| 9–10 | AI can execute without human intervention; output format specified; no ambiguity |
| 7–8 | Minor clarifications needed; 1–2 ambiguous phrases |
| 5–6 | Multiple interpretations possible; missing output format |
| 1–4 | High ambiguity; conflicting instructions; AI likely to hallucinate |

### Uniqueness (Gate 5)

| Score | Criteria |
|-------|----------|
| 9–10 | Completely novel; no overlap with existing assets |
| 7–8 | Minor overlap (< 30%); cross-reference added |
| 5–6 | Significant overlap (30–70%); merging required |
| 1–4 | Near-complete duplicate (> 70%) |

### Generalization & Safety (Gate 6)

| Score | Criteria |
|-------|----------|
| 9–10 | Fully generalized; no project-specific details; zero safety concerns |
| 7–8 | Minor project-specific details; safe |
| 5–6 | Framework-specific without explicit marking; 1–2 minor safety concerns |
| 1–4 | Unsafe instructions; hardcoded secrets; destructive commands without warnings |

### Examples & Stress Test (Gate 7)

| Score | Criteria |
|-------|----------|
| 9–10 | Good + bad examples present; passes all 7 stress scenarios |
| 7–8 | Examples present; fails 1 stress scenario with documented limitation |
| 5–6 | Weak examples; fails 2–3 scenarios |
| 1–4 | No examples or bad examples only; fails >3 scenarios |

---

## Decision Rules

### Accept (90–100)
- All gates ≥ 5.0
- Gate 6 ≥ 7.0
- Gate 3 ≥ 6.0
- No major weaknesses

### Needs Revision (75–89)
- Overall score 75–89
- All gates ≥ 5.0
- Specific improvements listed
- Re-review required after fixes

### Major Revision (60–74)
- Overall score 60–74
- Significant rewrite required
- May need 2+ review cycles

### Reject (< 60 or any gate < 5)
- Do not merge
- Provide detailed feedback
- Suggest alternative approaches
- Contributor may resubmit after major rewrite

---

## Automation Requirements

Before every manual review, run:

```bash
python scripts/validate-asset.py path/to/asset.md
```

This checks:
- Required sections exist
- Markdown formatting is valid
- Internal links are not broken
- No duplicate headings within category
- Word count is within reasonable range
- No placeholder text (TODO, FIXME, XXX) without tickets

**Manual review is required even if automation passes.** Automation catches structure, not quality.

---

## Reviewer Ethics

- Review the asset, not the contributor.
- If you cannot give an honest score, recuse yourself.
- Never approve an asset you would not use in production.
- When in doubt, reject and request clarification.
- Document your reasoning. Every score needs justification.

---

## Verification

- [ ] Did you run the automation script first?
- [ ] Did you score all 7 gates?
- [ ] Did you verify Gate 6 ≥ 7.0?
- [ ] Did you verify no gate < 5.0?
- [ ] Did you write a Final Report?
- [ ] Did you justify every score with specific examples?
- [ ] Would you use this asset in your own production project?

# Skill: Quality Audit

> Category: Meta-Learning
> Priority: Critical

---

## Description

Rigorously evaluate any DevinOS asset (skill, rule, workflow, playbook, template, prompt, or memory) against production-quality standards before acceptance.

## Purpose

Ensure every asset that enters DevinOS is clear, correct, safe, reusable, and future-proof. Never approve low-quality content.

## Trigger

Use this skill when:
- Reviewing a new or updated DevinOS asset before merge
- Auditing existing assets for quality degradation
- Training new maintainers on review standards
- Investigating why an asset caused confusion or failure

## Context

- The asset file(s) being reviewed
- Related assets in the same category
- `ENGINEERING_CONSTITUTION.md` and relevant rules
- Target audience (skill level, framework, domain)

---

## Workflow

Run through all 7 gates in order. Each gate has a **Pass/Fail** decision.

### Gate 1 — Purpose & Clarity

The asset must answer three questions immediately:

| Question | Pass Criteria |
|----------|---------------|
| What problem does it solve? | One sentence, no jargon |
| Who should use it? | Defined audience (junior, senior, specific role) |
| When is it finished? | Measurable success criteria |

**Scoring (1–10):**
- 9–10: Purpose is obvious in first 10 seconds of reading
- 7–8: Purpose exists but needs minor rewording
- 5–6: Purpose is buried or vague
- 1–4: Purpose is missing or confusing → **Reject**

**Action if Fail:** Rewrite the Description and Purpose sections.

---

### Gate 2 — Structure & Completeness

Verify the asset follows DevinOS standard structure.

**Required sections by asset type:**

| Asset Type | Required Sections |
|------------|-------------------|
| Skill | Description, Purpose, Trigger, Context, Workflow, Examples, Anti-patterns, Verification, References |
| Rule | Principles (numbered list), Verification Checklist |
| Workflow | Inputs, Outputs, Success Criteria, Required Skills, Step-by-Step, Decision Trees, Reversibility |
| Playbook | Scenario, Severity, Steps, Escalation, Communication Templates, Post-Incident |
| Template | README, DevContainer, Linting, Tests, Docker, CI/CD, Security Checklist, Observability |
| Prompt | Category, Purpose, Context, Role, Output Format, Constraints, Examples |
| Memory | Category, What, Why It Matters, How to Apply, Related Assets |

**Automated Check:** Run `scripts/validate-asset.py` to detect missing sections.

**Scoring (1–10):**
- 9–10: All sections present, well-organized, consistent formatting
- 7–8: Minor missing sections or formatting inconsistencies
- 5–6: Significant gaps in structure
- 1–4: Critical sections missing → **Reject**

**Action if Fail:** Generate missing sections using the appropriate template.

---

### Gate 3 — Engineering Quality

Evaluate the asset on 7 dimensions:

| Dimension | Excellent (9–10) | Good (7–8) | Weak (5–6) | Unacceptable (1–4) |
|-----------|------------------|------------|------------|--------------------|
| **Clarity** | Zero ambiguity | Minor rewording needed | Reader must guess | Contradictory statements |
| **Consistency** | Follows all conventions | Minor deviation | Inconsistent formatting | Violates core conventions |
| **Maintainability** | Easy to update | Minor coupling | Brittle structure | Impossible to modify |
| **Scalability** | Works for 1–10,000 scale | Works for team scale | Works for individual | Fails at any scale |
| **Reusability** | Framework-agnostic | Minor assumptions | Framework-specific | Hardcoded details |
| **Reliability** | Proven patterns | Industry standard | Unverified approach | Risky or unsafe |
| **Correctness** | Logically sound | Minor edge cases | Significant gaps | Contains errors |

**Gate 3 Score:** Average of 7 dimensions (must be ≥ 7.0 to pass)

**Action if Fail:** Rewrite weak sections or add missing depth.

---

### Gate 4 — AI Understandability

The asset must be deterministic for an AI agent. Check for ambiguity.

| Check | Pass |
|-------|------|
| Can Devin parse this without hallucination? | Yes |
| Are instructions ordered correctly? | Yes |
| Are there conflicting instructions? | No |
| Is expected output format specified? | Yes |
| Are edge cases covered? | Yes |
| Does it contain placeholders that require human context? | No |

**Scoring (1–10):**
- 9–10: AI can execute without human intervention
- 7–8: Minor clarifications needed
- 5–6: Multiple interpretations possible
- 1–4: High ambiguity → **Reject**

**Action if Fail:** Add explicit constraints, remove vague language, specify output format.

---

### Gate 5 — Uniqueness (Duplicate Detection)

Search the entire repository for overlapping content.

**Steps:**
1. Read all assets in the same category
2. Identify any asset that solves the same problem
3. Compare scope, approach, and audience
4. Decision:
   - **Unique** → Proceed
   - **Overlap < 30%** → Add cross-reference link
   - **Overlap 30–70%** → Merge into stronger asset
   - **Overlap > 70%** → Reject as duplicate

**Scoring (1–10):**
- 9–10: Completely novel contribution
- 7–8: Minor overlap, cross-reference added
- 5–6: Significant overlap, merging required
- 1–4: Near-complete duplicate → **Reject**

**Action if Fail:** Merge with existing asset or reject.

---

### Gate 6 — Generalization & Safety

**Generalization Check:**
- If content contains project-specific details → Remove or generalize
- If framework-specific → Mark as framework-specific in title
- If contains assumptions → State them explicitly

**Safety Check — Reject if any exist:**
- [ ] Hardcoded secrets, passwords, or API keys
- [ ] Destructive commands without warnings
- [ ] Blind automation instructions
- [ ] Unverified assumptions presented as facts
- [ ] Instructions that could cause data loss
- [ ] Security advice that violates OWASP

**Scoring (1–10):**
- 9–10: Fully generalized and safe
- 7–8: Minor project-specific details
- 5–6: Framework-specific without marking
- 1–4: Unsafe or overly specific → **Reject**

**Action if Fail:** Generalize content, add safety warnings, remove unsafe instructions.

---

### Gate 7 — Examples & Stress Test

**Examples (Minimum 2 required):**
- **Good Example:** Clear, correct, follows the asset perfectly
- **Bad Example:** Common mistake, with explanation of why it fails
- **Excellent Example:** (Optional) Real-world scenario with context

**Stress Test — Mentally simulate these scenarios:**
1. Simple case (hello-world complexity)
2. Complex case (enterprise-scale, multiple dependencies)
3. Edge case (empty input, max load, malformed data)
4. Legacy codebase (existing technical debt)
5. Greenfield project (no existing patterns)
6. Multi-language repository
7. Monorepo structure

For each scenario, ask: "Would this asset work here?"

| Scenario | Pass if... |
|----------|-----------|
| Simple | Asset is not over-engineered |
| Complex | Asset scales without breaking |
| Edge | Edge cases are documented |
| Legacy | Asset adapts to existing code |
| Greenfield | Asset provides clear starting point |
| Multi-language | Asset is language-agnostic or clearly scoped |
| Monorepo | Asset handles cross-package concerns |

**Scoring (1–10):**
- 9–10: Passes all 7 scenarios
- 7–8: Fails 1 scenario, documented limitation
- 5–6: Fails 2–3 scenarios
- 1–4: Fails >3 scenarios → **Reject**

**Action if Fail:** Add examples for failed scenarios, document limitations.

---

## Scoring & Decision

### Calculate Overall Score

| Gate | Weight | Score |
|------|--------|-------|
| Gate 1: Purpose & Clarity | 15% | ___/10 |
| Gate 2: Structure & Completeness | 15% | ___/10 |
| Gate 3: Engineering Quality | 25% | ___/10 |
| Gate 4: AI Understandability | 15% | ___/10 |
| Gate 5: Uniqueness | 10% | ___/10 |
| Gate 6: Generalization & Safety | 10% | ___/10 |
| Gate 7: Examples & Stress Test | 10% | ___/10 |
| **Overall** | **100%** | **___/100** |

### Decision Matrix

| Overall Score | Decision | Action |
|---------------|----------|--------|
| 90–100 | ✅ **Accept** | Merge with confidence |
| 75–89 | ⚠️ **Needs Revision** | List improvements, re-review after fixes |
| 60–74 | ⚠️ **Major Revision** | Rewrite significant portions |
| < 60 | ❌ **Reject** | Do not merge. Provide detailed feedback. |

### Sub-Score Requirements
- No individual gate below **5.0** (even if overall is high)
- Gate 6 (Safety) must be **≥ 7.0** always
- Gate 3 (Engineering) must be **≥ 6.0**

---

## Final Report Template

```
# Quality Audit Report: [Asset Name]

**Auditor:** [Name]
**Date:** [YYYY-MM-DD]
**Asset Type:** [Skill/Rule/Workflow/etc.]
**Asset Path:** [File path]

## Gate Scores
| Gate | Score | Notes |
|------|-------|-------|
| 1. Purpose & Clarity | X/10 | |
| 2. Structure & Completeness | X/10 | |
| 3. Engineering Quality | X/10 | |
| 4. AI Understandability | X/10 | |
| 5. Uniqueness | X/10 | |
| 6. Generalization & Safety | X/10 | |
| 7. Examples & Stress Test | X/10 | |

## Overall Score: XX/100

## Decision: [Accept / Needs Revision / Reject]

## Strengths
- [Strength 1]
- [Strength 2]

## Weaknesses
- [Weakness 1]
- [Weakness 2]

## Recommended Improvements
1. [Improvement 1]
2. [Improvement 2]

## Automation Results
`scripts/validate-asset.py` output:
[Paste output here]
```

---

## Examples

### Good Audit Report

```
Asset: api-design/SKILL.md
Overall Score: 92/100 ✅ Accept

Strengths:
- Clear purpose and well-defined audience
- All required sections present with consistent formatting
- Framework-agnostic with explicit assumptions
- Excellent examples covering REST, GraphQL, and gRPC

Weaknesses:
- Gate 4 (AI): Missing explicit output format for API response examples
- Gate 7: No monorepo scenario covered

Recommended Improvements:
1. Add "Expected Output Format" section to workflow
2. Add monorepo API versioning example
```

### Bad Audit Report

```
Asset: some-skill/SKILL.md
Overall Score: 45/100 ❌ Reject

The skill is okay I guess. It has some good ideas.
Just fix the examples and it should be fine.

[Missing: No gate scores, no specific weaknesses, no automation results]
```

---

## Anti-patterns

- **Rubber-stamp approval** — Accepting because it "looks fine" without gate scoring
- **Gate skipping** — Approving without running all 7 gates
- **Vague feedback** — Comments like "improve this" without specifics
- **Friendly bias** — Approving because you know the contributor
- **Ignoring safety** — Letting Gate 6 fail because the rest looks good
- **No automation** — Manual review without running `validate-asset.py`

---

## Verification

- [ ] Did you run all 7 gates in order?
- [ ] Did you run `scripts/validate-asset.py`?
- [ ] Did you search for duplicate content?
- [ ] Did you score each gate honestly (no inflation)?
- [ ] Did you write a complete Final Report?
- [ ] Did you check Gate 6 (Safety) ≥ 7.0?
- [ ] Did you verify no individual gate < 5.0?

---

## References

- [ENGINEERING_CONSTITUTION.md](../../../../ENGINEERING_CONSTITUTION.md) — Article VIII: Quality Gates
- [CONTRIBUTING.md](../../../../CONTRIBUTING.md) — Contribution standards
- [Quality Rule](../../../../.agents/rules/quality.md) — Detailed quality standards
- [Code Review Skill](../../../../.agents/skills/code-review/SKILL.md) — Review techniques

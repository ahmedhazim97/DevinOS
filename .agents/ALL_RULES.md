# DevinOS — All Global Rules (21)

# Rule: AI Engineering

> Derived from [ENGINEERING_CONSTITUTION.md](../../ENGINEERING_CONSTITUTION.md) Article X.

---

## Principles

1. **Every AI output must be verifiable.** Never trust blindly.
2. **Prefer deterministic workflows over AI guessing.**
3. **Use AI for augmentation, not replacement.**
4. **Document AI decisions and their reasoning.**
5. **Validate AI-generated code like human-written code.**
6. **Monitor for hallucinations.** Cross-reference facts.
7. **Respect rate limits and costs.** Optimize token usage.

## Verification

- [ ] Is the AI output verifiable?
- [ ] Are decisions documented?
- [ ] Is generated code tested?
- [ ] Are hallucinations checked?


---

# Rule: API Design

> Derived from [ENGINEERING_CONSTITUTION.md](../../ENGINEERING_CONSTITUTION.md) Article I, V.

---

## Principles

1. **Design for consumers, not implementers.**
2. **Use consistent naming conventions.**
3. **Version your API.** Never break existing consumers.
4. **Return typed responses.** Document schemas.
5. **Use standard HTTP status codes correctly.**
6. **Implement proper rate limiting.**
7. **Document error responses as thoroughly as success responses.**

## Verification

- [ ] Is the API consumer-friendly?
- [ ] Are responses typed and documented?
- [ ] Are errors documented?
- [ ] Is rate limiting implemented?


---

# Rule: Architecture

> Derived from [ENGINEERING_CONSTITUTION.md](../../ENGINEERING_CONSTITUTION.md) Article I, V.

---

## Principles

1. **Prefer composition over inheritance.**
2. **Single Responsibility Principle** - One reason to change per module.
3. **Open/Closed Principle** - Open for extension, closed for modification.
4. **Dependency Inversion** - Depend on abstractions, not concretions.
5. **Keep modules loosely coupled and highly cohesive.**

## Verification

- [ ] Does this change follow SOLID principles?
- [ ] Are dependencies injected rather than hardcoded?
- [ ] Can this module be tested in isolation?


---

# Rule: Communication

> Derived from [ENGINEERING_CONSTITUTION.md](../../ENGINEERING_CONSTITUTION.md) Article X.

---

## Principles

1. **Be concise.** Respect the reader time.
2. **Be specific.** Avoid vague terms like "it works" or "it is better."
3. **Provide evidence.** Logs, metrics, screenshots.
4. **Ask clarifying questions early.** Do not build on ambiguous requirements.
5. **Document decisions.** Why was approach A chosen over B?
6. **Use precise technical terms.** Avoid jargon without explanation.

## Verification

- [ ] Is the communication concise?
- [ ] Is it specific and evidence-based?
- [ ] Are decisions documented?


---

# Rule: Database

> Derived from [ENGINEERING_CONSTITUTION.md](../../ENGINEERING_CONSTITUTION.md) Article I, VI.

---

## Principles

1. **Use parameterized queries. Never concatenate SQL.**
2. **Index wisely.** Too many indexes hurt writes.
3. **Normalize until it hurts, denormalize until it works.**
4. **Migrations must be reversible.** Always have a `down` script.
5. **Never delete data without a backup plan.** Soft deletes preferred.
6. **Use transactions for multi-step operations.**
7. **Monitor slow queries.** Optimize proactively.

## Verification

- [ ] Are queries parameterized?
- [ ] Are migrations reversible?
- [ ] Is there a backup plan for data deletion?
- [ ] Are slow queries monitored?


---

# Rule: Debugging

> Derived from [ENGINEERING_CONSTITUTION.md](../../ENGINEERING_CONSTITUTION.md) Article II, III.

---

## Principles

1. **Reproduce the bug first.** If you cannot reproduce it, you cannot fix it.
2. **Isolate the problem.** Binary search through code if needed.
3. **Check assumptions.** The bug is usually where you least expect it.
4. **Read error messages carefully.** Do not skim.
5. **Use logging, not print statements.** Structured logging is better.
6. **Fix the root cause, not the symptom.**

## Verification

- [ ] Can you consistently reproduce the bug?
- [ ] Did you identify the root cause?
- [ ] Does the fix address the root cause?
- [ ] Did you verify the fix with tests?


---

# Rule: Deployment

> Derived from [ENGINEERING_CONSTITUTION.md](../../ENGINEERING_CONSTITUTION.md) Article I, VI.

---

## Principles

1. **Automate deployments.** No manual steps in production.
2. **Use blue-green or canary deployments.** Minimize blast radius.
3. **Verify health checks before marking deployment complete.**
4. **Have a rollback plan.** Every deployment must be reversible.
5. **Never deploy on Fridays if you are not prepared for weekend support.**
6. **Monitor deployment metrics.** Error rates, latency, throughput.
7. **Tag releases clearly.** Semantic versioning.

## Verification

- [ ] Is deployment automated?
- [ ] Is there a rollback plan?
- [ ] Are health checks passing?
- [ ] Is the release tagged?


---

# Rule: Documentation

> Derived from [ENGINEERING_CONSTITUTION.md](../../ENGINEERING_CONSTITUTION.md) Article I.

---

## Principles

1. **Update README whenever architecture changes.**
2. **Explain non-obvious decisions.**
3. **Document APIs with examples.**
4. **Keep documentation close to code.**
5. **Use diagrams for complex flows.**
6. **Document failure modes, not just happy paths.**

## Verification

- [ ] Is the README up to date?
- [ ] Are non-obvious decisions explained?
- [ ] Are APIs documented with examples?
- [ ] Are failure modes documented?


---

# Rule: Engineering Principles

> Derived from [ENGINEERING_CONSTITUTION.md](../../ENGINEERING_CONSTITUTION.md) Article I, II, III, V.

---

## Principles

1. **Never assume requirements.** Ask when ambiguous.
2. **Always search the existing codebase before creating new files.**
3. **Reuse existing components whenever possible.**
4. **Keep implementations simple.** Avoid clever code.
5. **Never leave TODOs without a ticket or follow-up plan.**
6. **Never commit broken code.**
7. **Never claim success without terminal output or evidence.**

## Verification

- [ ] Before creating a new file, did you search for existing solutions?
- [ ] Is the implementation the simplest possible solution?
- [ ] Are there any unaddressed TODOs?
- [ ] Can you provide evidence that the code works?


---

# Rule: Git

> Derived from [ENGINEERING_CONSTITUTION.md](../../ENGINEERING_CONSTITUTION.md) Article IX.

---

## Principles

1. **Small, focused commits.** One logical change per commit.
2. **Meaningful commit messages.** Explain why, not just what.
3. **Never commit secrets.**
4. **Never commit broken code.**
5. **Never force push unless explicitly requested.**
6. **Branch from the correct base.** Keep branches short-lived.
7. **Write commit messages in present tense.** "Add feature" not "Added feature".

## Commit Message Format

```
type(scope): subject

body (optional)

footer (optional)
```

Types: `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore`

## Verification

- [ ] Are commits small and focused?
- [ ] Do commit messages explain the why?
- [ ] Are there any secrets in the diff?


---

# Rule: Continuous Learning

> Derived from [ENGINEERING_CONSTITUTION.md](../../ENGINEERING_CONSTITUTION.md) Article VII.

---

## Principles

1. **After every project, extract reusable knowledge.**
2. **Generalize before storing.** Remove project-specific details.
3. **Create or improve skills when patterns emerge.**
4. **Update rules when new evidence suggests change.**
5. **Share knowledge through clear documentation.**
6. **Review and prune outdated knowledge quarterly.**

## Verification

- [ ] Was knowledge extracted after the last project?
- [ ] Is it generalized?
- [ ] Are skills/rules updated accordingly?


---

# Rule: MCP (Model Context Protocol)

> Derived from [ENGINEERING_CONSTITUTION.md](../../ENGINEERING_CONSTITUTION.md) Article I.

---

## Principles

1. **Design tools with clear, single-purpose functions.**
2. **Validate all inputs at the MCP server boundary.**
3. **Return structured, typed responses.**
4. **Handle errors gracefully within the protocol.**
5. **Document every tool schema and behavior.**
6. **Version MCP server APIs independently.**
7. **Cache MCP registry responses appropriately.**

## Verification

- [ ] Are tools single-purpose?
- [ ] Are inputs validated?
- [ ] Are responses structured?
- [ ] Are errors handled gracefully?


---

# Rule: Memory & Learning

> Derived from [ENGINEERING_CONSTITUTION.md](../../ENGINEERING_CONSTITUTION.md) Article VII.

---

## Principles

1. **Extract generalizable lessons from every project.**
2. **Never keep project-specific details in global memory.**
3. **Update skills when new patterns prove valuable.**
4. **Document anti-patterns, not just best practices.**
5. **Review memory regularly for outdated information.**
6. **Link memory entries to skills and rules.**

## Verification

- [ ] Is the lesson generalizable?
- [ ] Is it linked to relevant skills/rules?
- [ ] Are anti-patterns documented?


---

# Rule: Monitoring & Observability

> Derived from [ENGINEERING_CONSTITUTION.md](../../ENGINEERING_CONSTITUTION.md) Article I.

---

## Principles

1. **Log structured data.** JSON logs, not plain text.
2. **Use proper log levels.** DEBUG, INFO, WARN, ERROR.
3. **Alert on symptoms, not causes.** High error rate, not "disk full."
4. **Dashboards must tell a story.** Not just metrics.
5. **Set SLOs and SLIs.** Measure what matters.
6. **Every alert must be actionable.** No "just FYI" alerts.
7. **Trace requests across services.** Distributed tracing.

## Verification

- [ ] Are logs structured?
- [ ] Are alerts actionable?
- [ ] Are SLOs defined?
- [ ] Is distributed tracing implemented?


---

# Rule: Performance

> Derived from [ENGINEERING_CONSTITUTION.md](../../ENGINEERING_CONSTITUTION.md) Article I.

---

## Principles

1. **Profile before optimizing.** Do not guess.
2. **Optimize for the hot path.** Not everything needs to be fast.
3. **Consider time complexity.** O(n) vs O(n^2) matters at scale.
4. **Use caching where appropriate.** But cache invalidation is hard.
5. **Lazy-load heavy components.** Do not block initial load.
6. **Optimize Core Web Vitals for frontend.**

## Verification

- [ ] Have you measured before optimizing?
- [ ] Is the optimization targeted at a proven bottleneck?
- [ ] Did you verify the improvement with benchmarks?


---

# Rule: Planning

> Derived from [ENGINEERING_CONSTITUTION.md](../../ENGINEERING_CONSTITUTION.md) Article I, III.

---

## Principles

1. **Understand the problem before proposing a solution.**
2. **Break work into small, verifiable steps.**
3. **Define success criteria before starting.**
4. **Identify risks and unknowns early.**
5. **Estimate effort realistically.** Padding is better than missing deadlines.
6. **Plan for testing from day one.**

## Verification

- [ ] Do you understand the problem fully?
- [ ] Are the steps small and verifiable?
- [ ] Are success criteria defined?
- [ ] Have risks been identified?


---

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
| 9â€“10 | Purpose obvious in 10 seconds; one-sentence summary exists; audience defined |
| 7â€“8 | Purpose exists but requires minor rewording; audience implied |
| 5â€“6 | Purpose buried or vague; no clear audience |
| 1â€“4 | Purpose missing or contradictory |

### Structure & Completeness (Gate 2)

| Score | Criteria |
|-------|----------|
| 9â€“10 | All required sections present; consistent formatting; follows template exactly |
| 7â€“8 | Minor missing sections; formatting inconsistencies |
| 5â€“6 | Significant gaps; missing required sections |
| 1â€“4 | Critical sections missing; does not follow asset template |

### Engineering Quality (Gate 3)

| Score | Criteria |
|-------|----------|
| 9â€“10 | Clarity, consistency, maintainability, scalability, reusability, reliability, correctness all excellent |
| 7â€“8 | Most dimensions excellent; 1â€“2 minor weaknesses |
| 5â€“6 | Several dimensions weak; asset is usable but flawed |
| 1â€“4 | Multiple dimensions fail; asset contains errors or unsafe advice |

### AI Understandability (Gate 4)

| Score | Criteria |
|-------|----------|
| 9â€“10 | AI can execute without human intervention; output format specified; no ambiguity |
| 7â€“8 | Minor clarifications needed; 1â€“2 ambiguous phrases |
| 5â€“6 | Multiple interpretations possible; missing output format |
| 1â€“4 | High ambiguity; conflicting instructions; AI likely to hallucinate |

### Uniqueness (Gate 5)

| Score | Criteria |
|-------|----------|
| 9â€“10 | Completely novel; no overlap with existing assets |
| 7â€“8 | Minor overlap (< 30%); cross-reference added |
| 5â€“6 | Significant overlap (30â€“70%); merging required |
| 1â€“4 | Near-complete duplicate (> 70%) |

### Generalization & Safety (Gate 6)

| Score | Criteria |
|-------|----------|
| 9â€“10 | Fully generalized; no project-specific details; zero safety concerns |
| 7â€“8 | Minor project-specific details; safe |
| 5â€“6 | Framework-specific without explicit marking; 1â€“2 minor safety concerns |
| 1â€“4 | Unsafe instructions; hardcoded secrets; destructive commands without warnings |

### Examples & Stress Test (Gate 7)

| Score | Criteria |
|-------|----------|
| 9â€“10 | Good + bad examples present; passes all 7 stress scenarios |
| 7â€“8 | Examples present; fails 1 stress scenario with documented limitation |
| 5â€“6 | Weak examples; fails 2â€“3 scenarios |
| 1â€“4 | No examples or bad examples only; fails >3 scenarios |

---

## Decision Rules

### Accept (90â€“100)
- All gates â‰¥ 5.0
- Gate 6 â‰¥ 7.0
- Gate 3 â‰¥ 6.0
- No major weaknesses

### Needs Revision (75â€“89)
- Overall score 75â€“89
- All gates â‰¥ 5.0
- Specific improvements listed
- Re-review required after fixes

### Major Revision (60â€“74)
- Overall score 60â€“74
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
- [ ] Did you verify Gate 6 â‰¥ 7.0?
- [ ] Did you verify no gate < 5.0?
- [ ] Did you write a Final Report?
- [ ] Did you justify every score with specific examples?
- [ ] Would you use this asset in your own production project?


---

# Rule: Code Review

> Derived from [ENGINEERING_CONSTITUTION.md](../../ENGINEERING_CONSTITUTION.md) Article X.

---

## Principles

1. **Review for correctness first.** Style is secondary.
2. **Check for security issues.**
3. **Verify tests exist and pass.**
4. **Ensure documentation is updated.**
5. **Ask questions rather than dictate.**
6. **Approve only when you would merge it yourself.**

## Verification

- [ ] Is the code correct?
- [ ] Are there security concerns?
- [ ] Do tests exist and pass?
- [ ] Is documentation updated?


---

# Rule: Security

> Derived from [ENGINEERING_CONSTITUTION.md](../../ENGINEERING_CONSTITUTION.md) Article VI.

---

## Principles

1. **Validate all inputs.** Never trust user data.
2. **Escape all outputs.** Prevent injection attacks.
3. **Never expose secrets in code, logs, or error messages.**
4. **Prefer environment variables for configuration.**
5. **Follow OWASP ASVS and OWASP Top 10.**
6. **Use parameterized queries. Never concatenate SQL.**
7. **Implement least-privilege access.**

## Verification

- [ ] Are all inputs validated?
- [ ] Are all outputs escaped?
- [ ] Are secrets stored in environment variables?
- [ ] Have you checked for OWASP Top 10 vulnerabilities?


---

# Rule: Testing

> Derived from [ENGINEERING_CONSTITUTION.md](../../ENGINEERING_CONSTITUTION.md) Article III.

---

## Principles

1. **Write tests before implementation when practical (TDD).**
2. **Run all tests before declaring completion.**
3. **Tests must be deterministic.** No randomness, no time dependence.
4. **Mock external dependencies.** Tests should not call real services.
5. **Cover edge cases.** Happy path is not enough.
6. **Name tests descriptively.** `should_throw_when_input_is_null` not `test1`.

## Verification

- [ ] Are there tests for the new code?
- [ ] Do all tests pass?
- [ ] Are edge cases covered?
- [ ] Are tests deterministic?


---

# Rule: User Experience

> Derived from [ENGINEERING_CONSTITUTION.md](../../ENGINEERING_CONSTITUTION.md) Article I.

---

## Principles

1. **Responsive by default.** Every interface must work on all screen sizes.
2. **Accessibility first.** WCAG 2.1 AA minimum.
3. **Optimize for Core Web Vitals.** LCP < 2.5s, FID < 100ms, CLS < 0.1.
4. **Provide clear feedback for all user actions.**
5. **Handle errors gracefully.** Never show raw error traces to users.
6. **Design for failure.** What happens when the network is slow?

## Verification

- [ ] Is the interface responsive?
- [ ] Does it meet WCAG 2.1 AA?
- [ ] Are Core Web Vitals optimized?
- [ ] Are errors handled gracefully?


---




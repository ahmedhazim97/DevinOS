---
name: architecture
description: "Evaluate and improve software architecture decisions to ensure scalability, maintainability, and correctness."
---

# Skill: Architecture Review
> Category: Core Engineering
> Priority: Critical

---

## Description

Evaluate and improve software architecture decisions to ensure scalability, maintainability, and correctness.

## Purpose

Catch architectural flaws early, before they become expensive to fix.

## Trigger

Use this skill when:
- Designing a new system or service
- Proposing a significant refactor
- Adding a new dependency
- Changing data flow or state management
- Introducing a new pattern

## Context

- Current system architecture
- Non-functional requirements (scale, latency, availability)
- Team expertise
- Existing technical debt

## Workflow

1. **Gather Requirements** - Functional and non-functional.
2. **Identify Constraints** - Time, budget, team, legacy systems.
3. **Propose Options** - At least two approaches.
4. **Evaluate Trade-offs** - For each option, list pros, cons, risks.
5. **Apply SOLID** - Check each principle against the proposal.
6. **Check Coupling** - Are components loosely coupled?
7. **Verify Testability** - Can key components be unit tested?
8. **Document Decision** - Why was this approach chosen?
9. **Plan Migration** - If replacing existing architecture, define the path.

## Examples

### Good

```
Option A: Monolith with modular packages
  Pros: Simpler deployment, shared codebase
  Cons: Tight coupling risk, harder to scale teams

Option B: Microservices
  Pros: Independent scaling, team autonomy
  Cons: Operational complexity, network latency

Decision: Option A for now, with clear module boundaries
  Reason: Team size is 3 engineers. Operational overhead of microservices
          outweighs benefits at this scale.
```

### Bad

```
Let us use microservices because they are modern.
```

## Anti-patterns

- Choosing technology because it is trendy
- Ignoring team size and operational capacity
- No documented trade-off analysis
- Architecture without migration plan

## Verification

- [ ] Are there at least two options considered?
- [ ] Are trade-offs documented?
- [ ] Does the choice align with constraints?
- [ ] Is there a migration plan if needed?

## References

- [Martin Fowler - Architecture Patterns](https://martinfowler.com/architecture/)
- [The Software Architecture Elevator](https://architectelevator.com/)


---



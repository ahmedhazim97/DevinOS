# Skill: Planning

> Category: Core Engineering
> Priority: Critical

---

## Description

Systematic approach to breaking down complex engineering tasks into small, verifiable, and sequenced steps.

## Purpose

Eliminate ambiguity, reduce rework, and ensure every task has clear success criteria before implementation begins.

## Trigger

Use this skill when:
- Starting a new feature
- Refactoring a large subsystem
- Planning a migration
- Estimating effort
- Defining an architecture

## Context

- Current codebase state
- Existing dependencies and constraints
- Team standards and conventions
- Timeline and risk tolerance

## Workflow

1. **Understand** - Clarify requirements. Ask questions until ambiguity is zero.
2. **Research** - Search existing codebase for similar implementations.
3. **Decompose** - Break into steps no larger than 2 hours of work each.
4. **Sequence** - Order steps by dependency and risk.
5. **Define Success** - Each step must have verifiable completion criteria.
6. **Identify Risks** - List unknowns and mitigation strategies.
7. **Estimate** - Provide realistic effort estimates with buffer.
8. **Review** - Present plan for validation before execution.

## Examples

### Good

```
Step 1: Create database migration for new column (30 min)
  Success: Migration runs up and down successfully

Step 2: Update model to include new field (15 min)
  Success: Unit test for model passes

Step 3: Add API endpoint (1 hour)
  Success: Endpoint returns correct response, tests pass

Step 4: Update frontend form (1 hour)
  Success: Form submits and displays new field
```

### Bad

```
Step 1: Build the feature (3 days)
  Success: It works
```

## Anti-patterns

- Vague steps like "implement the thing"
- Missing success criteria
- No risk assessment
- No dependency ordering

## Verification

- [ ] Is every step under 2 hours?
- [ ] Does every step have clear success criteria?
- [ ] Are dependencies ordered correctly?
- [ ] Are risks identified?

## References

- [User Story Mapping](https://www.jpattonassociates.com/story-mapping/)
- [Shape Up by Basecamp](https://basecamp.com/shapeup)

# Skill: Code Review

> Category: Core Engineering
> Priority: Critical

---

## Description

Evaluate code changes for correctness, security, maintainability, and alignment with team standards.

## Purpose

Prevent defects from reaching production and spread knowledge across the team.

## Trigger

Use this skill when:
- Reviewing a pull request
- Auditing existing code
- Mentoring junior developers
- Refactoring legacy code

## Context

- Full diff of changes
- Related issues or requirements
- Existing codebase patterns
- Security and performance constraints

## Workflow

1. **Understand Context** - Read the issue and description first.
2. **Check Correctness** - Does the code do what it claims?
3. **Check Security** - Validate inputs, escape outputs, no secrets.
4. **Check Tests** - Do tests exist? Do they cover edge cases?
5. **Check Architecture** - Does it follow SOLID? Is coupling acceptable?
6. **Check Performance** - Any N+1 queries? Unnecessary re-renders?
7. **Check Readability** - Are names descriptive? Comments only where needed?
8. **Check Documentation** - Is README or API docs updated?
9. **Provide Feedback** - Ask questions, suggest improvements, praise good work.
10. **Verify Fixes** - Re-review after changes.

## Examples

### Good Review Comment

```
Question: Why are we parsing this date string manually instead of
using the existing `DateParser` utility? The utility handles timezones
and leap years correctly, which this implementation does not.

Suggestion: Use `DateParser.parse()` and add a test for timezone handling.
```

### Bad Review Comment

```
This is wrong. Fix it.
```

## Anti-patterns

- Reviewing only style, missing logic bugs
- Approving without running tests
- Being harsh instead of constructive
- Not re-reviewing after fixes

## Verification

- [ ] Did you understand the context before reviewing?
- [ ] Did you check for security issues?
- [ ] Did you verify tests exist and pass?
- [ ] Is your feedback actionable?

## References

- [Google Code Review Guidelines](https://google.github.io/eng-practices/review/)

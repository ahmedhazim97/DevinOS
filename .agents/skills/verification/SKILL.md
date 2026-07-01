---
name: verification
description: "Rigorous validation that a task is truly complete and correct."
---

# Skill: Verification
> Category: Core Engineering
> Priority: Critical

---

## Description

Rigorous validation that a task is truly complete and correct.

## Purpose

Prevent false confidence. Never claim success without evidence.

## Trigger

Use this skill when:
- Declaring a task complete
- Preparing a pull request
- Before merging code
- Before deploying to production
- After any significant change

## Context

- Requirements and acceptance criteria
- Test results
- Security checklist
- Performance benchmarks
- Documentation state

## Workflow

1. **Re-read Requirements** - Does the implementation match exactly?
2. **Run All Tests** - Unit, integration, e2e. All must pass.
3. **Check Linting** - No style violations.
4. **Manual Verification** - Test the feature manually if needed.
5. **Security Check** - Inputs validated? Secrets safe?
6. **Performance Check** - No regressions?
7. **Documentation Check** - README updated? API docs current?
8. **Git Check** - Clean history? No secrets in diff?
9. **Peer Review** - Has another person reviewed?
10. **Sign Off** - Only then declare complete.

## Examples

### Good

```
Task: Add email validation to signup form

Verification:
[x] Unit tests for validator pass (12 tests)
[x] Integration test for signup flow passes
[x] Manual test: invalid email shows error
[x] Manual test: valid email proceeds
[x] No secrets in code
[x] README updated with validation rules
[x] Commit history clean
[x] Reviewed by @teammate
```

### Bad

```
Task done. It works on my machine.
```

## Anti-patterns

- Claiming completion without running tests
- Skipping manual verification for UI changes
- Ignoring lint errors
- Not checking for secrets
- Skipping peer review

## Verification

- [ ] Have all tests been run?
- [ ] Have you manually verified the feature?
- [ ] Is documentation updated?
- [ ] Is the git history clean?

## References

- [Definition of Done by Scrum.org](https://www.scrum.org/resources/blog/done-understanding-definition-done)
- [Checklist Manifesto by Atul Gawande](https://atulgawande.com/book/the-checklist-manifesto/)


---



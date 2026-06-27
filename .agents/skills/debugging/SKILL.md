# Skill: Structured Debugging

> Category: Core Engineering
> Priority: Critical

---

## Description

A systematic, evidence-based approach to finding and fixing bugs.

## Purpose

Eliminate guesswork. Fix root causes, not symptoms.

## Trigger

Use this skill when:
- A bug is reported
- Tests fail unexpectedly
- Behavior does not match expectations
- Performance degrades

## Context

- Error logs and stack traces
- Recent code changes
- Environment differences
- Reproduction steps

## Workflow

1. **Reproduce** - Can you make it fail consistently?
2. **Isolate** - Binary search: comment out half the code. Which half fails?
3. **Hypothesize** - Form a theory about the root cause.
4. **Test Hypothesis** - Add logging or use a debugger to confirm.
5. **Fix Root Cause** - Address the source, not the symptom.
6. **Verify Fix** - Confirm the bug is gone AND no new bugs introduced.
7. **Add Regression Test** - Ensure this bug never returns.
8. **Document** - Update knowledge base if the fix reveals a pattern.

## Examples

### Good

```
Bug: Users see 500 error on checkout

1. Reproduce: Confirmed on staging with user ID 12345
2. Isolate: Error occurs in payment service, not cart service
3. Hypothesize: Null pointer when user has no saved cards
4. Test: Add debug log -> confirmed null `cards` array
5. Fix: Add null check before iterating cards
6. Verify: Checkout works for user 12345 AND existing users with cards
7. Regression test: Unit test for null cards scenario added
8. Document: Added to anti-patterns: "Always null-check before iteration"
```

### Bad

```
Bug: 500 error
Fix: Added try-catch to swallow the error.
```

## Anti-patterns

- Fixing symptoms with try-catch
- Skipping reproduction
- Not adding regression tests
- Debugging without logs

## Verification

- [ ] Can the bug be consistently reproduced?
- [ ] Was the root cause identified?
- [ ] Does the fix address the root cause?
- [ ] Is there a regression test?

## References

- [Debug It! by Paul Butcher](https://pragprog.com/titles/pbdp/debug-it/)

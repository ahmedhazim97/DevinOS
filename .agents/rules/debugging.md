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


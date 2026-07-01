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


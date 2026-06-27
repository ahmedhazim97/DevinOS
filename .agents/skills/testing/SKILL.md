# Skill: Testing

> Category: Core Engineering
> Priority: Critical

---

## Description

Write comprehensive, deterministic, and maintainable tests.

## Purpose

Ensure correctness, prevent regressions, and document expected behavior.

## Trigger

Use this skill when:
- Writing new code
- Fixing a bug
- Refactoring existing code
- Adding a new feature
- Reviewing code

## Context

- Code under test
- Dependencies and external services
- Testing framework in use
- Coverage requirements

## Workflow

1. **Understand Behavior** - What should this code do?
2. **Identify Edge Cases** - Null, empty, max values, errors.
3. **Write Test First (TDD)** - Red, Green, Refactor.
4. **Use Descriptive Names** - `should_return_404_when_user_not_found`
5. **Mock External Dependencies** - Tests must be isolated.
6. **Assert One Thing** - One concept per test.
7. **Keep Tests Fast** - Slow tests are not run.
8. **Maintain Tests** - Update tests when requirements change.

## Test Pyramid

```
      /\
     /  \  E2E (Few)
    /____\ 
   /      \  Integration (Some)
  /________\
 /          \  Unit (Many)
/____________\
```

## Examples

### Good

```typescript
describe("UserService", () => {
  describe("createUser", () => {
    it("should throw ValidationError when email is invalid", () => {
      expect(() => service.createUser({ email: "not-an-email" }))
        .toThrow(ValidationError);
    });

    it("should hash password before storing", async () => {
      const user = await service.createUser({ email: "a@b.com", password: "secret" });
      expect(user.password).not.toBe("secret");
      expect(await bcrypt.compare("secret", user.password)).toBe(true);
    });
  });
});
```

### Bad

```typescript
test("user", () => {
  const result = service.createUser(data);
  expect(result).toBeDefined();
});
```

## Anti-patterns

- Testing implementation details instead of behavior
- Using real databases/network in unit tests
- Non-deterministic tests (time, random, order-dependent)
- Missing edge cases

## Verification

- [ ] Do tests cover happy path and edge cases?
- [ ] Are external dependencies mocked?
- [ ] Are tests deterministic?
- [ ] Do tests run quickly?

## References

- [Test Driven Development by Kent Beck](https://www.oreilly.com/library/view/test-driven-development/0321146530/)
- [Google Testing Blog](https://testing.googleblog.com/)

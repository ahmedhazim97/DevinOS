# Skill: Refactoring

> Category: Core Engineering
> Priority: Critical

---

## Description

Improve code structure without changing external behavior.

## Purpose

Reduce technical debt and improve maintainability while preserving functionality.

## Trigger

Use this skill when:
- Code has high cyclomatic complexity
- Duplicated logic exists
- A class has too many responsibilities
- Tests are hard to write due to tight coupling
- Performance can be improved through structure

## Context

- Full codebase context
- Test coverage of target code
- Risk tolerance for change
- Time available

## Workflow

1. **Ensure Tests Exist** - Before touching code, verify coverage.
2. **Identify Smell** - Which refactoring pattern applies?
3. **Apply Small Steps** - One refactoring at a time.
4. **Run Tests After Each Step** - Green tests are your safety net.
5. **Commit Frequently** - Each small step is a commit.
6. **Verify Behavior** - No functional changes.
7. **Document** - Update docs if structure changed significantly.

## Common Patterns

- Extract Method
- Extract Class
- Move Method
- Replace Conditional with Polymorphism
- Introduce Parameter Object
- Remove Duplication (DRY)

## Examples

### Before

```javascript
function processOrder(order) {
  if (order.type === "digital") {
    // 20 lines of digital processing
  } else if (order.type === "physical") {
    // 20 lines of physical processing
  }
}
```

### After

```javascript
function processOrder(order) {
  const processor = OrderProcessorFactory.create(order.type);
  processor.process(order);
}
```

## Anti-patterns

- Refactoring without tests
- Changing behavior during refactoring
- Giant refactoring PRs
- Refactoring just for style

## Verification

- [ ] Do tests exist and pass before refactoring?
- [ ] Did you run tests after each step?
- [ ] Is behavior unchanged?
- [ ] Are commits small and focused?

## References

- [Refactoring by Martin Fowler](https://refactoring.com/)
- [Refactoring Guru](https://refactoring.guru/)

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

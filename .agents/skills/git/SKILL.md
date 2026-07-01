---
name: git
description: "Professional version control practices for clean, collaborative development."
---

# Skill: Git Workflow
> Category: Core Engineering
> Priority: High

---

## Description

Professional version control practices for clean, collaborative development.

## Purpose

Maintain a readable history, enable rollbacks, and prevent conflicts.

## Trigger

Use this skill when:
- Starting work on a new feature
- Committing code
- Resolving merge conflicts
- Preparing a pull request
- Reverting a change

## Context

- Branching strategy (GitFlow, trunk-based, etc.)
- Team conventions
- CI/CD requirements

## Workflow

1. **Create Feature Branch** - From latest main: `git checkout -b feature/name`
2. **Make Small Commits** - One logical change per commit.
3. **Write Meaningful Messages** - Explain why, not just what.
4. **Pull Regularly** - Keep your branch up to date.
5. **Resolve Conflicts Carefully** - Understand both sides.
6. **Squash if Needed** - Clean history before merge.
7. **Delete Branch After Merge** - Keep the repository clean.

## Commit Message Format

```
type(scope): subject

body (optional)

footer (optional)
```

Types: `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore`

## Examples

### Good Commit History

```
feat(auth): add JWT-based authentication

- Implement login endpoint
- Add token refresh logic
- Store tokens in httpOnly cookies

Closes #123
```

### Bad Commit History

```
fix stuff
update
final commit
really final
```

## Anti-patterns

- Committing broken code
- Force pushing to shared branches
- Giant commits with unrelated changes
- Meaningless commit messages

## Verification

- [ ] Are commits small and focused?
- [ ] Do messages explain the why?
- [ ] Is the branch up to date with main?
- [ ] Is history clean before merge?

## References

- [Conventional Commits](https://www.conventionalcommits.org/)
- [Git Best Practices](https://sethrobertson.github.io/GitBestPractices/)


---



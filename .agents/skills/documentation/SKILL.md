---
name: documentation
description: "Write clear, accurate, and useful documentation."
---

# Skill: Documentation
> Category: Core Engineering
> Priority: High

---

## Description

Write clear, accurate, and useful documentation.

## Purpose

Reduce onboarding time, prevent miscommunication, and preserve knowledge.

## Trigger

Use this skill when:
- Creating a new feature
- Changing an API
- Onboarding a new team member
- Writing a library or utility
- After fixing a complex bug

## Context

- Target audience (new hire, external developer, future self)
- Existing documentation style
- Tools available (Markdown, OpenAPI, JSDoc)

## Workflow

1. **Identify Audience** - Who needs this documentation?
2. **Define Scope** - What do they need to know?
3. **Provide Context** - Why does this exist? When should it be used?
4. **Include Examples** - Show, do not just tell.
5. **Document Failure Modes** - What can go wrong? How to fix it?
6. **Keep It Updated** - Documentation must reflect reality.
7. **Make It Discoverable** - Link from README and relevant code.

## Examples

### Good API Documentation

```markdown
## POST /api/users

Creates a new user.

### Request
```json
{
  "email": "user@example.com",
  "password": "securePassword123"
}
```

### Response (201 Created)
```json
{
  "id": "uuid",
  "email": "user@example.com",
  "createdAt": "2024-01-01T00:00:00Z"
}
```

### Errors
- `400` - Invalid email or weak password
- `409` - Email already exists
```

### Bad API Documentation

```markdown
POST /api/users - creates user
```

## Anti-patterns

- Outdated documentation
- Missing error documentation
- No examples
- Writing for yourself instead of the audience

## Verification

- [ ] Is the audience clear?
- [ ] Are there working examples?
- [ ] Are errors documented?
- [ ] Is it up to date?

## References

- [Diataxis Framework](https://diataxis.fr/)
- [Google Technical Writing](https://developers.google.com/tech-writing)


---



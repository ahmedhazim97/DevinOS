# Skill: Knowledge Distillation

> Category: Meta-Learning
> Priority: High

---

## Description

Extract generalizable lessons from project work and convert them into reusable skills.

## Purpose

Transform individual project experience into institutional knowledge.

## Trigger

Use this skill when:
- Completing a project or major feature
- Fixing a complex bug
- Making an architectural decision
- Discovering a useful pattern
- Avoiding a repeated mistake

## Context

- Project outcomes
- Decisions made and their results
- Patterns that emerged
- Mistakes and their causes

## Workflow

1. **Reflect** - What happened? What worked? What did not?
2. **Generalize** - Remove project-specific details.
3. **Identify Pattern** - Is this a rule, skill, or anti-pattern?
4. **Create Asset** - Write the skill, rule, or memory entry.
5. **Link** - Connect to related skills and rules.
6. **Share** - Make it discoverable in the knowledge base.

## Examples

### Good Distillation

```
Project: E-commerce checkout optimization

Lesson: N+1 queries are the #1 cause of slow list endpoints in Laravel.
Pattern: Always eager load relationships in list endpoints.
Action: Created skill "Database Query Optimization"
Linked to: Backend skill, Performance skill, Laravel template
```

### Bad Distillation

```
Project done. Nothing special.
```

## Anti-patterns

- Keeping lessons in your head
- Writing project-specific notes in global memory
- Not linking related knowledge
- Never reviewing or updating distilled knowledge

## Verification

- [ ] Is the lesson generalizable?
- [ ] Is it linked to related skills?
- [ ] Is it discoverable?
- [ ] Will it help future projects?

## References

- [Working Effectively with Legacy Code by Michael Feathers](https://www.oreilly.com/library/view/working-effectively-with/0131177052/)

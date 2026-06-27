# Contributing to DevinOS

Thank you for your interest in making DevinOS the best engineering operating system for Devin. This document outlines how to contribute effectively.

---

## Before You Contribute

1. Read the [ENGINEERING_CONSTITUTION.md](ENGINEERING_CONSTITUTION.md).
2. Check the [ROADMAP.md](ROADMAP.md) for planned features.
3. Search existing issues and pull requests to avoid duplicates.

---

## Contribution Types

### Skills
Every skill must include:

- **SKILL.md** with:
  - Description
  - Purpose
  - Trigger (when to use)
  - Context (what Devin needs to know)
  - Workflow (step-by-step instructions)
  - Examples (good and bad)
  - Anti-patterns
  - Verification checklist
  - References

- Optional but encouraged:
  - `examples.md` - Detailed examples
  - `anti-patterns.md` - Common mistakes
  - `checklist.md` - Quick reference
  - `references.md` - Further reading

### Rules
Every rule must:

- Be framework-agnostic when possible.
- Reference the constitution article it derives from.
- Include real-world justification.
- Be enforceable and verifiable.

### Workflows
Every workflow must:

- Define inputs, outputs, and success criteria.
- List required skills.
- Include decision trees where applicable.
- Be reversible when possible.

### Playbooks
Every playbook must:

- Start with a clear scenario.
- Include step-by-step procedures.
- Define escalation paths.
- Include post-incident learning steps.

---

## Quality Gates

Before submitting a pull request, ensure:

- [ ] No duplicate content exists in the repository.
- [ ] All markdown files pass a linter (no broken links, consistent formatting).
- [ ] Every skill has at least one example.
- [ ] Every rule references the constitution.
- [ ] Commit messages are meaningful and follow conventional commits.
- [ ] No secrets or sensitive data is included.

---

## Pull Request Process

1. Fork the repository.
2. Create a feature branch: `git checkout -b feature/amazing-skill`
3. Make your changes following the standards above.
4. Run the quality checklist.
5. Submit a pull request with a clear description.
6. Address reviewer feedback promptly.

---

## Code of Conduct

- Be respectful and constructive.
- Focus on the quality of ideas, not the person.
- Assume good intent.
- Help others learn.

---

## Questions?

Open an issue with the `question` label. We are here to help.

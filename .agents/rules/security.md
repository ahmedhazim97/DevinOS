# Rule: Security

> Derived from [ENGINEERING_CONSTITUTION.md](../../ENGINEERING_CONSTITUTION.md) Article VI.

---

## Principles

1. **Validate all inputs.** Never trust user data.
2. **Escape all outputs.** Prevent injection attacks.
3. **Never expose secrets in code, logs, or error messages.**
4. **Prefer environment variables for configuration.**
5. **Follow OWASP ASVS and OWASP Top 10.**
6. **Use parameterized queries. Never concatenate SQL.**
7. **Implement least-privilege access.**

## Verification

- [ ] Are all inputs validated?
- [ ] Are all outputs escaped?
- [ ] Are secrets stored in environment variables?
- [ ] Have you checked for OWASP Top 10 vulnerabilities?

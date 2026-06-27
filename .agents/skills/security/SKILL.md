# Skill: Security Review

> Category: Core Engineering
> Priority: Critical

---

## Description

Systematic evaluation of code and architecture for security vulnerabilities.

## Purpose

Prevent security flaws from reaching production.

## Trigger

Use this skill when:
- Writing authentication/authorization code
- Handling user input
- Processing sensitive data
- Adding new dependencies
- Before any production deployment
- After a security incident

## Context

- Code under review
- Threat model
- OWASP Top 10
- Compliance requirements (GDPR, SOC2, etc.)

## Workflow

1. **Identify Attack Surface** - Where can malicious input enter?
2. **Validate Inputs** - Whitelist, sanitize, validate length and type.
3. **Escape Outputs** - Prevent XSS, SQL injection, command injection.
4. **Check Authentication** - Are all protected routes guarded?
5. **Check Authorization** - Can users access others data?
6. **Audit Dependencies** - Known vulnerabilities? (npm audit, safety)
7. **Check Secrets** - No hardcoded keys, tokens, or passwords.
8. **Review Error Handling** - No information leakage in errors.
9. **Verify HTTPS** - Are all communications encrypted?
10. **Run Security Tools** - SAST, DAST, dependency scanners.

## Examples

### Good

```
Security Review: New payment endpoint

[x] Input: Card number validated with regex and Luhn check
[x] Output: Response does not include raw card number
[x] Auth: Endpoint requires valid JWT
[x] Authz: Users can only see their own payments
[x] Secrets: Stripe key from env var, not hardcoded
[x] HTTPS: Strict TLS 1.2+ enforced
[x] Errors: Generic error messages to client, details logged server-side
[x] Audit: All payment attempts logged with user ID and timestamp
```

### Bad

```
It uses HTTPS so it is secure.
```

## Anti-patterns

- Trusting client-side validation
- Showing detailed error messages to users
- Storing passwords in plain text
- Not rate-limiting authentication endpoints

## Verification

- [ ] Are all inputs validated?
- [ ] Are all outputs escaped?
- [ ] Are secrets in environment variables?
- [ ] Is authentication enforced everywhere?

## References

- [OWASP Top 10](https://owasp.org/www-project-top-ten/)
- [OWASP ASVS](https://owasp.org/www-project-application-security-verification-standard/)

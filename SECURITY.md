# Security Policy

## Supported Versions

| Version | Supported          |
| ------- | ------------------ |
| 0.1.x   | :white_check_mark: |

## Reporting a Vulnerability

If you discover a security vulnerability in DevinOS, please email the maintainers directly rather than opening a public issue.

**Do NOT disclose security issues in public forums.**

## Security Principles

DevinOS follows these security principles:

1. **No secrets in code** - Never commit API keys, passwords, or tokens.
2. **Input validation** - All inputs must be validated.
3. **Output escaping** - All outputs must be escaped to prevent injection.
4. **Dependency auditing** - Regularly audit dependencies for vulnerabilities.
5. **Least privilege** - Follow the principle of least privilege in all systems.

## Security Checklist for Skills

When adding a skill that touches security:

- [ ] Does it validate inputs?
- [ ] Does it escape outputs?
- [ ] Does it avoid hardcoded secrets?
- [ ] Does it follow OWASP guidelines?
- [ ] Is it documented with security considerations?

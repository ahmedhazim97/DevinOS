# Rule: Monitoring & Observability

> Derived from [ENGINEERING_CONSTITUTION.md](../../ENGINEERING_CONSTITUTION.md) Article I.

---

## Principles

1. **Log structured data.** JSON logs, not plain text.
2. **Use proper log levels.** DEBUG, INFO, WARN, ERROR.
3. **Alert on symptoms, not causes.** High error rate, not "disk full."
4. **Dashboards must tell a story.** Not just metrics.
5. **Set SLOs and SLIs.** Measure what matters.
6. **Every alert must be actionable.** No "just FYI" alerts.
7. **Trace requests across services.** Distributed tracing.

## Verification

- [ ] Are logs structured?
- [ ] Are alerts actionable?
- [ ] Are SLOs defined?
- [ ] Is distributed tracing implemented?


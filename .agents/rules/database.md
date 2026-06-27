# Rule: Database

> Derived from [ENGINEERING_CONSTITUTION.md](../../ENGINEERING_CONSTITUTION.md) Article I, VI.

---

## Principles

1. **Use parameterized queries. Never concatenate SQL.**
2. **Index wisely.** Too many indexes hurt writes.
3. **Normalize until it hurts, denormalize until it works.**
4. **Migrations must be reversible.** Always have a `down` script.
5. **Never delete data without a backup plan.** Soft deletes preferred.
6. **Use transactions for multi-step operations.**
7. **Monitor slow queries.** Optimize proactively.

## Verification

- [ ] Are queries parameterized?
- [ ] Are migrations reversible?
- [ ] Is there a backup plan for data deletion?
- [ ] Are slow queries monitored?

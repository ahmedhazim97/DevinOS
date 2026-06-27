# Rule: Deployment

> Derived from [ENGINEERING_CONSTITUTION.md](../../ENGINEERING_CONSTITUTION.md) Article I, VI.

---

## Principles

1. **Automate deployments.** No manual steps in production.
2. **Use blue-green or canary deployments.** Minimize blast radius.
3. **Verify health checks before marking deployment complete.**
4. **Have a rollback plan.** Every deployment must be reversible.
5. **Never deploy on Fridays if you are not prepared for weekend support.**
6. **Monitor deployment metrics.** Error rates, latency, throughput.
7. **Tag releases clearly.** Semantic versioning.

## Verification

- [ ] Is deployment automated?
- [ ] Is there a rollback plan?
- [ ] Are health checks passing?
- [ ] Is the release tagged?

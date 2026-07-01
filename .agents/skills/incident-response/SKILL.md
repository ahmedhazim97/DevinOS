---
name: incident-response
description: "Systematic response to production incidents to minimize impact and prevent recurrence."
---

# Skill: Incident Response
> Category: Operations
> Priority: High

---

## Description

Systematic response to production incidents to minimize impact and prevent recurrence.

## Purpose

Restore service quickly, preserve evidence, and learn from failures.

## Trigger

Use this skill when:
- Production alerts fire
- Users report widespread issues
- Error rates spike
- Latency degrades significantly
- Security breach suspected

## Context

- Monitoring dashboards
- Recent deployments
- System architecture
- On-call runbooks
- Communication channels

## Workflow

1. **Assess Severity** - SEV1 (critical), SEV2 (major), SEV3 (minor)
2. **Communicate** - Notify stakeholders via incident channel
3. **Mitigate** - Stop the bleeding. Rollback, disable feature, scale up.
4. **Investigate** - Gather logs, metrics, traces. Find root cause.
5. **Fix** - Implement the actual fix after mitigation.
6. **Verify** - Confirm service is healthy.
7. **Document** - Post-mortem within 24 hours.
8. **Learn** - Action items to prevent recurrence.

## Incident Severity

| Level | Criteria | Response Time |
|-------|----------|---------------|
| SEV1  | Complete outage, data loss, security breach | Immediate |
| SEV2  | Major feature degraded, significant performance impact | < 30 min |
| SEV3  | Minor feature broken, workaround exists | < 4 hours |

## Examples

### Good Response

```
13:05 - Alert: Error rate > 5%
13:06 - Declared SEV2, notified team
13:08 - Identified: Last deploy introduced N+1 query
13:10 - Mitigation: Rolled back to previous version
13:15 - Error rate normal
13:30 - Fix: Added eager load, deployed fix
13:45 - Post-mortem started
```

### Bad Response

```
13:05 - Error rate high
15:00 - Someone finally checks
15:30 - Tries random fixes
17:00 - Service recovers on its own
(Never documented what happened)
```

## Anti-patterns

- Fixing without understanding the cause
- No communication during incident
- No rollback plan
- Skipping post-mortem
- Blaming individuals

## Verification

- [ ] Was severity assessed correctly?
- [ ] Were stakeholders notified promptly?
- [ ] Was service restored quickly?
- [ ] Is there a post-mortem with action items?

## References

- [Google SRE - Incident Response](https://sre.google/sre-book/managing-incidents/)
- [PagerDuty Incident Response](https://response.pagerduty.com/)


---



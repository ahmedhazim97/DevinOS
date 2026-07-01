---
name: root-cause-analysis
description: "Determine the fundamental cause of a problem, not just the symptom."
---

# Skill: Root Cause Analysis
> Category: Core Engineering
> Priority: High

---

## Description

Determine the fundamental cause of a problem, not just the symptom.

## Purpose

Prevent problems from recurring by fixing their source.

## Trigger

Use this skill when:
- A bug keeps reappearing
- A system fails repeatedly
- Post-mortem requires deep investigation
- Performance degrades without obvious cause

## Context

- Error logs and stack traces
- System metrics and traces
- Recent changes (code, config, infrastructure)
- Historical incident data

## Workflow

1. **Define Problem** - What exactly happened? When?
2. **Gather Data** - Logs, metrics, changes, interviews.
3. **Identify Causal Factors** - What contributed? Not just the trigger.
4. **Ask "Why?" Five Times** - Drill down to the root.
5. **Verify Root Cause** - Can you reproduce by triggering the root cause?
6. **Propose Fix** - Address the root, not the symptom.
7. **Implement and Verify** - Fix it and confirm.
8. **Prevent Recurrence** - Update processes, add tests, improve monitoring.

## 5 Whys Example

```
Problem: API returns 500 errors

Why? - Null pointer exception
Why? - User object is null
Why? - Cache expired but database query failed
Why? - Database connection pool exhausted
Why? - Connection leaks in retry logic

Root Cause: Retry logic does not release connections on failure.
Fix: Ensure connections are released in finally block.
Prevention: Add test for connection leak, add connection pool alert.
```

## Anti-patterns

- Stopping at the first obvious cause
- Blaming people instead of processes
- Fixing symptoms without understanding
- Skipping the verification step

## Verification

- [ ] Can you explain the full causal chain?
- [ ] Have you asked "Why?" at least 5 times?
- [ ] Can you reproduce the problem from the root cause?
- [ ] Is the fix addressing the root cause?

## References

- [Root Cause Analysis Handbook](https://www.asq.org/quality-resources/root-cause-analysis)
- [Toyota Production System - 5 Whys](https://en.wikipedia.org/wiki/Five_whys)


---



---
name: performance
description: "Measure, analyze, and improve system performance with evidence."
---

# Skill: Performance Optimization
> Category: Core Engineering
> Priority: High

---

## Description

Measure, analyze, and improve system performance with evidence.

## Purpose

Ensure systems meet performance requirements without premature optimization.

## Trigger

Use this skill when:
- Response times exceed SLAs
- Resource usage is high
- Scaling issues emerge
- User complaints about slowness
- Before major releases

## Context

- Performance metrics and benchmarks
- Profiling tools available
- Current architecture bottlenecks
- User-facing SLAs

## Workflow

1. **Profile First** - Identify actual bottlenecks. Do not guess.
2. **Set Baseline** - Measure current performance.
3. **Hypothesize** - Form a theory about the bottleneck.
4. **Implement Change** - One optimization at a time.
5. **Measure Impact** - Compare against baseline.
6. **Verify Correctness** - Optimization did not break functionality.
7. **Document** - Record the bottleneck and solution for future reference.

## Common Optimizations

- Database query optimization (indexes, N+1 fixes)
- Caching strategies (Redis, CDN)
- Async processing for slow operations
- Code algorithm improvements
- Asset optimization (images, bundles)
- Connection pooling

## Examples

### Good

```
Issue: API response time is 3s

Profile: Database query takes 2.8s (N+1 on orders->items)
Baseline: 3.0s average
Hypothesis: Eager loading will fix N+1
Change: Added `with("items")` to query
Measure: 0.15s average
Verify: All tests pass, no functionality change
Document: Added to memory: "Always eager load relationships in list endpoints"
```

### Bad

```
The API is slow. Let us add Redis caching everywhere.
```

## Anti-patterns

- Optimizing without profiling
- Adding complexity for negligible gains
- Ignoring memory usage for CPU gains
- Not verifying correctness after optimization

## Verification

- [ ] Have you profiled to find the real bottleneck?
- [ ] Did you measure before and after?
- [ ] Is the improvement significant?
- [ ] Did you verify correctness?

## References

- [Systems Performance by Brendan Gregg](http://www.brendangregg.com/sysperfbook.html)
- [High Performance Browser Networking](https://hpbn.co/)


---



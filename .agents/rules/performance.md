# Rule: Performance

> Derived from [ENGINEERING_CONSTITUTION.md](../../ENGINEERING_CONSTITUTION.md) Article I.

---

## Principles

1. **Profile before optimizing.** Do not guess.
2. **Optimize for the hot path.** Not everything needs to be fast.
3. **Consider time complexity.** O(n) vs O(n^2) matters at scale.
4. **Use caching where appropriate.** But cache invalidation is hard.
5. **Lazy-load heavy components.** Do not block initial load.
6. **Optimize Core Web Vitals for frontend.**

## Verification

- [ ] Have you measured before optimizing?
- [ ] Is the optimization targeted at a proven bottleneck?
- [ ] Did you verify the improvement with benchmarks?


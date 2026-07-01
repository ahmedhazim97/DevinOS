---
name: scrollytelling
description: "Engineer scroll-driven interactive websites that remain performant, accessible, and maintainable at production scale. Covers architecture, animation orchestration, rendering strategy, asset pipeline, and operational discipline for scrollytelling experiences."
---

# Skill: Scrollytelling

> Category: Frontend Engineering
> Priority: High

---

## Description

Engineer scroll-driven interactive websites that remain performant, accessible, and maintainable at production scale. This skill covers the architecture, animation orchestration, rendering strategy, asset pipeline, and operational discipline required to ship scrollytelling experiences without sacrificing correctness or user experience.

## Purpose

Transform scroll position into a reliable temporal control signal for animations, 3D scenes, and DOM transitions while keeping 60 FPS on target devices, preserving accessibility, and enabling long-term maintainability.

## Trigger

Use this skill when:

- Building scroll-driven narratives, product showcases, or immersive landing pages.
- Integrating GSAP ScrollTrigger, timelines, pinning, scrub, or snap into a project.
- Combining DOM animations with Three.js, React Three Fiber, or canvas rendering.
- Adding smooth scrolling (Lenis) that must stay synchronized with animation.
- Designing section orchestration, camera choreography, or state synchronization across scroll.
- Optimizing jank, layout shifts, or mobile-specific scroll behavior.
- Deciding between DOM, Canvas, WebGL, or hybrid rendering for a scroll effect.
- Reviewing a scrollytelling implementation for production readiness.

## Context

- Target browsers, devices, and performance budgets.
- Framework choice (vanilla, React, Next.js, Vue, Svelte, etc.) and SSR constraints.
- Smooth-scroll library or native scroll decision.
- 3D engine choice (Three.js, React Three Fiber, Babylon.js, etc.) and asset size.
- Content pipeline: image sequences, video, Lottie, SVG, WebGL textures.
- Accessibility requirements and motion preferences.
- SEO and discoverability requirements for public pages.
- Deployment and CDN strategy for heavy assets.

## When To Use

- The user experience depends on scroll position driving animation progress.
- Multiple sections, layers, or media types must be choreographed against a single scroll timeline.
- Precise control over start/end points, easing, pinning, or snapping is required.
- The project targets modern browsers and has budget for animation complexity.

## When NOT To Use

- The effect is a simple fade-in or parallax that CSS scroll-driven animations can handle natively.
- The target audience predominantly uses low-end devices or has strict motion-sensitivity requirements.
- The content must remain fully functional without JavaScript or with minimal bundle size.
- The timeline is too short to justify the engineering and asset overhead.

## Required Technologies

- **Animation engine:** GSAP core, ScrollTrigger, Timeline, optional Observer, Snap.
- **Rendering:** DOM, Canvas 2D, WebGL (Three.js, React Three Fiber), or a hybrid combination.
- **Smooth scroll:** Lenis (recommended) or GSAP ScrollSmoother.
- **Build tools:** Modern bundler with code-splitting and tree-shaking (Vite, webpack, Next.js, etc.).
- **Framework integration:** React, Next.js, Vue, or Svelte with appropriate client-only lifecycle hooks.
- **Media optimization:** Image compression, video transcoding, texture compression, lazy loading.
- **Monitoring:** Lighthouse, Web Vitals, DevTools Performance panel, real-device profiling.

## Architecture Overview

A production scrollytelling system is composed of five layers:

1. **Scroll source layer:** Native scroll, smooth-scroll library (Lenis), or custom scroller. This layer produces the single source of truth for scroll progress.
2. **ScrollTrigger layer:** Maps scroll progress to animation progress, handles pinning, scrubbing, snapping, and callbacks. Synchronizes with the scroll source via `scrollerProxy` when smooth scroll is used.
3. **Animation orchestration layer:** GSAP timelines and tweens that choreograph DOM elements, canvas state, or 3D camera parameters. Each section owns its timeline; a master timeline coordinates sections only when absolutely necessary.
4. **Rendering layer:** DOM transforms, Canvas 2D draws, or WebGL render calls. The layer is chosen per section based on complexity, interaction, and asset type.
5. **Asset and loading layer:** Lazy loading, code splitting, preloading critical assets, and decoding images off the main thread.

Keep these layers decoupled. The scroll source should not know about the renderer; the renderer should consume progress values from the animation layer, not directly from scroll events.

## Decision Tree

```
1. Does the effect need scroll progress to drive animation?
   ├── No → Use CSS transitions or CSS scroll-driven animations.
   └── Yes → Continue.

2. Is the effect simple (single element, transform/opacity only, no pinning)?
   ├── Yes → CSS scroll-driven animation or minimal ScrollTrigger scrub.
   └── No → Continue.

3. Is React / Next.js / Vue / Svelte in use?
   ├── Yes → Use framework-specific lifecycle hooks (useGSAP, useEffect cleanup,
   │          client-only imports). Invoke Frontend and React/Vue/Svelte skills.
   └── No → Use vanilla GSAP with gsap.context() and explicit cleanup.

4. Is smooth scrolling required?
   ├── Yes → Use Lenis + ScrollTrigger.scrollerProxy() + ScrollTrigger.update.
   │          Invoke Performance skill to audit rAF and ticker loops.
   └── No → Use native scroll; register ScrollTrigger once.

5. Does the section contain 3D or heavy canvas rendering?
   ├── Yes → Use Three.js / React Three Fiber. Drive camera and scene via GSAP
   │          on Three.js object properties or a shared progress value.
   │          Invoke Architecture and Performance skills.
   └── No → Continue with DOM animation.

6. Is pinning required?
   ├── Yes → Pin the section wrapper, animate children. Verify pinSpacing,
   │          anticipatePin on mobile, and ScrollTrigger.refresh() on layout change.
   └── No → Use scrub without pin for safer mobile behavior.

7. Is snapping required?
   ├── Yes → Implement snap globally or per pinned section. Avoid snap during
   │          free scrolling regions. Test on touch devices.
   └── No → Continue.

8. Does the project target public SEO or accessibility-critical pages?
   ├── Yes → Implement prefers-reduced-motion, static fallbacks, semantic HTML,
   │          and SSR-friendly content. Invoke Accessibility and Frontend skills.
   └── No → Still implement reduced-motion support as a baseline.

9. Are there performance issues or jank?
   ├── Yes → Invoke Performance and Debugging skills. Profile GPU, JS, and layout.
   └── No → Run verification checklist before deployment.
```

## Engineering Principles

1. **Single source of scroll truth.** All animations derive progress from one ScrollTrigger or shared progress value. Never split scroll handling between multiple listeners that can drift.
2. **Animate children, not pinned parents.** When pinning, pin the section wrapper and animate its children. Animating the pinned element itself causes layout inconsistencies and stacking-context bugs.
3. **Transforms and opacity first.** Only animate properties that the compositor can handle (`x`, `y`, `scale`, `rotation`, `opacity`, `filter`). Layout properties (`width`, `height`, `top`, `left`) trigger reflow and should be avoided.
4. **Ease "none" for scrubbed motion.** Scroll-driven progress maps linearly to scroll position. Easing on scrubbed animations creates a laggy, disconnected feel. Reserve easing for triggered, non-scrubbed animations.
5. **Client-only lifecycle.** GSAP, ScrollTrigger, Lenis, and Three.js run in the browser. Never execute them during SSR. Use dynamic imports or framework client hooks to isolate them.
6. **Explicit cleanup.** Every ScrollTrigger, timeline, Observer, smooth-scroll instance, and event listener must be killed or reverted on unmount, route change, or media-query exit. Stray instances cause memory leaks and updates on detached nodes.
7. **Responsive and motion-aware.** Use `gsap.matchMedia()` for breakpoints and `prefers-reduced-motion`. Reduced-motion users must receive a static or simplified equivalent, not a broken animation.
8. **Progressive enhancement.** Core content and navigation must work without scroll animation. Animations are a layer, not a gate.
9. **Asset-before-code optimization.** Compress images, transcode videos, use texture compression, and lazy-load before rewriting animation logic. The biggest performance gains usually come from the asset pipeline.
10. **Measure before optimizing.** Profile with DevTools Performance, Lighthouse, and real devices. Do not guess the bottleneck.

## Implementation Workflow

1. **Define the narrative beat map.** List every section, its in-point, out-point, pinned duration, and the assets or DOM elements that change. Use start/end values relative to the trigger or section height.
2. **Choose the rendering strategy per section.** DOM for text and UI, Canvas for image sequences, WebGL for 3D or heavy shader effects. Document the decision in code comments or ADR.
3. **Set up the scroll source.** Register ScrollTrigger once. If using Lenis, configure `scrollerProxy`, wire `lenis.on('scroll', ScrollTrigger.update)`, and add `lenis.raf` to `gsap.ticker`. Disable lag smoothing with `gsap.ticker.lagSmoothing(0)`.
4. **Build section timelines.** Create one GSAP timeline per section. Attach ScrollTrigger to the timeline or top-level tween, never to child tweens. Use labels for readable sequencing.
5. **Implement pinning and scrubbing.** Pin section wrappers, animate children. Use `pinSpacing: true` unless layout is handled separately. Set `scrub: true` for direct scroll linkage or a small number for smooth catch-up.
6. **Add snap where required.** Snap only within pinned sections or at defined progress points. Avoid global snap over content that users expect to read freely.
7. **Integrate 3D or canvas.** Expose a shared progress value from ScrollTrigger `onUpdate` and consume it in the render loop. Do not read `window.scrollY` directly inside the render loop.
8. **Wire responsive and reduced-motion behavior.** Use `gsap.matchMedia()` to create different timelines per breakpoint or to disable animation. Revert matchMedia on unmount.
9. **Load and decode assets lazily.** Use IntersectionObserver or ScrollTrigger callbacks to load images, videos, and 3D models just before they enter the viewport. Decode images off the main thread when possible.
10. **Add debugging markers.** Enable `markers: true` in development. Remove them for production. Log timeline progress and ScrollTrigger start/end positions during integration.
11. **Clean up and verify.** Kill all ScrollTriggers, timelines, Observers, and smooth-scroll instances on unmount. Run the verification checklist.

## Performance Rules

1. **Use `will-change` only on active elements.** Apply it before animation starts, remove it after. Never apply globally or to hundreds of elements.
2. **Limit simultaneous tweens.** Batch with `stagger` or timelines. Avoid creating hundreds of independent ScrollTriggers.
3. **Avoid layout thrashing.** Read layout values in one pass, write in the next. Let GSAP batch property updates.
4. **Use `gsap.quickTo()` for frequent updates.** Mouse followers, scroll-velocity indicators, or live scrub values should reuse a single tween rather than creating new ones each frame.
5. **Pin sparingly.** Each pin creates a spacer and promotes the element to `position: fixed`. On mobile, prefer `scrub` without `pin` unless the experience literally requires a full-viewport freeze.
6. **Set `refreshPriority` for out-of-order creation.** When ScrollTriggers are created dynamically or asynchronously, assign lower numbers to earlier sections so refresh recalculates in page order.
7. **Throttle resize and refresh.** `ScrollTrigger.refresh()` is called automatically on resize, but call it manually only after layout changes and debounce when possible.
8. **Optimize canvas and WebGL.** Limit draw calls, use instancing, use compressed textures, avoid per-frame geometry creation, and cap pixel ratio on high-DPI mobile devices.
9. **Lazy-load below-the-fold assets.** Use `loading="lazy"` for images, split image sequences into chunks, and defer non-critical 3D models.
10. **Keep the main thread free.** Move decoding, parsing, and heavy setup into Web Workers, `requestIdleCallback`, or async chunks.

## Debugging Workflow

1. **Reproduce consistently.** Note the exact browser, device, scroll speed, and viewport size where jank occurs.
2. **Enable markers.** Use `markers: true` to confirm start/end positions and whether they shift after async content loads.
3. **Check console for warnings.** GSAP warns about common mistakes such as missing plugin registration, invalid selectors, or tweens on detached elements.
4. **Profile with DevTools Performance.** Look for long JS tasks, layout thrashing, forced reflow, and excessive GPU memory.
5. **Isolate the section.** Disable all but one ScrollTrigger to confirm which section causes the issue.
6. **Verify scroll synchronization.** If using smooth scroll, confirm `ScrollTrigger.update` is called on every Lenis scroll event and that `gsap.ticker.lagSmoothing(0)` is set.
7. **Test reduced-motion path.** Ensure the page is still usable when animations are disabled.
8. **Inspect the DOM.** Check for pin spacers, extra stacking contexts, and inline styles left behind after cleanup.
9. **Measure on real hardware.** Emulators miss GPU limits, thermal throttling, and mobile browser scroll quirks.
10. **Document the fix.** Add a comment or memory entry explaining why the fix works.

## Testing Strategy

1. **Unit tests for utilities.** Test helpers that convert scroll progress to animation values, decode asset metadata, or manage media-query state.
2. **Component tests for isolated animations.** Render a section with GSAP disabled and verify the static DOM is accessible and correct. Then test with GSAP in a headless browser.
3. **Visual regression tests.** Capture screenshots of key scroll positions and compare across builds. Tools: Playwright, Chromatic, or Percy.
4. **Performance budgets.** Define budgets for Largest Contentful Paint (LCP), Total Blocking Time (TBT), Cumulative Layout Shift (CLS), and custom FPS metrics. Fail CI if budgets are exceeded.
5. **Device lab testing.** Test on a representative low-end Android device, an iPhone, and a desktop browser. Include touch, keyboard, and reduced-motion tests.
6. **Accessibility audits.** Run axe-core or Lighthouse accessibility checks with animations enabled and disabled. Verify focus order and skip links.
7. **E2E scroll tests.** Use Playwright or Cypress to scroll through each section and assert that elements reach expected states and that no errors are thrown.
8. **Load and stress tests.** Simulate slow networks and low memory to confirm lazy loading and cleanup behavior.

## Examples

### Good: Pinned section with child animations

```javascript
// Pin the section wrapper, animate the children inside it.
// This keeps the pinned element stable and avoids stacking-context issues.
const section = gsap.timeline({
  scrollTrigger: {
    trigger: ".pinned-section",
    start: "top top",
    end: "+=1200",
    pin: ".pinned-section",
    scrub: 1,
    anticipatePin: 1,
    refreshPriority: 1,
  },
});

section
  .to(".pinned-section .headline", { y: 0, autoAlpha: 1 }, 0)
  .to(".pinned-section .visual", { scale: 1, rotation: 0 }, 0.2)
  .to(".pinned-section .cta", { y: 0, autoAlpha: 1 }, 0.8);
```

### Bad: Animating the pinned element itself

```javascript
// DO NOT do this. Animating the pinned element causes layout drift,
// broken pin spacers, and inconsistent mobile behavior.
gsap.to(".pinned-section", {
  x: 200,
  scrollTrigger: {
    trigger: ".pinned-section",
    start: "top top",
    end: "+=1200",
    pin: true,
    scrub: true,
  },
});
```

### Good: Shared progress for Three.js camera

```javascript
// ScrollTrigger writes progress to a shared value;
// the render loop consumes it without touching the DOM per frame.
let cameraProgress = 0;

ScrollTrigger.create({
  trigger: ".webgl-section",
  start: "top top",
  end: "bottom bottom",
  scrub: true,
  onUpdate: (self) => { cameraProgress = self.progress; },
});

function render() {
  camera.position.z = gsap.utils.interpolate(5, 1, cameraProgress);
  renderer.render(scene, camera);
}
```

## Common Mistakes

- Putting ScrollTrigger on a child tween inside a timeline instead of the timeline itself.
- Using `scrub` and `toggleActions` on the same trigger.
- Forgetting to call `ScrollTrigger.refresh()` after images, fonts, or dynamic content change layout.
- Animating `width`, `height`, `top`, or `left` instead of transform aliases.
- Leaving `markers: true` in production.
- Creating ScrollTriggers in random order without `refreshPriority`.
- Running GSAP, ScrollTrigger, or Lenis during SSR.
- Skipping cleanup on route change or component unmount.
- Reading `window.scrollY` directly inside a render loop instead of consuming a GSAP progress value.
- Applying `will-change` globally or to elements that never animate.

## Anti-Patterns

- **Tutorial-driven copy-paste.** Copying example code without adapting architecture, cleanup, and responsive behavior to the project.
- **One giant timeline.** A single master timeline across many sections becomes brittle and hard to refresh. Use section timelines with coordination only where needed.
- **Scroll hijacking for decoration.** Smooth scroll and snap should serve the content, not replace it. Avoid making the page feel unresponsive or uncontrollable.
- **Assuming desktop performance equals mobile performance.** Effects that run at 60 FPS on a developer laptop can drop to 20 FPS on a budget phone. Profile on target hardware.
- **Ignoring reduced-motion.** Motion sensitivity is not optional. Always provide a usable fallback.
- **Coupling asset loading to animation setup.** Do not block animation initialization on heavy asset downloads. Load lazily and show progress or loading states.
- **Hardcoded durations in pixels.** Use relative ScrollTrigger distances (`+=100%`, `+=1200`) and function-based values so the experience adapts to viewport size.

## Production Best Practices

1. **Register plugins once and guard against SSR.** Register GSAP plugins in a client-only entry file or inside a client hook. Never call `gsap.registerPlugin` during server render.
2. **Use `useGSAP` in React or `gsap.context()` with cleanup.** In React, prefer `@gsap/react` `useGSAP()` with `scope` and `revertOnUpdate`. In other frameworks, wrap GSAP setup in `gsap.context()` and call `ctx.revert()` on unmount.
3. **Scope selectors.** Always pass a container ref or element to `useGSAP` or `gsap.context()` so selectors like `.box` do not leak into sibling components.
4. **Implement reduced-motion at the architecture level.** Use `gsap.matchMedia()` with `(prefers-reduced-motion: reduce)`. For reduced motion, skip timelines, set final states, or show static equivalents.
5. **Lazy-load and code-split heavy sections.** Use dynamic imports for WebGL sections, video players, and complex canvases. Split ScrollTrigger setup per section if needed.
6. **Preload critical assets, defer the rest.** Preload the first visible image sequence or 3D model. Defer below-the-fold assets until the section approaches the viewport.
7. **Optimize assets before writing fallbacks.** Compress images, use WebP/AVIF, transcode video to H.264 and HEVC, compress textures with KTX2/Basis, and limit audio bitrate.
8. **Set performance budgets in CI.** Enforce LCP, TBT, CLS, and JavaScript bundle limits. Run Lighthouse and Web Vitals checks on every pull request.
9. **Deploy with cache and CDN strategy.** Serve static assets from a CDN with immutable cache headers. Use HTTP/2 or HTTP/3 and preconnect to asset origins.
10. **Monitor real users.** Capture Core Web Vitals and FPS telemetry in production. Set alerts for regressions.

## Optimization Checklist

- [ ] Only transform and opacity properties are animated on the hot path.
- [ ] `will-change` is applied selectively and removed after animation.
- [ ] Pinned sections are wrappers; children are animated.
- [ ] Scrubbed animations use `ease: "none"`.
- [ ] `ScrollTrigger.refresh()` is called after layout changes and debounced.
- [ ] Smooth scroll is synchronized via `scrollerProxy` and `ScrollTrigger.update`.
- [ ] Canvas/WebGL draw calls are minimized and capped by device pixel ratio.
- [ ] Images and videos are lazy-loaded and optimized.
- [ ] 3D models and textures are compressed and loaded on demand.
- [ ] `gsap.matchMedia()` handles breakpoints and reduced motion.
- [ ] Cleanup kills all ScrollTriggers, timelines, Observers, and smooth-scroll instances.
- [ ] Markers are removed in production.
- [ ] The page is usable with reduced motion enabled.
- [ ] Bundle size is measured and code-split for heavy sections.

## Cross Skill References

- **Frontend Engineering:** Component structure, responsive design, loading states, and accessibility baseline.
- **Performance Optimization:** Profiling, bottlenecks, Core Web Vitals, and performance budgets.
- **Architecture:** Layer separation, single source of truth, and decoupling scroll source from renderer.
- **Planning:** Beat maps, section decomposition, and risk assessment for complex scroll experiences.
- **Debugging:** Systematic reproduction, isolation, and DevTools profiling.
- **Testing:** Visual regression, E2E scroll tests, and device lab testing.
- **UI/UX Pro Max:** Motion design, animation rhythm, and user-centered transitions.
- **Code Review:** Reviewing scrollytelling PRs for cleanup, performance, and accessibility.
- **Documentation:** Recording decisions, ADRs, and performance results.
- **Quality Audit:** Validating this skill and any assets produced with it.

## Stress Test Scenarios

1. **Simple case:** A single pinned hero section with a headline fade and image scale. Must pass with minimal JS, no 3D, and a single timeline.
2. **Complex case:** A multi-section product page with DOM, Canvas, and WebGL sections, smooth scroll, global snap, and responsive breakpoints. Must remain stable across sections.
3. **Edge case:** Zero content height, missing images, or extremely fast scroll. Must not throw errors and must degrade gracefully.
4. **Legacy codebase:** Integrating scrollytelling into an existing site with jQuery, global styles, and no component boundaries. Must isolate selectors and cleanup without breaking existing code.
5. **Greenfield project:** Building from scratch with React or Next.js. Must establish the scroll architecture before adding effects.
6. **Multi-language repository:** Content direction changes (RTL). Must flip horizontal scroll and transform directions consistently.
7. **Low-end device:** A budget Android phone or old iPhone. Must maintain 30 FPS minimum or disable heavy effects automatically.
8. **Reduced-motion user:** System preference enabled. Must show static content without jarring jumps.
9. **Slow network:** Large image sequences or videos. Must show loading states and progressively load.
10. **Route change:** SPA navigation. Must kill all instances and reset scroll position to avoid cross-page leaks.

## Prompt Templates

### When planning a scrollytelling page

```
I need to build a scroll-driven page with [number] sections. The sections are: [list].
Target framework: [framework]. Target devices: [devices]. Smooth scroll: [yes/no].
3D/WebGL: [yes/no]. Accessibility level: [WCAG target].

Create a beat map, choose rendering strategies per section, define the ScrollTrigger
architecture, and list performance budgets and risks.
```

### When debugging jank

```
My scroll-driven page stutters on [device/browser]. Markers are [enabled/disabled].
Pinned sections: [number]. Smooth scroll: [library]. 3D sections: [yes/no].

Run the debugging workflow: identify the bottleneck, isolate the section, check scroll
synchronization, and recommend the minimal fix.
```

### When reviewing a scrollytelling implementation

```
Review this scroll-driven code for: correct ScrollTrigger placement, cleanup, reduced-motion
support, mobile behavior, asset loading, and performance. Flag any anti-patterns and suggest
concrete fixes.
```

## Output Contract

When this skill is active, produce:

- A clear architecture decision for scroll source, animation orchestration, and rendering layers.
- Section-by-section beat map with start, end, pin, and scrub decisions.
- Code that follows framework-specific client-only lifecycle rules and includes explicit cleanup.
- Reduced-motion and responsive handling using `gsap.matchMedia()`.
- Asset loading strategy with lazy loading and loading states.
- Performance budget targets and verification commands.
- Cross-references to other DevinOS skills when relevant.

Do not produce:

- Copied examples from repositories or tutorials.
- Project-specific implementation details without first confirming the project context.
- Code that runs GSAP or ScrollTrigger during SSR.
- Animations that rely on layout properties without justification.

## Verification Checklist

- [ ] Purpose is clear: scroll-driven interactive websites at production scale.
- [ ] All required sections from the DevinOS skill template are present.
- [ ] No duplicated concepts from Frontend, Performance, or UI/UX Pro Max skills.
- [ ] Framework-agnostic when possible; framework-specific guidance is explicitly labeled.
- [ ] No project-specific code or copied examples from primary sources.
- [ ] Examples are reusable engineering patterns, not tutorials.
- [ ] Anti-patterns and common mistakes are specific and actionable.
- [ ] Performance, accessibility, and mobile considerations are covered.
- [ ] Cross-skill references are included and relevant.
- [ ] Stress test scenarios cover simple, complex, edge, legacy, greenfield, multi-language, mobile, reduced-motion, slow network, and route-change cases.

## References

- [GSAP](https://gsap.com/)
- [GSAP ScrollTrigger](https://gsap.com/docs/v3/Plugins/ScrollTrigger/)
- [GSAP Observer](https://gsap.com/docs/v3/Plugins/Observer/)
- [GSAP AI Skills](https://github.com/greensock/gsap-skills)
- [BSMNT Scrollytelling](https://github.com/basementstudio/scrollytelling)
- [Lenis](https://github.com/darkroomengineering/lenis)
- [Hyperframes](https://github.com/heygen-com/hyperframes)
- [WCAG 2.2 Understanding Animation from Interactions](https://www.w3.org/WAI/WCAG22/Understanding/animation-from-interactions.html)
- [prefers-reduced-motion on MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/At-rules/@media/prefers-reduced-motion)
- [Core Web Vitals](https://web.dev/vitals/)
- [DevinOS Engineering Constitution](/ENGINEERING_CONSTITUTION.md)
- [DevinOS Quality Rule](/.agents/rules/quality.md)

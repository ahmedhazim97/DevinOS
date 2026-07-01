---
name: react-three-drei
description: "Use @react-three/drei helpers and abstractions with @react-three/fiber to build performant, accessible, and maintainable 3D scenes in React."
---

# Skill: React Three Drei

> Category: Frontend Engineering
> Priority: High

---

## Description

Use `@react-three/drei` helpers and ready-made abstractions with `@react-three/fiber` to build interactive 3D scenes in React. This skill covers when to reach for drei, how to choose the right component category, and how to keep scenes performant, accessible, and maintainable.

## Purpose

Reduce the time and complexity of building 3D React applications by using the correct drei component for cameras, controls, loading, gizmos, shapes, shaders, and staging. Prevent common mistakes like bundle bloat, SSR breakage, and memory leaks.

## Trigger

Use this skill when:

- Building a 3D scene or experience with React Three Fiber.
- Needing a ready-made camera, control, loader, gizmo, shape, or shader.
- Integrating 3D content with scrollytelling, dashboards, or product configurators.
- Deciding whether to use a drei abstraction or write a custom Three.js solution.
- Reviewing a React Three Fiber project for performance and correctness.

## Context

- React / Next.js project with `@react-three/fiber` installed.
- `@react-three/drei` installed via `npm install @react-three/drei`.
- Target device performance (desktop vs mobile, low-end GPU).
- SSR requirements and client-only lifecycle constraints.
- Need for React Native support (`@react-three/drei/native`).
- Cross-skill needs: Frontend, Performance, Scrollytelling, UI/UX Pro Max.

## Workflow

1. **Install dependencies.** Add `@react-three/fiber` and `@react-three/drei` to the project.
2. **Set up the Canvas.** Wrap the 3D scene in `<Canvas>` from `@react-three/fiber`.
3. **Choose the camera.** Use `PerspectiveCamera`, `OrthographicCamera`, or `CubeCamera` from drei instead of raw Three.js cameras.
4. **Add controls.** Pick `OrbitControls`, `ScrollControls`, `PresentationControls`, or `CameraControls` based on interaction needs.
5. **Load assets.** Use `useGLTF`, `useTexture`, `useVideoTexture`, or `Environment` for models, textures, and lighting.
6. **Build the scene.** Add shapes, abstractions, gizmos, or shaders as needed. Keep component usage intentional.
7. **Optimize performance.** Limit draw calls, use `instancedMesh`, lazy-load heavy assets, and cap pixel ratio on mobile.
8. **Implement cleanup.** Dispose helpers, controls, and event listeners on unmount.
9. **Verify.** Run the verification checklist before declaring the feature complete.

## Examples

### Good: Minimal scene with camera and controls

```jsx
import { Canvas } from '@react-three/fiber'
import { PerspectiveCamera, OrbitControls } from '@react-three/drei'

export default function Scene() {
  return (
    <Canvas>
      <PerspectiveCamera makeDefault position={[0, 0, 5]} />
      <OrbitControls />
      <ambientLight intensity={0.5} />
      <mesh>
        <boxGeometry />
        <meshStandardMaterial color="orange" />
      </mesh>
    </Canvas>
  )
}
```

### Good: Loading a model with error handling

```jsx
import { useGLTF } from '@react-three/drei'

function Model({ url }) {
  const { scene } = useGLTF(url)
  return <primitive object={scene} />
}

useGLTF.preload('/model.glb')
```

### Bad: Importing the full drei bundle

```jsx
// Do not do this. It breaks tree-shaking and inflates the bundle.
import * as Drei from '@react-three/drei'
```

## Anti-patterns

- Importing the entire drei namespace instead of named imports.
- Using web-only components (`Html`, `Loader`) in a React Native project.
- Creating new Three.js objects inside the render loop every frame.
- Running drei components during SSR without client-only guards.
- Loading heavy assets synchronously without preloading or lazy loading.
- Ignoring cleanup for controls, textures, and event listeners.
- Combining multiple UI/UX design systems without clear ownership.

## Common Mistakes

- Forgetting `makeDefault` on `PerspectiveCamera` so the camera is ignored.
- Using `OrbitControls` without limiting target or damping, causing jerky UX.
- Loading textures in every component instance instead of sharing or preloading.
- Neglecting `prefers-reduced-motion` for animated 3D content.
- Not testing on real mobile devices with lower GPU limits.

## Performance Rules

- Use named imports to keep tree-shaking effective.
- Preload critical assets with `useGLTF.preload`, `useTexture.preload`, etc.
- Use `instancedMesh` for many repeated objects.
- Cap device pixel ratio on mobile with `dpr={[1, 2]}` on `Canvas`.
- Lazy-load heavy sections with dynamic imports and `Suspense`.
- Avoid unnecessary re-renders; keep stable references for Three.js objects.

## Verification

- [ ] `@react-three/fiber` and `@react-three/drei` are installed.
- [ ] Named imports are used instead of the full namespace.
- [ ] Camera and controls are configured correctly.
- [ ] Assets are preloaded or lazy-loaded.
- [ ] Components are client-only and SSR-safe.
- [ ] Cleanup is implemented on unmount.
- [ ] Performance is verified on target devices.
- [ ] Reduced-motion and accessibility fallbacks are considered.
- [ ] Cross-skill references are used when relevant (Scrollytelling, Performance, Frontend).

## Cross Skill References

- **Frontend Engineering:** React lifecycle, component structure, responsive design.
- **Scrollytelling:** Scroll-driven 3D camera choreography and pinning.
- **Performance Optimization:** Profiling, draw calls, texture optimization, budgets.
- **UI/UX Pro Max:** Motion design, animation rhythm, accessibility.
- **Documentation:** Recording 3D decisions, ADRs, and performance results.
- **Quality Audit:** Validating this skill and any assets produced with it.

## References

- `@react-three/drei` docs: https://pmndrs.github.io/drei
- `@react-three/fiber` docs: https://docs.pmndrs.rs/react-three-fiber
- Repository: https://github.com/pmndrs/drei
- `data/readme.md` — latest README from pmndrs/drei
- `data/docs/` — latest MDX documentation from pmndrs/drei
- `LICENSE` — MIT license of pmndrs/drei

---
name: uikit
description: "Use uikit from the pmndrs ecosystem."
---

# Skill: Uikit

> Category: Frontend Engineering
> Priority: High

---

## Description

<h1 align="center">uikit</h1> This skill provides the essential guidance, workflow, anti-patterns, and verification checklist needed to use Uikit correctly within the pmndrs ecosystem and within DevinOS projects.

## Purpose

Reduce implementation risk and accelerate development by applying the correct patterns, configuration, and integration steps for Uikit. The goal is to produce code that is performant, maintainable, and aligned with the official documentation.

## Trigger

Use this skill when:

- Building a feature that depends on Uikit.
- Deciding whether Uikit is the right tool for the current architecture.
- Reviewing, debugging, or refactoring code that uses Uikit.
- Integrating Uikit with other pmndrs libraries or React patterns.
- Setting up a new project or adding the library to an existing project.
- Evaluating performance, accessibility, or SSR implications of Uikit.

## Context

- Project framework, version, and build tooling.
- Target devices and performance budgets (desktop, mobile, VR/AR).
- Related libraries already in use (React, Three.js, state managers, animation libraries).
- Client-only versus SSR constraints.
- Existing component structure and coding standards.
- Need for TypeScript types, tests, and documentation.
- License and compatibility requirements.

## Workflow

1. Confirm the problem or feature that requires Uikit.
2. Review the official documentation and the data files in this skill.
3. Install the library using the recommended package manager and version.
4. Configure the library according to the project setup and constraints.
5. Build a minimal working example that proves the integration.
6. Expand the example into production-ready components with error handling.
7. Run the verification checklist, including performance and accessibility checks.
8. Document decisions, trade-offs, and any deviations from the official docs.
9. Clean up temporary code, remove unused imports, and ensure proper disposal.

## Examples

### Good: Minimal usage

`js
// See data/readme.md and data/docs/ for exact API details.
import * as Lib from 'uikit'

// Initialize the library according to its documented pattern.
const instance = Lib.createSetup()

// Use it within a React component or module.
`

### Bad: Unverified copy-paste

`js
// Do not copy examples without confirming they match your project version and setup.
const instance = Lib.createSetup({ wrongOption: true })
`

## Anti-patterns

- Using Uikit without understanding its primary use case and trade-offs.
- Combining it with incompatible libraries or conflicting state patterns.
- Skipping cleanup, ignoring SSR constraints, or leaking resources on unmount.
- Ignoring performance implications on low-end or mobile devices.
- Copying examples from documentation without adapting them to the project.
- Hardcoding configuration that should be environment-specific or shared.
- Neglecting error handling, loading states, and fallback behavior.

## Common Mistakes

- Installing the wrong version or missing peer dependencies.
- Forgetting to wrap client-only code in the appropriate lifecycle hooks.
- Creating new instances inside render loops or event handlers without memoization.
- Not testing on target devices or with reduced-motion preferences enabled.
- Mixing multiple solutions from the same domain without clear ownership.

## Verification

- [ ] The library is installed with correct version and peer dependencies.
- [ ] Usage matches the official documentation and data files in this skill.
- [ ] A minimal working example has been implemented and verified.
- [ ] Performance is acceptable on target devices.
- [ ] SSR and client-only constraints are respected.
- [ ] Cleanup and disposal are handled correctly.
- [ ] Error handling and loading states are in place.
- [ ] Cross-skill references are used when relevant (Frontend, Performance, React Three Drei).
- [ ] Documentation is updated with decisions and trade-offs.

## Cross Skill References

- **Frontend Engineering:** React lifecycle, component structure, responsive design.
- **Performance Optimization:** Profiling, budgets, and optimization.
- **React Three Drei:** When building 3D scenes with pmndrs tools.
- **Scrollytelling:** When scroll-driven experiences need 3D or animation.
- **Documentation:** Recording decisions, ADRs, and performance results.
- **Quality Audit:** Validating this skill and any assets produced with it.

## References

- Repository: https://github.com/pmndrs/uikit
- data/readme.md â€” latest README from Uikit
- data/docs/ â€” latest documentation from Uikit
- LICENSE â€” license of Uikit
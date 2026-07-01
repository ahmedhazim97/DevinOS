---
name: frontend
description: "Build responsive, accessible, and performant user interfaces."
---

# Skill: Frontend Engineering
> Category: Frontend
> Priority: High

---

## Description

Build responsive, accessible, and performant user interfaces.

## Purpose

Deliver excellent user experiences across all devices and abilities.

## Trigger

Use this skill when:
- Building a new UI component
- Adding a page or feature
- Optimizing frontend performance
- Ensuring accessibility compliance
- Reviewing frontend code

## Context

- Target browsers and devices
- Design system in use
- State management approach
- Build tooling

## Workflow

1. **Responsive First** - Design for mobile, enhance for desktop.
2. **Accessibility** - WCAG 2.1 AA minimum:
   - Proper heading hierarchy
   - Alt text for images
   - Keyboard navigability
   - Focus indicators
   - ARIA labels where needed
3. **Performance** - Optimize Core Web Vitals:
   - Lazy load images and heavy components
   - Code split routes
4. **State Management** - Keep it simple. Avoid prop drilling.
5. **Error Boundaries** - Catch and handle errors gracefully.
6. **Loading States** - Show feedback for all async operations.
7. **Testing** - Component tests, accessibility tests, visual regression.

## Examples

### Good Component

```tsx
interface ButtonProps {
  children: React.ReactNode;
  onClick: () => void;
  variant?: "primary" | "secondary";
  disabled?: boolean;
  ariaLabel?: string;
}

export function Button({
  children,
  onClick,
  variant = "primary",
  disabled = false,
  ariaLabel,
}: ButtonProps) {
  return (
    <button
      type="button"
      onClick={onClick}
      disabled={disabled}
      aria-label={ariaLabel}
      className={`btn btn--${variant}`}
    >
      {children}
    </button>
  );
}
```

### Bad Component

```tsx
function MyButton(props) {
  return <button onClick={props.click}>{props.text}</button>;
}
```

## Anti-patterns

- Inline styles for everything
- No loading states
- Missing alt text
- Inline event handlers with complex logic
- Not handling errors

## Verification

- [ ] Is the UI responsive?
- [ ] Does it meet WCAG 2.1 AA?
- [ ] Are Core Web Vitals optimized?
- [ ] Are errors handled gracefully?

## References

- [Web Content Accessibility Guidelines](https://www.w3.org/WAI/WCAG21/quickref/)
- [Core Web Vitals](https://web.dev/vitals/)


---



---
name: design-resources-library
description: "Curated design systems, component libraries, and UI resources for building professional interfaces. Companion to ui-ux-pro-max for implementation guidance."
---

# Design Resources Library

Curated collection of production-ready UI libraries, component systems, design resources, and implementation guidance. This skill works as a **team member** with `ui-ux-pro-max`:

- **ui-ux-pro-max**: decides *what* to design (style, palette, typography, UX rules).
- **design-resources-library**: decides *how* to build it (which library, which component, which resource).

## When to Use

Use this skill when the task involves:
- Choosing a UI library or component system for a project
- Implementing specific components (buttons, tables, forms, charts, navigation)
- Finding design resources: icons, fonts, illustrations, colors, mockups
- Selecting a design system or style guide for an enterprise project
- Comparing libraries to pick the best fit for a stack

## Workflow with ui-ux-pro-max

```
1. ui-ux-pro-max: decide product type, style, color palette, typography
2. design-resources-library: pick the best library/stack and components
3. Combine: implement the design using the chosen library
```

## Component Selection Guide

### Actions
| Component | Best Library | Use Case |
|-----------|-------------|----------|
| Button | shadcn/ui | Primary/secondary CTAs; Tailwind customization |
| Button Group | Material UI | Grouped related actions |
| Icon | shadcn/ui + Lucide | Consistent iconography |

### Data Display
| Component | Best Library | Use Case |
|-----------|-------------|----------|
| Table | Ant Design | Data-heavy admin with sorting/filtering |
| Card | shadcn/ui | Content containers; dashboards |
| Badge | shadcn/ui | Status indicators; counts |
| Statistic | Ant Design | KPI numbers and metrics |

### Forms
| Component | Best Library | Use Case |
|-----------|-------------|----------|
| Input/Textarea | shadcn/ui | Standard form fields |
| Select | shadcn/ui | Dropdown selection |
| Date Picker | Ant Design | Date/time selection |
| Form (validation) | shadcn/ui + React Hook Form | Complete forms with validation |
| File Upload | Ant Design | File attachments |

### Navigation
| Component | Best Library | Use Case |
|-----------|-------------|----------|
| Menu | shadcn/ui | Primary navigation |
| Tabs | shadcn/ui | Content switching |
| Breadcrumb | shadcn/ui | Hierarchical path |
| Drawer | shadcn/ui | Side panel navigation |
| Stepper | shadcn/ui | Multi-step workflows |

### Feedback
| Component | Best Library | Use Case |
|-----------|-------------|----------|
| Dialog/Modal | shadcn/ui | Overlay dialogs |
| Toast | shadcn/ui Sonner | Non-blocking notifications |
| Alert | shadcn/ui | Important messages |
| Progress | shadcn/ui | Loading indicators |
| Skeleton | shadcn/ui | Content loading placeholders |

### Layout
| Component | Best Library | Use Case |
|-----------|-------------|----------|
| Grid/Layout | Material UI | Complex responsive layouts |
| Card | shadcn/ui | Content containers |
| Accordion | shadcn/ui | Collapsible sections |
| Resizable | shadcn/ui | Resizable panels |

## Library Comparison

| Library | Best For | Stack | Style |
|---------|----------|-------|-------|
| shadcn/ui | Modern accessible apps; Tailwind-first | React/Next.js | Customizable minimal |
| Ant Design | Enterprise dashboards; data-heavy apps | React | Enterprise polished |
| Material UI | Google Material Design; rapid prototyping | React | Material Design |
| Chakra UI | Developer-friendly; accessible defaults | React | Clean minimal |
| Mantine | Full-featured apps with hooks | React | Modern functional |
| HeroUI | Next.js apps with animations | React/Next.js | Modern Tailwind |
| Radix UI | Custom headless primitives | React | Unstyled accessible |
| daisyUI | Tailwind class-based components | HTML/React/Vue | Tailwind |

## Design System Selection

| Project Type | Recommended Design System |
|--------------|---------------------------|
| Enterprise admin | Ant Design / Carbon Design System |
| Modern SaaS | shadcn/ui / HeroUI / Primer |
| Google-style app | Material UI / Material Design 3 |
| Apple ecosystem | Apple Human Interface Guidelines |
| Shopify-style | Polaris |
| Microsoft-style | Fluent UI |
| IBM-style | Carbon Design System |
| Adobe-style | Spectrum |

## Resource Categories

See `data/resources.csv` for a curated list across:
- UI Graphics & Illustrations
- Fonts & Typography Tools
- Color Tools & Palette Generators
- Icons & Logos
- Mockups & Templates
- CSS Frameworks
- UI Component Libraries
- React / Vue / Angular / Svelte Libraries
- Design Systems & Style Guides
- Design Inspiration
- Charts & Animations
- AI Design Tools
- Stock Photos & Image Compression
- Accessibility Tools

## Quick Resource Picks

### Icons
- **Lucide**: default for shadcn/ui; consistent modern icons
- **Heroicons**: Tailwind Labs; clean SVG
- **Phosphor Icons**: flexible weights and styles
- **Tabler Icons**: large free icon set
- **Material Design Icons**: Material-style icons
- **Iconify**: universal icon framework

### Fonts
- **Google Fonts**: free web fonts
- **Fontshare**: quality free fonts
- **FontPair**: font pairing suggestions
- **Fontjoy**: AI font pairing

### Colors
- **Coolors**: palette generator
- **UI Colors**: Tailwind palette generator
- **Happy Hues**: palettes with context
- **Adobe Color**: color wheel and palette tools
- **Material Color Tool**: Material Design palettes

### Illustrations
- **Undraw**: open-source illustrations
- **Drawkit**: illustrations and icons
- **Manypixels**: free illustrations gallery
- **Humaaans**: mix-and-match human illustrations
- **Open Doodles**: hand-drawn illustrations
- **Blush**: customizable illustrations

### Design Inspiration
- **Dribbble**: design community
- **Behance**: creative portfolios
- **Awwwards**: website awards
- **Land Book**: landing page inspiration
- **Page Collective**: landing page gallery

## Integration with ui-ux-pro-max

When both skills are active, follow this sequence:

1. **Start with ui-ux-pro-max** to define:
   - Product type and audience
   - Style (minimalism, glassmorphism, brutalism, etc.)
   - Color palette and typography
   - Layout and responsive behavior
   - Accessibility and UX priorities

2. **Then use design-resources-library** to choose:
   - Component library matching the stack
   - Specific components for each UI element
   - Best resources for icons, fonts, and illustrations
   - Design system if enterprise consistency is needed

3. **Implement** using the combination of design rules and library components.

## Examples

### Good Workflow

User: "Build a SaaS analytics dashboard with Next.js."

Response:
1. Use ui-ux-pro-max to choose: dark mode, minimalism, blue/amber palette, Inter typography.
2. Use design-resources-library to choose: shadcn/ui for Next.js, shadcn/ui Chart for charts, shadcn/ui Table for data, Lucide icons.
3. Implement with Tailwind CSS and shadcn/ui components.

### Bad Workflow

User: "Build a SaaS analytics dashboard with Next.js."

Bad response: mix Material UI with shadcn/ui in the same project without a clear reason. Stick to one library per project.

## Anti-patterns

- Mixing multiple UI libraries in one project without clear ownership
- Choosing a library that doesn't match the team's stack
- Using heavy enterprise libraries for simple landing pages
- Ignoring accessibility requirements of chosen components
- Hardcoding hex colors instead of using the library's theme tokens
- Not checking license compatibility of resources

## Verification

- [ ] Is the chosen library compatible with the project's stack?
- [ ] Does the library support the required accessibility standards?
- [ ] Are the selected components sufficient for the design without mixing libraries?
- [ ] Are all resources (icons, fonts, illustrations) licensed appropriately?
- [ ] Does the implementation follow ui-ux-pro-max design rules?

## References

- `data/components.csv` — component selection guide
- `data/design-systems.csv` — library comparison
- `data/resources.csv` — categorized design resources
- `ui-ux-pro-max` skill — design rules, styles, palettes, UX guidelines
- shadcn/ui: https://ui.shadcn.com
- Ant Design: https://ant.design
- Material UI: https://mui.com/material-ui
- Brad Traversy Design Resources: https://github.com/bradtraversy/design-resources-for-developers

# DevinOS - All Global Skills (40)


---
name: ai-engineering
description: "Build reliable systems that leverage AI while maintaining correctness and transparency."
---

# Skill: AI Engineering
> Category: AI Engineering
> Priority: High

---

## Description

Build reliable systems that leverage AI while maintaining correctness and transparency.

## Purpose

Use AI as a force multiplier without accepting hallucinations or unreliability.

## Trigger

Use this skill when:
- Integrating AI models into applications
- Designing prompt engineering workflows
- Evaluating AI outputs
- Building RAG systems
- Reviewing AI-generated code

## Context

- Model capabilities and limitations
- Latency and cost constraints
- Data privacy requirements
- Hallucination tolerance

## Workflow

1. **Never Trust Blindly** - Every AI output must be verifiable.
2. **Use Structured Outputs** - Constrain model to valid formats.
3. **Implement Fallbacks** - What happens when AI fails?
4. **Version Prompts** - Track prompt changes like code.
5. **Evaluate Systematically** - Test prompts with diverse inputs.
6. **Monitor in Production** - Track success rates, latency, cost.
7. **Human-in-the-Loop** - Require approval for high-stakes decisions.

## Examples

### Good AI Integration

```python
import json
from typing import Optional

class CodeReviewer:
    def review(self, code: str) -> Optional[dict]:
        prompt = self.build_prompt(code)
        response = self.llm.generate(prompt, format="json")
        
        try:
            result = json.loads(response)
            if self.validate_schema(result):
                return result
        except json.JSONDecodeError:
            logger.error("AI returned invalid JSON")
        
        return None  # Fallback: no review available
```

### Bad AI Integration

```python
def review(code):
    return llm.generate(f"Review this: {code}")
```

## Anti-patterns

- Passing AI output directly to users without validation
- No fallback for AI failures
- No monitoring or evaluation
- Hardcoded prompts
- No cost tracking

## Verification

- [ ] Is the AI output validated?
- [ ] Is there a fallback mechanism?
- [ ] Is the prompt versioned?
- [ ] Is the system monitored?

## References

- [Prompt Engineering Guide](https://www.promptingguide.ai/)
- [OpenAI Best Practices](https://platform.openai.com/docs/guides/prompt-engineering)


---





---



---
name: api-design
description: "Design robust, consistent, and developer-friendly APIs."
---

# Skill: API Design
> Category: Backend Engineering
> Priority: High

---

## Description

Design robust, consistent, and developer-friendly APIs.

## Purpose

Create APIs that are easy to understand, hard to misuse, and resilient to change.

## Trigger

Use this skill when:
- Designing a new API
- Adding endpoints to an existing API
- Versioning an API
- Writing API documentation
- Reviewing API changes

## Context

- Consumer requirements
- Authentication method
- Rate limiting needs
- Data volume and latency requirements

## Workflow

1. **Resource Modeling** - Identify nouns (resources), not verbs (actions).
2. **Consistent Naming** - Use plural nouns, kebab-case for paths.
3. **Use Standard Methods** - GET, POST, PUT, PATCH, DELETE correctly.
4. **Status Codes** - Use appropriate HTTP status codes.
5. **Versioning** - Include version in URL or header.
6. **Pagination** - Always paginate list endpoints.
7. **Filtering & Sorting** - Standard query parameters.
8. **Error Responses** - Consistent structure, helpful messages.
9. **Rate Limiting** - Protect the server and consumers.
10. **Documentation** - OpenAPI/Swagger specification.

## Examples

### Good API Design

```
GET    /api/v1/users?page=1&limit=20&sort=-created_at
GET    /api/v1/users/:id
POST   /api/v1/users
PATCH  /api/v1/users/:id
DELETE /api/v1/users/:id
GET    /api/v1/users/:id/orders?status=pending
```

### Bad API Design

```
GET /api/getUserData?id=123
POST /api/createNewUserRecord
GET /api/users/123/orders/getAllPendingOrders
```

## Anti-patterns

- Verbs in URLs
- Inconsistent naming
- Missing pagination
- Breaking changes without versioning
- Vague error messages

## Verification

- [ ] Are resources modeled as nouns?
- [ ] Is pagination implemented?
- [ ] Are errors consistent and helpful?
- [ ] Is the API versioned?

## References

- [Microsoft REST API Guidelines](https://github.com/microsoft/api-guidelines)
- [Stripe API Design Guide](https://stripe.com/blog/markdown-structured-data)


---





---



---
name: architecture
description: "Evaluate and improve software architecture decisions to ensure scalability, maintainability, and correctness."
---

# Skill: Architecture Review
> Category: Core Engineering
> Priority: Critical

---

## Description

Evaluate and improve software architecture decisions to ensure scalability, maintainability, and correctness.

## Purpose

Catch architectural flaws early, before they become expensive to fix.

## Trigger

Use this skill when:
- Designing a new system or service
- Proposing a significant refactor
- Adding a new dependency
- Changing data flow or state management
- Introducing a new pattern

## Context

- Current system architecture
- Non-functional requirements (scale, latency, availability)
- Team expertise
- Existing technical debt

## Workflow

1. **Gather Requirements** - Functional and non-functional.
2. **Identify Constraints** - Time, budget, team, legacy systems.
3. **Propose Options** - At least two approaches.
4. **Evaluate Trade-offs** - For each option, list pros, cons, risks.
5. **Apply SOLID** - Check each principle against the proposal.
6. **Check Coupling** - Are components loosely coupled?
7. **Verify Testability** - Can key components be unit tested?
8. **Document Decision** - Why was this approach chosen?
9. **Plan Migration** - If replacing existing architecture, define the path.

## Examples

### Good

```
Option A: Monolith with modular packages
  Pros: Simpler deployment, shared codebase
  Cons: Tight coupling risk, harder to scale teams

Option B: Microservices
  Pros: Independent scaling, team autonomy
  Cons: Operational complexity, network latency

Decision: Option A for now, with clear module boundaries
  Reason: Team size is 3 engineers. Operational overhead of microservices
          outweighs benefits at this scale.
```

### Bad

```
Let us use microservices because they are modern.
```

## Anti-patterns

- Choosing technology because it is trendy
- Ignoring team size and operational capacity
- No documented trade-off analysis
- Architecture without migration plan

## Verification

- [ ] Are there at least two options considered?
- [ ] Are trade-offs documented?
- [ ] Does the choice align with constraints?
- [ ] Is there a migration plan if needed?

## References

- [Martin Fowler - Architecture Patterns](https://martinfowler.com/architecture/)
- [The Software Architecture Elevator](https://architectelevator.com/)


---





---



---
name: backend
description: "Build reliable, scalable, and secure server-side systems."
---

# Skill: Backend Engineering
> Category: Backend
> Priority: High

---

## Description

Build reliable, scalable, and secure server-side systems.

## Purpose

Ensure data integrity, system availability, and API correctness.

## Trigger

Use this skill when:
- Designing a new service
- Adding API endpoints
- Implementing business logic
- Integrating with databases or external services
- Reviewing backend code

## Context

- Programming language and framework
- Database and caching layer
- External dependencies
- Scale and latency requirements

## Workflow

1. **Input Validation** - Validate at the boundary. Fail fast.
2. **Error Handling** - Catch exceptions, return structured errors.
3. **Logging** - Structured logs with correlation IDs.
4. **Idempotency** - Safe to retry operations.
5. **Transactions** - Multi-step operations must be atomic.
6. **Caching** - Cache reads, invalidate writes.
7. **Rate Limiting** - Protect resources from abuse.
8. **Observability** - Metrics, traces, health checks.

## Examples

### Good API Handler

```typescript
export async function createOrder(req: Request, res: Response) {
  const { userId, items } = CreateOrderSchema.parse(req.body);
  
  const correlationId = req.headers["x-correlation-id"] || uuid();
  logger.info({ correlationId, userId, itemCount: items.length }, "Creating order");
  
  try {
    const order = await db.transaction(async (trx) => {
      const order = await OrderRepository.create({ userId }, trx);
      await OrderItemRepository.createBulk(order.id, items, trx);
      return order;
    });
    
    res.status(201).json(order);
  } catch (error) {
    logger.error({ correlationId, error }, "Order creation failed");
    res.status(500).json({ error: "Order creation failed", correlationId });
  }
}
```

### Bad API Handler

```typescript
function createOrder(req, res) {
  const order = db.query(`INSERT INTO orders (user_id) VALUES (${req.body.userId})`);
  res.send(order);
}
```

## Anti-patterns

- SQL injection via string concatenation
- No input validation
- Swallowing exceptions
- No logging
- No transactions for multi-step operations

## Verification

- [ ] Are inputs validated?
- [ ] Are errors handled and logged?
- [ ] Are multi-step operations atomic?
- [ ] Is the code safe from injection attacks?

## References

- [12-Factor App](https://12factor.net/)
- [Google SRE Book](https://sre.google/sre-book-table-of-contents/)


---





---



---
name: ci-cd
description: "Design and maintain automated continuous integration and delivery pipelines."
---

# Skill: CI/CD Pipeline Design
> Category: DevOps
> Priority: High

---

## Description

Design and maintain automated continuous integration and delivery pipelines.

## Purpose

Automate testing, building, and deployment to reduce human error and increase velocity.

## Trigger

Use this skill when:
- Setting up a new project
- Adding automated tests
- Configuring deployment automation
- Adding security scanning to pipelines
- Optimizing build times

## Context

- Version control system
- Deployment targets (cloud, on-premise, edge)
- Testing frameworks
- Security requirements
- Team size and expertise

## Workflow

1. **Fast Feedback Loop** - Run unit tests first, fast.
2. **Parallel Jobs** - Run independent checks concurrently.
3. **Cache Dependencies** - Do not download the internet every build.
4. **Artifact Management** - Version and store build artifacts.
5. **Security Scanning** - SAST, DAST, dependency audit in pipeline.
6. **Environment Promotion** - Same artifact through dev, staging, prod.
7. **Rollback Strategy** - One-click rollback must be possible.
8. **Notifications** - Alert on failure, not just success.

## Examples

### Good Pipeline Stages

```yaml
stages:
  - lint
  - test
  - security-scan
  - build
  - deploy-staging
  - e2e-staging
  - deploy-prod

rules:
  - deploy-prod only if: main branch AND e2e-staging passed
```

### Bad Pipeline Design

```yaml
# One giant stage that does everything sequentially
stage: all
script:
  - npm install
  - npm test
  - npm build
  - docker build
  - docker push
  - ssh deploy
```

## Anti-patterns

- No automated tests in pipeline
- Deploying without verification
- Building different artifacts per environment
- Secrets in pipeline configuration
- No rollback capability

## Verification

- [ ] Are tests automated in the pipeline?
- [ ] Is security scanning included?
- [ ] Is the same artifact promoted?
- [ ] Is rollback possible?

## References

- [Continuous Delivery by Jez Humble](https://continuousdelivery.com/)
- [GitLab CI Best Practices](https://docs.gitlab.com/ee/ci/best-practices/)


---





---



---
name: code-review
description: "Evaluate code changes for correctness, security, maintainability, and alignment with team standards."
---

# Skill: Code Review
> Category: Core Engineering
> Priority: Critical

---

## Description

Evaluate code changes for correctness, security, maintainability, and alignment with team standards.

## Purpose

Prevent defects from reaching production and spread knowledge across the team.

## Trigger

Use this skill when:
- Reviewing a pull request
- Auditing existing code
- Mentoring junior developers
- Refactoring legacy code

## Context

- Full diff of changes
- Related issues or requirements
- Existing codebase patterns
- Security and performance constraints

## Workflow

1. **Understand Context** - Read the issue and description first.
2. **Check Correctness** - Does the code do what it claims?
3. **Check Security** - Validate inputs, escape outputs, no secrets.
4. **Check Tests** - Do tests exist? Do they cover edge cases?
5. **Check Architecture** - Does it follow SOLID? Is coupling acceptable?
6. **Check Performance** - Any N+1 queries? Unnecessary re-renders?
7. **Check Readability** - Are names descriptive? Comments only where needed?
8. **Check Documentation** - Is README or API docs updated?
9. **Provide Feedback** - Ask questions, suggest improvements, praise good work.
10. **Verify Fixes** - Re-review after changes.

## Examples

### Good Review Comment

```
Question: Why are we parsing this date string manually instead of
using the existing `DateParser` utility? The utility handles timezones
and leap years correctly, which this implementation does not.

Suggestion: Use `DateParser.parse()` and add a test for timezone handling.
```

### Bad Review Comment

```
This is wrong. Fix it.
```

## Anti-patterns

- Reviewing only style, missing logic bugs
- Approving without running tests
- Being harsh instead of constructive
- Not re-reviewing after fixes

## Verification

- [ ] Did you understand the context before reviewing?
- [ ] Did you check for security issues?
- [ ] Did you verify tests exist and pass?
- [ ] Is your feedback actionable?

## References

- [Google Code Review Guidelines](https://google.github.io/eng-practices/review/)


---





---



---
name: database
description: "Design, optimize, and review database schemas and queries."
---

# Skill: Database Design & Review
> Category: Backend Engineering
> Priority: High

---

## Description

Design, optimize, and review database schemas and queries.

## Purpose

Ensure data integrity, query performance, and scalable growth.

## Trigger

Use this skill when:
- Designing a new schema
- Adding a migration
- Reviewing slow queries
- Planning data archival
- Refactoring data models

## Context

- Database type (SQL, NoSQL, Graph)
- Expected data volume
- Query patterns (read-heavy vs write-heavy)
- Consistency requirements

## Workflow

1. **Normalize First** - Start with 3NF, denormalize only when needed.
2. **Choose Types Wisely** - Use the smallest adequate type.
3. **Index for Query Patterns** - But not excessively.
4. **Foreign Keys** - Enforce referential integrity when possible.
5. **Migrations Must Be Reversible** - Always have a down script.
6. **Soft Deletes** - Never lose data accidentally.
7. **Monitor Slow Queries** - Proactive optimization.

## Examples

### Good Migration

```sql
-- Up
CREATE TABLE orders (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  total_cents INTEGER NOT NULL CHECK (total_cents >= 0),
  status VARCHAR(20) NOT NULL DEFAULT "pending",
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  deleted_at TIMESTAMP
);

CREATE INDEX idx_orders_user_id ON orders(user_id) WHERE deleted_at IS NULL;
CREATE INDEX idx_orders_status_created ON orders(status, created_at);

-- Down
DROP INDEX idx_orders_status_created;
DROP INDEX idx_orders_user_id;
DROP TABLE orders;
```

### Bad Migration

```sql
CREATE TABLE orders (
  id INT,
  user_id INT,
  total FLOAT,
  status VARCHAR(255)
);
```

## Anti-patterns

- Missing foreign keys
- No indexes on query columns
- Storing money as FLOAT
- Irreversible migrations
- Missing `deleted_at` for soft deletes

## Verification

- [ ] Is the schema normalized?
- [ ] Are indexes appropriate for query patterns?
- [ ] Is the migration reversible?
- [ ] Are data types precise?

## References

- [Use The Index, Luke](https://use-the-index-luke.com/)
- [SQL Performance Explained](https://sql-performance-explained.com/)


---





---



---
name: debugging
description: "A systematic, evidence-based approach to finding and fixing bugs."
---

# Skill: Structured Debugging
> Category: Core Engineering
> Priority: Critical

---

## Description

A systematic, evidence-based approach to finding and fixing bugs.

## Purpose

Eliminate guesswork. Fix root causes, not symptoms.

## Trigger

Use this skill when:
- A bug is reported
- Tests fail unexpectedly
- Behavior does not match expectations
- Performance degrades

## Context

- Error logs and stack traces
- Recent code changes
- Environment differences
- Reproduction steps

## Workflow

1. **Reproduce** - Can you make it fail consistently?
2. **Isolate** - Binary search: comment out half the code. Which half fails?
3. **Hypothesize** - Form a theory about the root cause.
4. **Test Hypothesis** - Add logging or use a debugger to confirm.
5. **Fix Root Cause** - Address the source, not the symptom.
6. **Verify Fix** - Confirm the bug is gone AND no new bugs introduced.
7. **Add Regression Test** - Ensure this bug never returns.
8. **Document** - Update knowledge base if the fix reveals a pattern.

## Examples

### Good

```
Bug: Users see 500 error on checkout

1. Reproduce: Confirmed on staging with user ID 12345
2. Isolate: Error occurs in payment service, not cart service
3. Hypothesize: Null pointer when user has no saved cards
4. Test: Add debug log -> confirmed null `cards` array
5. Fix: Add null check before iterating cards
6. Verify: Checkout works for user 12345 AND existing users with cards
7. Regression test: Unit test for null cards scenario added
8. Document: Added to anti-patterns: "Always null-check before iteration"
```

### Bad

```
Bug: 500 error
Fix: Added try-catch to swallow the error.
```

## Anti-patterns

- Fixing symptoms with try-catch
- Skipping reproduction
- Not adding regression tests
- Debugging without logs

## Verification

- [ ] Can the bug be consistently reproduced?
- [ ] Was the root cause identified?
- [ ] Does the fix address the root cause?
- [ ] Is there a regression test?

## References

- [Debug It! by Paul Butcher](https://pragprog.com/titles/pbdp/debug-it/)


---





---



---
name: design-resources-library
description: "Curated design systems, component libraries, and UI resources for building professional interfaces. Companion to ui-ux-pro-max for implementation guidance."
---

# Skill: Design Resources Library

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

- `data/components.csv` â€” component selection guide
- `data/design-systems.csv` â€” library comparison
- `data/resources.csv` â€” categorized design resources
- `ui-ux-pro-max` skill â€” design rules, styles, palettes, UX guidelines
- shadcn/ui: https://ui.shadcn.com
- Ant Design: https://ant.design
- Material UI: https://mui.com/material-ui
- Brad Traversy Design Resources: https://github.com/bradtraversy/design-resources-for-developers



---



---
name: docker
description: "Build, optimize, and manage containerized applications."
---

# Skill: Docker & Containerization
> Category: DevOps
> Priority: High

---

## Description

Build, optimize, and manage containerized applications.

## Purpose

Ensure consistent environments from development to production.

## Trigger

Use this skill when:
- Containerizing an application
- Optimizing image size
- Writing Docker Compose configurations
- Debugging container issues
- Setting up CI/CD pipelines

## Context

- Application runtime requirements
- Base image options
- Security constraints
- Build time vs runtime dependencies

## Workflow

1. **Use Minimal Base Images** - Alpine or distroless when possible.
2. **Layer Ordering** - Put least-frequently-changed layers first.
3. **Multi-stage Builds** - Separate build and runtime environments.
4. **Run as Non-root** - Create a dedicated user.
5. **Scan for Vulnerabilities** - Use Trivy, Snyk, or similar.
6. **Health Checks** - Define readiness and liveness probes.
7. **Resource Limits** - Set CPU and memory constraints.

## Examples

### Good Dockerfile

```dockerfile
# Build stage
FROM node:20-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

# Runtime stage
FROM node:20-alpine
RUN addgroup -g 1001 -S nodejs && adduser -S nextjs -u 1001
WORKDIR /app
COPY --from=builder --chown=nextjs:nodejs /app/dist ./dist
COPY --from=builder --chown=nextjs:nodejs /app/node_modules ./node_modules
USER nextjs
EXPOSE 3000
HEALTHCHECK --interval=30s --timeout=3s \
  CMD curl -f http://localhost:3000/health || exit 1
CMD ["node", "dist/main.js"]
```

### Bad Dockerfile

```dockerfile
FROM ubuntu:latest
COPY . .
RUN apt-get update && apt-get install -y nodejs npm
RUN npm install
CMD npm start
```

## Anti-patterns

- Using `latest` tag in production
- Running as root
- Including build tools in production image
- No health checks
- No resource limits

## Verification

- [ ] Is the image minimal?
- [ ] Does it run as non-root?
- [ ] Are health checks defined?
- [ ] Has it been scanned for vulnerabilities?

## References

- [Docker Best Practices](https://docs.docker.com/develop/dev-best-practices/)
- [OWASP Container Security](https://owasp.org/www-project-container-security-verification-standard/)


---





---



---
name: docs
description: "Use Docs from the pmndrs ecosystem."
---

# Skill: Docs

> Category: Documentation
> Priority: High

---

## Description

$ curl -sL https://raw.githubusercontent.com/pmndrs/docs/refs/heads/main/preview.sh | \ This skill provides the essential guidance, workflow, anti-patterns, and verification checklist needed to use Docs correctly within the pmndrs ecosystem and within DevinOS projects.

## Purpose

Reduce implementation risk and accelerate development by applying the correct patterns, configuration, and integration steps for Docs. The goal is to produce code that is performant, maintainable, and aligned with the official documentation.

## Trigger

Use this skill when:

- Building a feature that depends on Docs.
- Deciding whether Docs is the right tool for the current architecture.
- Reviewing, debugging, or refactoring code that uses Docs.
- Integrating Docs with other pmndrs libraries or React patterns.
- Setting up a new project or adding the library to an existing project.
- Evaluating performance, accessibility, or SSR implications of Docs.

## Context

- Project framework, version, and build tooling.
- Target devices and performance budgets (desktop, mobile, VR/AR).
- Related libraries already in use (React, Three.js, state managers, animation libraries).
- Client-only versus SSR constraints.
- Existing component structure and coding standards.
- Need for TypeScript types, tests, and documentation.
- License and compatibility requirements.

## Workflow

1. Confirm the problem or feature that requires Docs.
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
import * as Lib from 'docs'

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

- Using Docs without understanding its primary use case and trade-offs.
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

- Repository: https://github.com/pmndrs/docs
- data/readme.md Ã¢â‚¬â€ latest README from Docs
- data/docs/ Ã¢â‚¬â€ latest documentation from Docs
- LICENSE Ã¢â‚¬â€ license of Docs


---



---
name: documentation
description: "Write clear, accurate, and useful documentation."
---

# Skill: Documentation
> Category: Core Engineering
> Priority: High

---

## Description

Write clear, accurate, and useful documentation.

## Purpose

Reduce onboarding time, prevent miscommunication, and preserve knowledge.

## Trigger

Use this skill when:
- Creating a new feature
- Changing an API
- Onboarding a new team member
- Writing a library or utility
- After fixing a complex bug

## Context

- Target audience (new hire, external developer, future self)
- Existing documentation style
- Tools available (Markdown, OpenAPI, JSDoc)

## Workflow

1. **Identify Audience** - Who needs this documentation?
2. **Define Scope** - What do they need to know?
3. **Provide Context** - Why does this exist? When should it be used?
4. **Include Examples** - Show, do not just tell.
5. **Document Failure Modes** - What can go wrong? How to fix it?
6. **Keep It Updated** - Documentation must reflect reality.
7. **Make It Discoverable** - Link from README and relevant code.

## Examples

### Good API Documentation

```markdown
## POST /api/users

Creates a new user.

### Request
```json
{
  "email": "user@example.com",
  "password": "securePassword123"
}
```

### Response (201 Created)
```json
{
  "id": "uuid",
  "email": "user@example.com",
  "createdAt": "2024-01-01T00:00:00Z"
}
```

### Errors
- `400` - Invalid email or weak password
- `409` - Email already exists
```

### Bad API Documentation

```markdown
POST /api/users - creates user
```

## Anti-patterns

- Outdated documentation
- Missing error documentation
- No examples
- Writing for yourself instead of the audience

## Verification

- [ ] Is the audience clear?
- [ ] Are there working examples?
- [ ] Are errors documented?
- [ ] Is it up to date?

## References

- [Diataxis Framework](https://diataxis.fr/)
- [Google Technical Writing](https://developers.google.com/tech-writing)


---





---



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





---



---
name: git
description: "Professional version control practices for clean, collaborative development."
---

# Skill: Git Workflow
> Category: Core Engineering
> Priority: High

---

## Description

Professional version control practices for clean, collaborative development.

## Purpose

Maintain a readable history, enable rollbacks, and prevent conflicts.

## Trigger

Use this skill when:
- Starting work on a new feature
- Committing code
- Resolving merge conflicts
- Preparing a pull request
- Reverting a change

## Context

- Branching strategy (GitFlow, trunk-based, etc.)
- Team conventions
- CI/CD requirements

## Workflow

1. **Create Feature Branch** - From latest main: `git checkout -b feature/name`
2. **Make Small Commits** - One logical change per commit.
3. **Write Meaningful Messages** - Explain why, not just what.
4. **Pull Regularly** - Keep your branch up to date.
5. **Resolve Conflicts Carefully** - Understand both sides.
6. **Squash if Needed** - Clean history before merge.
7. **Delete Branch After Merge** - Keep the repository clean.

## Commit Message Format

```
type(scope): subject

body (optional)

footer (optional)
```

Types: `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore`

## Examples

### Good Commit History

```
feat(auth): add JWT-based authentication

- Implement login endpoint
- Add token refresh logic
- Store tokens in httpOnly cookies

Closes #123
```

### Bad Commit History

```
fix stuff
update
final commit
really final
```

## Anti-patterns

- Committing broken code
- Force pushing to shared branches
- Giant commits with unrelated changes
- Meaningless commit messages

## Verification

- [ ] Are commits small and focused?
- [ ] Do messages explain the why?
- [ ] Is the branch up to date with main?
- [ ] Is history clean before merge?

## References

- [Conventional Commits](https://www.conventionalcommits.org/)
- [Git Best Practices](https://sethrobertson.github.io/GitBestPractices/)


---





---



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





---



---
name: jotai
description: "Use jotai from the pmndrs ecosystem."
---

# Skill: Jotai

> Category: Frontend Engineering
> Priority: High

---

## Description

![Jotai (light mode)](./img/jotai-header-light.png#gh-light-mode-only) This skill provides the essential guidance, workflow, anti-patterns, and verification checklist needed to use Jotai correctly within the pmndrs ecosystem and within DevinOS projects.

## Purpose

Reduce implementation risk and accelerate development by applying the correct patterns, configuration, and integration steps for Jotai. The goal is to produce code that is performant, maintainable, and aligned with the official documentation.

## Trigger

Use this skill when:

- Building a feature that depends on Jotai.
- Deciding whether Jotai is the right tool for the current architecture.
- Reviewing, debugging, or refactoring code that uses Jotai.
- Integrating Jotai with other pmndrs libraries or React patterns.
- Setting up a new project or adding the library to an existing project.
- Evaluating performance, accessibility, or SSR implications of Jotai.

## Context

- Project framework, version, and build tooling.
- Target devices and performance budgets (desktop, mobile, VR/AR).
- Related libraries already in use (React, Three.js, state managers, animation libraries).
- Client-only versus SSR constraints.
- Existing component structure and coding standards.
- Need for TypeScript types, tests, and documentation.
- License and compatibility requirements.

## Workflow

1. Confirm the problem or feature that requires Jotai.
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
import * as Lib from 'jotai'

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

- Using Jotai without understanding its primary use case and trade-offs.
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

- Repository: https://github.com/pmndrs/jotai
- data/readme.md Ã¢â‚¬â€ latest README from Jotai
- data/docs/ Ã¢â‚¬â€ latest documentation from Jotai
- LICENSE Ã¢â‚¬â€ license of Jotai


---



---
name: knowledge-distillation
description: "Extract generalizable lessons from project work and convert them into reusable skills."
---

# Skill: Knowledge Distillation
> Category: Meta-Learning
> Priority: High

---

## Description

Extract generalizable lessons from project work and convert them into reusable skills.

## Purpose

Transform individual project experience into institutional knowledge.

## Trigger

Use this skill when:
- Completing a project or major feature
- Fixing a complex bug
- Making an architectural decision
- Discovering a useful pattern
- Avoiding a repeated mistake

## Context

- Project outcomes
- Decisions made and their results
- Patterns that emerged
- Mistakes and their causes

## Workflow

1. **Reflect** - What happened? What worked? What did not?
2. **Generalize** - Remove project-specific details.
3. **Identify Pattern** - Is this a rule, skill, or anti-pattern?
4. **Create Asset** - Write the skill, rule, or memory entry.
5. **Link** - Connect to related skills and rules.
6. **Share** - Make it discoverable in the knowledge base.

## Examples

### Good Distillation

```
Project: E-commerce checkout optimization

Lesson: N+1 queries are the #1 cause of slow list endpoints in Laravel.
Pattern: Always eager load relationships in list endpoints.
Action: Created skill "Database Query Optimization"
Linked to: Backend skill, Performance skill, Laravel template
```

### Bad Distillation

```
Project done. Nothing special.
```

## Anti-patterns

- Keeping lessons in your head
- Writing project-specific notes in global memory
- Not linking related knowledge
- Never reviewing or updating distilled knowledge

## Verification

- [ ] Is the lesson generalizable?
- [ ] Is it linked to related skills?
- [ ] Is it discoverable?
- [ ] Will it help future projects?

## References

- [Working Effectively with Legacy Code by Michael Feathers](https://www.oreilly.com/library/view/working-effectively-with/0131177052/)


---





---



---
name: leva
description: "Use leva from the pmndrs ecosystem."
---

# Skill: Leva

> Category: Frontend Engineering
> Priority: High

---

## Description

<a href=""><img src="https://raw.githubusercontent.com/pmndrs/leva/master/hero.png" /></a> This skill provides the essential guidance, workflow, anti-patterns, and verification checklist needed to use Leva correctly within the pmndrs ecosystem and within DevinOS projects.

## Purpose

Reduce implementation risk and accelerate development by applying the correct patterns, configuration, and integration steps for Leva. The goal is to produce code that is performant, maintainable, and aligned with the official documentation.

## Trigger

Use this skill when:

- Building a feature that depends on Leva.
- Deciding whether Leva is the right tool for the current architecture.
- Reviewing, debugging, or refactoring code that uses Leva.
- Integrating Leva with other pmndrs libraries or React patterns.
- Setting up a new project or adding the library to an existing project.
- Evaluating performance, accessibility, or SSR implications of Leva.

## Context

- Project framework, version, and build tooling.
- Target devices and performance budgets (desktop, mobile, VR/AR).
- Related libraries already in use (React, Three.js, state managers, animation libraries).
- Client-only versus SSR constraints.
- Existing component structure and coding standards.
- Need for TypeScript types, tests, and documentation.
- License and compatibility requirements.

## Workflow

1. Confirm the problem or feature that requires Leva.
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
import * as Lib from 'leva'

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

- Using Leva without understanding its primary use case and trade-offs.
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

- Repository: https://github.com/pmndrs/leva
- data/readme.md Ã¢â‚¬â€ latest README from Leva
- data/docs/ Ã¢â‚¬â€ latest documentation from Leva
- LICENSE Ã¢â‚¬â€ license of Leva


---



---
name: mcp
description: "Build and maintain Model Context Protocol servers and tools."
---

# Skill: MCP (Model Context Protocol) Builder
> Category: AI Engineering
> Priority: High

---

## Description

Build and maintain Model Context Protocol servers and tools.

## Purpose

Extend Devin and AI agents with reliable, well-documented tools.

## Trigger

Use this skill when:
- Creating a new MCP server
- Adding tools to an existing MCP server
- Documenting MCP capabilities
- Debugging MCP tool failures
- Reviewing MCP implementations

## Context

- MCP protocol version
- Transport method (stdio, SSE, HTTP)
- Target AI agent (Devin, Claude, etc.)
- Authentication requirements

## Workflow

1. **Single Purpose** - Each tool does one thing well.
2. **Clear Naming** - Tool names describe the action.
3. **Input Validation** - Validate all parameters at entry.
4. **Structured Output** - Return typed, consistent responses.
5. **Error Handling** - Graceful failures with helpful messages.
6. **Documentation** - Document schema and behavior.
7. **Versioning** - Version tools independently.
8. **Testing** - Unit test each tool in isolation.

## Examples

### Good MCP Tool

```typescript
const searchCodeTool = {
  name: "search_code",
  description: "Search codebase for patterns using ripgrep",
  inputSchema: {
    type: "object",
    properties: {
      query: { type: "string", description: "Search pattern" },
      path: { type: "string", description: "Directory to search" },
      caseSensitive: { type: "boolean", default: false }
    },
    required: ["query", "path"]
  },
  async handler({ query, path, caseSensitive }) {
    if (!query || typeof query !== "string") {
      return { error: "query must be a non-empty string" };
    }
    const results = await ripgrep.search({ query, path, caseSensitive });
    return { results, count: results.length };
  }
};
```

### Bad MCP Tool

```typescript
const tool = {
  name: "do_stuff",
  handler(args) {
    return execSync(args.command);
  }
};
```

## Anti-patterns

- Tools with vague names
- No input validation
- No error handling
- Arbitrary command execution
- Undocumented side effects

## Verification

- [ ] Is the tool single-purpose?
- [ ] Are inputs validated?
- [ ] Are errors handled gracefully?
- [ ] Is the output structured?

## References

- [MCP Specification](https://modelcontextprotocol.io/)


---





---



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





---



---
name: planning
description: "Systematic approach to breaking down complex engineering tasks into small, verifiable, and sequenced steps."
---

# Skill: Planning
> Category: Core Engineering
> Priority: Critical

---

## Description

Systematic approach to breaking down complex engineering tasks into small, verifiable, and sequenced steps.

## Purpose

Eliminate ambiguity, reduce rework, and ensure every task has clear success criteria before implementation begins.

## Trigger

Use this skill when:
- Starting a new feature
- Refactoring a large subsystem
- Planning a migration
- Estimating effort
- Defining an architecture

## Context

- Current codebase state
- Existing dependencies and constraints
- Team standards and conventions
- Timeline and risk tolerance

## Workflow

1. **Understand** - Clarify requirements. Ask questions until ambiguity is zero.
2. **Research** - Search existing codebase for similar implementations.
3. **Decompose** - Break into steps no larger than 2 hours of work each.
4. **Sequence** - Order steps by dependency and risk.
5. **Define Success** - Each step must have verifiable completion criteria.
6. **Identify Risks** - List unknowns and mitigation strategies.
7. **Estimate** - Provide realistic effort estimates with buffer.
8. **Review** - Present plan for validation before execution.

## Examples

### Good

```
Step 1: Create database migration for new column (30 min)
  Success: Migration runs up and down successfully

Step 2: Update model to include new field (15 min)
  Success: Unit test for model passes

Step 3: Add API endpoint (1 hour)
  Success: Endpoint returns correct response, tests pass

Step 4: Update frontend form (1 hour)
  Success: Form submits and displays new field
```

### Bad

```
Step 1: Build the feature (3 days)
  Success: It works
```

## Anti-patterns

- Vague steps like "implement the thing"
- Missing success criteria
- No risk assessment
- No dependency ordering

## Verification

- [ ] Is every step under 2 hours?
- [ ] Does every step have clear success criteria?
- [ ] Are dependencies ordered correctly?
- [ ] Are risks identified?

## References

- [User Story Mapping](https://www.jpattonassociates.com/story-mapping/)
- [Shape Up by Basecamp](https://basecamp.com/shapeup)


---





---



---
name: prai
description: "Use prai from the pmndrs ecosystem."
---

# Skill: Prai

> Category: Frontend Engineering
> Priority: High

---

## Description

<h1 align="center">prai ðŸ¤–</h1> This skill provides the essential guidance, workflow, anti-patterns, and verification checklist needed to use Prai correctly within the pmndrs ecosystem and within DevinOS projects.

## Purpose

Reduce implementation risk and accelerate development by applying the correct patterns, configuration, and integration steps for Prai. The goal is to produce code that is performant, maintainable, and aligned with the official documentation.

## Trigger

Use this skill when:

- Building a feature that depends on Prai.
- Deciding whether Prai is the right tool for the current architecture.
- Reviewing, debugging, or refactoring code that uses Prai.
- Integrating Prai with other pmndrs libraries or React patterns.
- Setting up a new project or adding the library to an existing project.
- Evaluating performance, accessibility, or SSR implications of Prai.

## Context

- Project framework, version, and build tooling.
- Target devices and performance budgets (desktop, mobile, VR/AR).
- Related libraries already in use (React, Three.js, state managers, animation libraries).
- Client-only versus SSR constraints.
- Existing component structure and coding standards.
- Need for TypeScript types, tests, and documentation.
- License and compatibility requirements.

## Workflow

1. Confirm the problem or feature that requires Prai.
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
import * as Lib from 'prai'

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

- Using Prai without understanding its primary use case and trade-offs.
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

- Repository: https://github.com/pmndrs/prai
- data/readme.md Ã¢â‚¬â€ latest README from Prai
- data/docs/ Ã¢â‚¬â€ latest documentation from Prai
- LICENSE Ã¢â‚¬â€ license of Prai


---



---
name: quality-audit
description: "Rigorously evaluate any DevinOS asset (skill, rule, workflow, playbook, template, prompt, or memory) against production-quality standards before acceptance."
---

# Skill: Quality Audit
> Category: Meta-Learning
> Priority: Critical

---

## Description

Rigorously evaluate any DevinOS asset (skill, rule, workflow, playbook, template, prompt, or memory) against production-quality standards before acceptance.

## Purpose

Ensure every asset that enters DevinOS is clear, correct, safe, reusable, and future-proof. Never approve low-quality content.

## Trigger

Use this skill when:
- Reviewing a new or updated DevinOS asset before merge
- Auditing existing assets for quality degradation
- Training new maintainers on review standards
- Investigating why an asset caused confusion or failure

## Context

- The asset file(s) being reviewed
- Related assets in the same category
- `ENGINEERING_CONSTITUTION.md` and relevant rules
- Target audience (skill level, framework, domain)

---

## Workflow

Run through all 7 gates in order. Each gate has a **Pass/Fail** decision.

### Gate 1 â€” Purpose & Clarity

The asset must answer three questions immediately:

| Question | Pass Criteria |
|----------|---------------|
| What problem does it solve? | One sentence, no jargon |
| Who should use it? | Defined audience (junior, senior, specific role) |
| When is it finished? | Measurable success criteria |

**Scoring (1â€“10):**
- 9â€“10: Purpose is obvious in first 10 seconds of reading
- 7â€“8: Purpose exists but needs minor rewording
- 5â€“6: Purpose is buried or vague
- 1â€“4: Purpose is missing or confusing â†’ **Reject**

**Action if Fail:** Rewrite the Description and Purpose sections.

---

### Gate 2 â€” Structure & Completeness

Verify the asset follows DevinOS standard structure.

**Required sections by asset type:**

| Asset Type | Required Sections |
|------------|-------------------|
| Skill | Description, Purpose, Trigger, Context, Workflow, Examples, Anti-patterns, Verification, References |
| Rule | Principles (numbered list), Verification Checklist |
| Workflow | Inputs, Outputs, Success Criteria, Required Skills, Step-by-Step, Decision Trees, Reversibility |
| Playbook | Scenario, Severity, Steps, Escalation, Communication Templates, Post-Incident |
| Template | README, DevContainer, Linting, Tests, Docker, CI/CD, Security Checklist, Observability |
| Prompt | Category, Purpose, Context, Role, Output Format, Constraints, Examples |
| Memory | Category, What, Why It Matters, How to Apply, Related Assets |

**Automated Check:** Run `scripts/validate-asset.py` to detect missing sections.

**Scoring (1â€“10):**
- 9â€“10: All sections present, well-organized, consistent formatting
- 7â€“8: Minor missing sections or formatting inconsistencies
- 5â€“6: Significant gaps in structure
- 1â€“4: Critical sections missing â†’ **Reject**

**Action if Fail:** Generate missing sections using the appropriate template.

---

### Gate 3 â€” Engineering Quality

Evaluate the asset on 7 dimensions:

| Dimension | Excellent (9â€“10) | Good (7â€“8) | Weak (5â€“6) | Unacceptable (1â€“4) |
|-----------|------------------|------------|------------|--------------------|
| **Clarity** | Zero ambiguity | Minor rewording needed | Reader must guess | Contradictory statements |
| **Consistency** | Follows all conventions | Minor deviation | Inconsistent formatting | Violates core conventions |
| **Maintainability** | Easy to update | Minor coupling | Brittle structure | Impossible to modify |
| **Scalability** | Works for 1â€“10,000 scale | Works for team scale | Works for individual | Fails at any scale |
| **Reusability** | Framework-agnostic | Minor assumptions | Framework-specific | Hardcoded details |
| **Reliability** | Proven patterns | Industry standard | Unverified approach | Risky or unsafe |
| **Correctness** | Logically sound | Minor edge cases | Significant gaps | Contains errors |

**Gate 3 Score:** Average of 7 dimensions (must be â‰¥ 7.0 to pass)

**Action if Fail:** Rewrite weak sections or add missing depth.

---

### Gate 4 â€” AI Understandability

The asset must be deterministic for an AI agent. Check for ambiguity.

| Check | Pass |
|-------|------|
| Can Devin parse this without hallucination? | Yes |
| Are instructions ordered correctly? | Yes |
| Are there conflicting instructions? | No |
| Is expected output format specified? | Yes |
| Are edge cases covered? | Yes |
| Does it contain placeholders that require human context? | No |

**Scoring (1â€“10):**
- 9â€“10: AI can execute without human intervention
- 7â€“8: Minor clarifications needed
- 5â€“6: Multiple interpretations possible
- 1â€“4: High ambiguity â†’ **Reject**

**Action if Fail:** Add explicit constraints, remove vague language, specify output format.

---

### Gate 5 â€” Uniqueness (Duplicate Detection)

Search the entire repository for overlapping content.

**Steps:**
1. Read all assets in the same category
2. Identify any asset that solves the same problem
3. Compare scope, approach, and audience
4. Decision:
   - **Unique** â†’ Proceed
   - **Overlap < 30%** â†’ Add cross-reference link
   - **Overlap 30â€“70%** â†’ Merge into stronger asset
   - **Overlap > 70%** â†’ Reject as duplicate

**Scoring (1â€“10):**
- 9â€“10: Completely novel contribution
- 7â€“8: Minor overlap, cross-reference added
- 5â€“6: Significant overlap, merging required
- 1â€“4: Near-complete duplicate â†’ **Reject**

**Action if Fail:** Merge with existing asset or reject.

---

### Gate 6 â€” Generalization & Safety

**Generalization Check:**
- If content contains project-specific details â†’ Remove or generalize
- If framework-specific â†’ Mark as framework-specific in title
- If contains assumptions â†’ State them explicitly

**Safety Check â€” Reject if any exist:**
- [ ] Hardcoded secrets, passwords, or API keys
- [ ] Destructive commands without warnings
- [ ] Blind automation instructions
- [ ] Unverified assumptions presented as facts
- [ ] Instructions that could cause data loss
- [ ] Security advice that violates OWASP

**Scoring (1â€“10):**
- 9â€“10: Fully generalized and safe
- 7â€“8: Minor project-specific details
- 5â€“6: Framework-specific without marking
- 1â€“4: Unsafe or overly specific â†’ **Reject**

**Action if Fail:** Generalize content, add safety warnings, remove unsafe instructions.

---

### Gate 7 â€” Examples & Stress Test

**Examples (Minimum 2 required):**
- **Good Example:** Clear, correct, follows the asset perfectly
- **Bad Example:** Common mistake, with explanation of why it fails
- **Excellent Example:** (Optional) Real-world scenario with context

**Stress Test â€” Mentally simulate these scenarios:**
1. Simple case (hello-world complexity)
2. Complex case (enterprise-scale, multiple dependencies)
3. Edge case (empty input, max load, malformed data)
4. Legacy codebase (existing technical debt)
5. Greenfield project (no existing patterns)
6. Multi-language repository
7. Monorepo structure

For each scenario, ask: "Would this asset work here?"

| Scenario | Pass if... |
|----------|-----------|
| Simple | Asset is not over-engineered |
| Complex | Asset scales without breaking |
| Edge | Edge cases are documented |
| Legacy | Asset adapts to existing code |
| Greenfield | Asset provides clear starting point |
| Multi-language | Asset is language-agnostic or clearly scoped |
| Monorepo | Asset handles cross-package concerns |

**Scoring (1â€“10):**
- 9â€“10: Passes all 7 scenarios
- 7â€“8: Fails 1 scenario, documented limitation
- 5â€“6: Fails 2â€“3 scenarios
- 1â€“4: Fails >3 scenarios â†’ **Reject**

**Action if Fail:** Add examples for failed scenarios, document limitations.

---

## Scoring & Decision

### Calculate Overall Score

| Gate | Weight | Score |
|------|--------|-------|
| Gate 1: Purpose & Clarity | 15% | ___/10 |
| Gate 2: Structure & Completeness | 15% | ___/10 |
| Gate 3: Engineering Quality | 25% | ___/10 |
| Gate 4: AI Understandability | 15% | ___/10 |
| Gate 5: Uniqueness | 10% | ___/10 |
| Gate 6: Generalization & Safety | 10% | ___/10 |
| Gate 7: Examples & Stress Test | 10% | ___/10 |
| **Overall** | **100%** | **___/100** |

### Decision Matrix

| Overall Score | Decision | Action |
|---------------|----------|--------|
| 90â€“100 | âœ… **Accept** | Merge with confidence |
| 75â€“89 | âš ï¸ **Needs Revision** | List improvements, re-review after fixes |
| 60â€“74 | âš ï¸ **Major Revision** | Rewrite significant portions |
| < 60 | âŒ **Reject** | Do not merge. Provide detailed feedback. |

### Sub-Score Requirements
- No individual gate below **5.0** (even if overall is high)
- Gate 6 (Safety) must be **â‰¥ 7.0** always
- Gate 3 (Engineering) must be **â‰¥ 6.0**

---

## Final Report Template

```
# Quality Audit Report: [Asset Name]

**Auditor:** [Name]
**Date:** [YYYY-MM-DD]
**Asset Type:** [Skill/Rule/Workflow/etc.]
**Asset Path:** [File path]

## Gate Scores
| Gate | Score | Notes |
|------|-------|-------|
| 1. Purpose & Clarity | X/10 | |
| 2. Structure & Completeness | X/10 | |
| 3. Engineering Quality | X/10 | |
| 4. AI Understandability | X/10 | |
| 5. Uniqueness | X/10 | |
| 6. Generalization & Safety | X/10 | |
| 7. Examples & Stress Test | X/10 | |

## Overall Score: XX/100

## Decision: [Accept / Needs Revision / Reject]

## Strengths
- [Strength 1]
- [Strength 2]

## Weaknesses
- [Weakness 1]
- [Weakness 2]

## Recommended Improvements
1. [Improvement 1]
2. [Improvement 2]

## Automation Results
`scripts/validate-asset.py` output:
[Paste output here]
```

---

## Examples

### Good Audit Report

```
Asset: api-design/SKILL.md
Overall Score: 92/100 âœ… Accept

Strengths:
- Clear purpose and well-defined audience
- All required sections present with consistent formatting
- Framework-agnostic with explicit assumptions
- Excellent examples covering REST, GraphQL, and gRPC

Weaknesses:
- Gate 4 (AI): Missing explicit output format for API response examples
- Gate 7: No monorepo scenario covered

Recommended Improvements:
1. Add "Expected Output Format" section to workflow
2. Add monorepo API versioning example
```

### Bad Audit Report

```
Asset: some-skill/SKILL.md
Overall Score: 45/100 âŒ Reject

The skill is okay I guess. It has some good ideas.
Just fix the examples and it should be fine.

[Missing: No gate scores, no specific weaknesses, no automation results]
```

---

## Anti-patterns

- **Rubber-stamp approval** â€” Accepting because it "looks fine" without gate scoring
- **Gate skipping** â€” Approving without running all 7 gates
- **Vague feedback** â€” Comments like "improve this" without specifics
- **Friendly bias** â€” Approving because you know the contributor
- **Ignoring safety** â€” Letting Gate 6 fail because the rest looks good
- **No automation** â€” Manual review without running `validate-asset.py`

---

## Verification

- [ ] Did you run all 7 gates in order?
- [ ] Did you run `scripts/validate-asset.py`?
- [ ] Did you search for duplicate content?
- [ ] Did you score each gate honestly (no inflation)?
- [ ] Did you write a complete Final Report?
- [ ] Did you check Gate 6 (Safety) â‰¥ 7.0?
- [ ] Did you verify no individual gate < 5.0?

---

## References

- [ENGINEERING_CONSTITUTION.md](../../../../ENGINEERING_CONSTITUTION.md) â€” Article VIII: Quality Gates
- [CONTRIBUTING.md](../../../../CONTRIBUTING.md) â€” Contribution standards
- [Quality Rule](../../../../.agents/rules/quality.md) â€” Detailed quality standards
- [Code Review Skill](../../../../.agents/skills/code-review/SKILL.md) â€” Review techniques


---





---



---
name: react-postprocessing
description: "Use react-postprocessing from the pmndrs ecosystem."
---

# Skill: React Postprocessing

> Category: Frontend Engineering
> Priority: High

---

## Description

`react-postprocessing` is a This skill provides the essential guidance, workflow, anti-patterns, and verification checklist needed to use React Postprocessing correctly within the pmndrs ecosystem and within DevinOS projects.

## Purpose

Reduce implementation risk and accelerate development by applying the correct patterns, configuration, and integration steps for React Postprocessing. The goal is to produce code that is performant, maintainable, and aligned with the official documentation.

## Trigger

Use this skill when:

- Building a feature that depends on React Postprocessing.
- Deciding whether React Postprocessing is the right tool for the current architecture.
- Reviewing, debugging, or refactoring code that uses React Postprocessing.
- Integrating React Postprocessing with other pmndrs libraries or React patterns.
- Setting up a new project or adding the library to an existing project.
- Evaluating performance, accessibility, or SSR implications of React Postprocessing.

## Context

- Project framework, version, and build tooling.
- Target devices and performance budgets (desktop, mobile, VR/AR).
- Related libraries already in use (React, Three.js, state managers, animation libraries).
- Client-only versus SSR constraints.
- Existing component structure and coding standards.
- Need for TypeScript types, tests, and documentation.
- License and compatibility requirements.

## Workflow

1. Confirm the problem or feature that requires React Postprocessing.
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
import * as Lib from 'react-postprocessing'

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

- Using React Postprocessing without understanding its primary use case and trade-offs.
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

- Repository: https://github.com/pmndrs/react-postprocessing
- data/readme.md Ã¢â‚¬â€ latest README from React Postprocessing
- data/docs/ Ã¢â‚¬â€ latest documentation from React Postprocessing
- LICENSE Ã¢â‚¬â€ license of React Postprocessing


---



---
name: react-spring
description: "Use react-spring from the pmndrs ecosystem."
---

# Skill: React Spring

> Category: Frontend Engineering
> Priority: High

---

## Description

<h1 align="center">react-spring</h1> This skill provides the essential guidance, workflow, anti-patterns, and verification checklist needed to use React Spring correctly within the pmndrs ecosystem and within DevinOS projects.

## Purpose

Reduce implementation risk and accelerate development by applying the correct patterns, configuration, and integration steps for React Spring. The goal is to produce code that is performant, maintainable, and aligned with the official documentation.

## Trigger

Use this skill when:

- Building a feature that depends on React Spring.
- Deciding whether React Spring is the right tool for the current architecture.
- Reviewing, debugging, or refactoring code that uses React Spring.
- Integrating React Spring with other pmndrs libraries or React patterns.
- Setting up a new project or adding the library to an existing project.
- Evaluating performance, accessibility, or SSR implications of React Spring.

## Context

- Project framework, version, and build tooling.
- Target devices and performance budgets (desktop, mobile, VR/AR).
- Related libraries already in use (React, Three.js, state managers, animation libraries).
- Client-only versus SSR constraints.
- Existing component structure and coding standards.
- Need for TypeScript types, tests, and documentation.
- License and compatibility requirements.

## Workflow

1. Confirm the problem or feature that requires React Spring.
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
import * as Lib from 'react-spring'

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

- Using React Spring without understanding its primary use case and trade-offs.
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

- Repository: https://github.com/pmndrs/react-spring
- data/readme.md Ã¢â‚¬â€ latest README from React Spring
- data/docs/ Ã¢â‚¬â€ latest documentation from React Spring
- LICENSE Ã¢â‚¬â€ license of React Spring


---



---
name: react-three-a11y
description: "Use @react-three/a11y from the pmndrs ecosystem."
---

# Skill: React Three A11y

> Category: Frontend Engineering
> Priority: High

---

## Description

<h1>@react-three/a11y</h1> This skill provides the essential guidance, workflow, anti-patterns, and verification checklist needed to use React Three A11y correctly within the pmndrs ecosystem and within DevinOS projects.

## Purpose

Reduce implementation risk and accelerate development by applying the correct patterns, configuration, and integration steps for React Three A11y. The goal is to produce code that is performant, maintainable, and aligned with the official documentation.

## Trigger

Use this skill when:

- Building a feature that depends on React Three A11y.
- Deciding whether React Three A11y is the right tool for the current architecture.
- Reviewing, debugging, or refactoring code that uses React Three A11y.
- Integrating React Three A11y with other pmndrs libraries or React patterns.
- Setting up a new project or adding the library to an existing project.
- Evaluating performance, accessibility, or SSR implications of React Three A11y.

## Context

- Project framework, version, and build tooling.
- Target devices and performance budgets (desktop, mobile, VR/AR).
- Related libraries already in use (React, Three.js, state managers, animation libraries).
- Client-only versus SSR constraints.
- Existing component structure and coding standards.
- Need for TypeScript types, tests, and documentation.
- License and compatibility requirements.

## Workflow

1. Confirm the problem or feature that requires React Three A11y.
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
import * as Lib from 'react-three-a11y'

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

- Using React Three A11y without understanding its primary use case and trade-offs.
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

- Repository: https://github.com/pmndrs/react-three-a11y
- data/readme.md Ã¢â‚¬â€ latest README from React Three A11y
- data/docs/ Ã¢â‚¬â€ latest documentation from React Three A11y
- LICENSE Ã¢â‚¬â€ license of React Three A11y


---



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
- `data/readme.md` â€” latest README from pmndrs/drei
- `data/docs/` â€” latest MDX documentation from pmndrs/drei
- `LICENSE` â€” MIT license of pmndrs/drei



---



---
name: react-three-fiber
description: "Use @react-three/fiber from the pmndrs ecosystem."
---

# Skill: React Three Fiber

> Category: Frontend Engineering
> Priority: High

---

## Description

<h1>@react-three/fiber</h1> This skill provides the essential guidance, workflow, anti-patterns, and verification checklist needed to use React Three Fiber correctly within the pmndrs ecosystem and within DevinOS projects.

## Purpose

Reduce implementation risk and accelerate development by applying the correct patterns, configuration, and integration steps for React Three Fiber. The goal is to produce code that is performant, maintainable, and aligned with the official documentation.

## Trigger

Use this skill when:

- Building a feature that depends on React Three Fiber.
- Deciding whether React Three Fiber is the right tool for the current architecture.
- Reviewing, debugging, or refactoring code that uses React Three Fiber.
- Integrating React Three Fiber with other pmndrs libraries or React patterns.
- Setting up a new project or adding the library to an existing project.
- Evaluating performance, accessibility, or SSR implications of React Three Fiber.

## Context

- Project framework, version, and build tooling.
- Target devices and performance budgets (desktop, mobile, VR/AR).
- Related libraries already in use (React, Three.js, state managers, animation libraries).
- Client-only versus SSR constraints.
- Existing component structure and coding standards.
- Need for TypeScript types, tests, and documentation.
- License and compatibility requirements.

## Workflow

1. Confirm the problem or feature that requires React Three Fiber.
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
import * as Lib from 'react-three-fiber'

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

- Using React Three Fiber without understanding its primary use case and trade-offs.
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

- Repository: https://github.com/pmndrs/react-three-fiber
- data/readme.md Ã¢â‚¬â€ latest README from React Three Fiber
- data/docs/ Ã¢â‚¬â€ latest documentation from React Three Fiber
- LICENSE Ã¢â‚¬â€ license of React Three Fiber


---



---
name: refactoring
description: "Improve code structure without changing external behavior."
---

# Skill: Refactoring
> Category: Core Engineering
> Priority: Critical

---

## Description

Improve code structure without changing external behavior.

## Purpose

Reduce technical debt and improve maintainability while preserving functionality.

## Trigger

Use this skill when:
- Code has high cyclomatic complexity
- Duplicated logic exists
- A class has too many responsibilities
- Tests are hard to write due to tight coupling
- Performance can be improved through structure

## Context

- Full codebase context
- Test coverage of target code
- Risk tolerance for change
- Time available

## Workflow

1. **Ensure Tests Exist** - Before touching code, verify coverage.
2. **Identify Smell** - Which refactoring pattern applies?
3. **Apply Small Steps** - One refactoring at a time.
4. **Run Tests After Each Step** - Green tests are your safety net.
5. **Commit Frequently** - Each small step is a commit.
6. **Verify Behavior** - No functional changes.
7. **Document** - Update docs if structure changed significantly.

## Common Patterns

- Extract Method
- Extract Class
- Move Method
- Replace Conditional with Polymorphism
- Introduce Parameter Object
- Remove Duplication (DRY)

## Examples

### Before

```javascript
function processOrder(order) {
  if (order.type === "digital") {
    // 20 lines of digital processing
  } else if (order.type === "physical") {
    // 20 lines of physical processing
  }
}
```

### After

```javascript
function processOrder(order) {
  const processor = OrderProcessorFactory.create(order.type);
  processor.process(order);
}
```

## Anti-patterns

- Refactoring without tests
- Changing behavior during refactoring
- Giant refactoring PRs
- Refactoring just for style

## Verification

- [ ] Do tests exist and pass before refactoring?
- [ ] Did you run tests after each step?
- [ ] Is behavior unchanged?
- [ ] Are commits small and focused?

## References

- [Refactoring by Martin Fowler](https://refactoring.com/)
- [Refactoring Guru](https://refactoring.guru/)


---





---



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





---



---
name: scrollytelling
description: "Engineer scroll-driven interactive websites that remain performant, accessible, and maintainable at production scale."
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
   â”œâ”€â”€ No â†’ Use CSS transitions or CSS scroll-driven animations.
   â””â”€â”€ Yes â†’ Continue.

2. Is the effect simple (single element, transform/opacity only, no pinning)?
   â”œâ”€â”€ Yes â†’ CSS scroll-driven animation or minimal ScrollTrigger scrub.
   â””â”€â”€ No â†’ Continue.

3. Is React / Next.js / Vue / Svelte in use?
   â”œâ”€â”€ Yes â†’ Use framework-specific lifecycle hooks (useGSAP, useEffect cleanup,
   â”‚          client-only imports). Invoke Frontend and React/Vue/Svelte skills.
   â””â”€â”€ No â†’ Use vanilla GSAP with gsap.context() and explicit cleanup.

4. Is smooth scrolling required?
   â”œâ”€â”€ Yes â†’ Use Lenis + ScrollTrigger.scrollerProxy() + ScrollTrigger.update.
   â”‚          Invoke Performance skill to audit rAF and ticker loops.
   â””â”€â”€ No â†’ Use native scroll; register ScrollTrigger once.

5. Does the section contain 3D or heavy canvas rendering?
   â”œâ”€â”€ Yes â†’ Use Three.js / React Three Fiber. Drive camera and scene via GSAP
   â”‚          on Three.js object properties or a shared progress value.
   â”‚          Invoke Architecture and Performance skills.
   â””â”€â”€ No â†’ Continue with DOM animation.

6. Is pinning required?
   â”œâ”€â”€ Yes â†’ Pin the section wrapper, animate children. Verify pinSpacing,
   â”‚          anticipatePin on mobile, and ScrollTrigger.refresh() on layout change.
   â””â”€â”€ No â†’ Use scrub without pin for safer mobile behavior.

7. Is snapping required?
   â”œâ”€â”€ Yes â†’ Implement snap globally or per pinned section. Avoid snap during
   â”‚          free scrolling regions. Test on touch devices.
   â””â”€â”€ No â†’ Continue.

8. Does the project target public SEO or accessibility-critical pages?
   â”œâ”€â”€ Yes â†’ Implement prefers-reduced-motion, static fallbacks, semantic HTML,
   â”‚          and SSR-friendly content. Invoke Accessibility and Frontend skills.
   â””â”€â”€ No â†’ Still implement reduced-motion support as a baseline.

9. Are there performance issues or jank?
   â”œâ”€â”€ Yes â†’ Invoke Performance and Debugging skills. Profile GPU, JS, and layout.
   â””â”€â”€ No â†’ Run verification checklist before deployment.
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



---



---
name: security
description: "Systematic evaluation of code and architecture for security vulnerabilities."
---

# Skill: Security Review
> Category: Core Engineering
> Priority: Critical

---

## Description

Systematic evaluation of code and architecture for security vulnerabilities.

## Purpose

Prevent security flaws from reaching production.

## Trigger

Use this skill when:
- Writing authentication/authorization code
- Handling user input
- Processing sensitive data
- Adding new dependencies
- Before any production deployment
- After a security incident

## Context

- Code under review
- Threat model
- OWASP Top 10
- Compliance requirements (GDPR, SOC2, etc.)

## Workflow

1. **Identify Attack Surface** - Where can malicious input enter?
2. **Validate Inputs** - Whitelist, sanitize, validate length and type.
3. **Escape Outputs** - Prevent XSS, SQL injection, command injection.
4. **Check Authentication** - Are all protected routes guarded?
5. **Check Authorization** - Can users access others data?
6. **Audit Dependencies** - Known vulnerabilities? (npm audit, safety)
7. **Check Secrets** - No hardcoded keys, tokens, or passwords.
8. **Review Error Handling** - No information leakage in errors.
9. **Verify HTTPS** - Are all communications encrypted?
10. **Run Security Tools** - SAST, DAST, dependency scanners.

## Examples

### Good

```
Security Review: New payment endpoint

[x] Input: Card number validated with regex and Luhn check
[x] Output: Response does not include raw card number
[x] Auth: Endpoint requires valid JWT
[x] Authz: Users can only see their own payments
[x] Secrets: Stripe key from env var, not hardcoded
[x] HTTPS: Strict TLS 1.2+ enforced
[x] Errors: Generic error messages to client, details logged server-side
[x] Audit: All payment attempts logged with user ID and timestamp
```

### Bad

```
It uses HTTPS so it is secure.
```

## Anti-patterns

- Trusting client-side validation
- Showing detailed error messages to users
- Storing passwords in plain text
- Not rate-limiting authentication endpoints

## Verification

- [ ] Are all inputs validated?
- [ ] Are all outputs escaped?
- [ ] Are secrets in environment variables?
- [ ] Is authentication enforced everywhere?

## References

- [OWASP Top 10](https://owasp.org/www-project-top-ten/)
- [OWASP ASVS](https://owasp.org/www-project-application-security-verification-standard/)


---





---



---
name: testing
description: "Write comprehensive, deterministic, and maintainable tests."
---

# Skill: Testing
> Category: Core Engineering
> Priority: Critical

---

## Description

Write comprehensive, deterministic, and maintainable tests.

## Purpose

Ensure correctness, prevent regressions, and document expected behavior.

## Trigger

Use this skill when:
- Writing new code
- Fixing a bug
- Refactoring existing code
- Adding a new feature
- Reviewing code

## Context

- Code under test
- Dependencies and external services
- Testing framework in use
- Coverage requirements

## Workflow

1. **Understand Behavior** - What should this code do?
2. **Identify Edge Cases** - Null, empty, max values, errors.
3. **Write Test First (TDD)** - Red, Green, Refactor.
4. **Use Descriptive Names** - `should_return_404_when_user_not_found`
5. **Mock External Dependencies** - Tests must be isolated.
6. **Assert One Thing** - One concept per test.
7. **Keep Tests Fast** - Slow tests are not run.
8. **Maintain Tests** - Update tests when requirements change.

## Test Pyramid

```
      /\
     /  \  E2E (Few)
    /____\ 
   /      \  Integration (Some)
  /________\
 /          \  Unit (Many)
/____________\
```

## Examples

### Good

```typescript
describe("UserService", () => {
  describe("createUser", () => {
    it("should throw ValidationError when email is invalid", () => {
      expect(() => service.createUser({ email: "not-an-email" }))
        .toThrow(ValidationError);
    });

    it("should hash password before storing", async () => {
      const user = await service.createUser({ email: "a@b.com", password: "secret" });
      expect(user.password).not.toBe("secret");
      expect(await bcrypt.compare("secret", user.password)).toBe(true);
    });
  });
});
```

### Bad

```typescript
test("user", () => {
  const result = service.createUser(data);
  expect(result).toBeDefined();
});
```

## Anti-patterns

- Testing implementation details instead of behavior
- Using real databases/network in unit tests
- Non-deterministic tests (time, random, order-dependent)
- Missing edge cases

## Verification

- [ ] Do tests cover happy path and edge cases?
- [ ] Are external dependencies mocked?
- [ ] Are tests deterministic?
- [ ] Do tests run quickly?

## References

- [Test Driven Development by Kent Beck](https://www.oreilly.com/library/view/test-driven-development/0321146530/)
- [Google Testing Blog](https://testing.googleblog.com/)


---





---



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
- data/readme.md Ã¢â‚¬â€ latest README from Uikit
- data/docs/ Ã¢â‚¬â€ latest documentation from Uikit
- LICENSE Ã¢â‚¬â€ license of Uikit


---



---
name: ui-ux-pro-max
description: "UI/UX design intelligence for web and mobile. Includes 50+ styles, 161 color palettes, 57 font pairings, 161 product types, 99 UX guidelines, and 25 chart types across 10 stacks (React, Next.js, Vue, Svelte, SwiftUI, React Native, Flutter, Tailwind, shadcn/ui, and HTML/CSS). Actions: plan, build, create, design, implement, review, fix, improve, optimize, enhance, refactor, and check UI/UX code. Projects: website, landing page, dashboard, admin panel, e-commerce, SaaS, portfolio, blog, and mobile app. Elements: button, modal, navbar, sidebar, card, table, form, and chart. Styles: glassmorphism, claymorphism, minimalism, brutalism, neumorphism, bento grid, dark mode, responsive, skeuomorphism, and flat design. Topics: color systems, accessibility, animation, layout, typography, font pairing, spacing, interaction states, shadow, and gradient. Integrations: shadcn/ui MCP for component search and examples."
---

# Skill: UI/UX Pro Max

Comprehensive design guide for web and mobile applications. Contains 50+ styles, 161 color palettes, 57 font pairings, 161 product types with reasoning rules, 99 UX guidelines, and 25 chart types across 10 technology stacks. Searchable database with priority-based recommendations.

## When to Apply

This Skill should be used when the task involves **UI structure, visual design decisions, interaction patterns, or user experience quality control**.

### Must Use

This Skill must be invoked in the following situations:

- Designing new pages (Landing Page, Dashboard, Admin, SaaS, Mobile App)
- Creating or refactoring UI components (buttons, modals, forms, tables, charts, etc.)
- Choosing color schemes, typography systems, spacing standards, or layout systems
- Reviewing UI code for user experience, accessibility, or visual consistency
- Implementing navigation structures, animations, or responsive behavior
- Making product-level design decisions (style, information hierarchy, brand expression)
- Improving perceived quality, clarity, or usability of interfaces

### Recommended

This Skill is recommended in the following situations:

- UI looks "not professional enough" but the reason is unclear
- Receiving feedback on usability or experience
- Pre-launch UI quality optimization
- Aligning cross-platform design (Web / iOS / Android)
- Building design systems or reusable component libraries

### Skip

This Skill is not needed in the following situations:

- Pure backend logic development
- Only involving API or database design
- Performance optimization unrelated to the interface
- Infrastructure or DevOps work
- Non-visual scripts or automation tasks

**Decision criteria**: If the task will change how a feature **looks, feels, moves, or is interacted with**, this Skill should be used.

## Rule Categories by Priority

*For human/AI reference: follow priority 1→10 to decide which rule category to focus on first; use `--domain <Domain>` to query details when needed. Scripts do not read this table.*

| Priority | Category | Impact | Domain | Key Checks (Must Have) | Anti-Patterns (Avoid) |
|----------|----------|--------|--------|------------------------|------------------------|
| 1 | Accessibility | CRITICAL | `ux` | Contrast 4.5:1, Alt text, Keyboard nav, Aria-labels | Removing focus rings, Icon-only buttons without labels |
| 2 | Touch & Interaction | CRITICAL | `ux` | Min size 44×44px, 8px+ spacing, Loading feedback | Reliance on hover only, Instant state changes (0ms) |
| 3 | Performance | HIGH | `ux` | WebP/AVIF, Lazy loading, Reserve space (CLS &lt; 0.1) | Layout thrashing, Cumulative Layout Shift |
| 4 | Style Selection | HIGH | `style`, `product` | Match product type, Consistency, SVG icons (no emoji) | Mixing flat & skeuomorphic randomly, Emoji as icons |
| 5 | Layout & Responsive | HIGH | `ux` | Mobile-first breakpoints, Viewport meta, No horizontal scroll | Horizontal scroll, Fixed px container widths, Disable zoom |
| 6 | Typography & Color | MEDIUM | `typography`, `color` | Base 16px, Line-height 1.5, Semantic color tokens | Text &lt; 12px body, Gray-on-gray, Raw hex in components |
| 7 | Animation | MEDIUM | `ux` | Duration 150–300ms, Motion conveys meaning, Spatial continuity | Decorative-only animation, Animating width/height, No reduced-motion |
| 8 | Forms & Feedback | MEDIUM | `ux` | Visible labels, Error near field, Helper text, Progressive disclosure | Placeholder-only label, Errors only at top, Overwhelm upfront |
| 9 | Navigation Patterns | HIGH | `ux` | Predictable back, Bottom nav ≤5, Deep linking | Overloaded nav, Broken back behavior, No deep links |
| 10 | Charts & Data | LOW | `chart` | Legends, Tooltips, Accessible colors | Relying on color alone to convey meaning |

## Quick Reference

### 1. Accessibility (CRITICAL)

- `color-contrast` - Minimum 4.5:1 ratio for normal text (large text 3:1); Material Design
- `focus-states` - Visible focus rings on interactive elements (2–4px; Apple HIG, MD)
- `alt-text` - Descriptive alt text for meaningful images
- `aria-labels` - aria-label for icon-only buttons; accessibilityLabel in native (Apple HIG)
- `keyboard-nav` - Tab order matches visual order; full keyboard support (Apple HIG)
- `form-labels` - Use label with for attribute
- `skip-links` - Skip to main content for keyboard users
- `heading-hierarchy` - Sequential h1→h6, no level skip
- `color-not-only` - Don't convey info by color alone (add icon/text)
- `dynamic-type` - Support system text scaling; avoid truncation as text grows (Apple Dynamic Type, MD)
- `reduced-motion` - Respect prefers-reduced-motion; reduce/disable animations when requested (Apple Reduced Motion API, MD)
- `voiceover-sr` - Meaningful accessibilityLabel/accessibilityHint; logical reading order for VoiceOver/screen readers (Apple HIG, MD)
- `escape-routes` - Provide cancel/back in modals and multi-step flows (Apple HIG)
- `keyboard-shortcuts` - Preserve system and a11y shortcuts; offer keyboard alternatives for drag-and-drop (Apple HIG)

### 2. Touch & Interaction (CRITICAL)

- `touch-target-size` - Min 44×44pt (Apple) / 48×48dp (Material); extend hit area beyond visual bounds if needed
- `touch-spacing` - Minimum 8px/8dp gap between touch targets (Apple HIG, MD)
- `hover-vs-tap` - Use click/tap for primary interactions; don't rely on hover alone
- `loading-buttons` - Disable button during async operations; show spinner or progress
- `error-feedback` - Clear error messages near problem
- `cursor-pointer` - Add cursor-pointer to clickable elements (Web)
- `gesture-conflicts` - Avoid horizontal swipe on main content; prefer vertical scroll
- `tap-delay` - Use touch-action: manipulation to reduce 300ms delay (Web)
- `standard-gestures` - Use platform standard gestures consistently; don't redefine (e.g. swipe-back, pinch-zoom) (Apple HIG)
- `system-gestures` - Don't block system gestures (Control Center, back swipe, etc.) (Apple HIG)
- `press-feedback` - Visual feedback on press (ripple/highlight; MD state layers)
- `haptic-feedback` - Use haptic for confirmations and important actions; avoid overuse (Apple HIG)
- `gesture-alternative` - Don't rely on gesture-only interactions; always provide visible controls for critical actions
- `safe-area-awareness` - Keep primary touch targets away from notch, Dynamic Island, gesture bar and screen edges
- `no-precision-required` - Avoid requiring pixel-perfect taps on small icons or thin edges
- `swipe-clarity` - Swipe actions must show clear affordance or hint (chevron, label, tutorial)
- `drag-threshold` - Use a movement threshold before starting drag to avoid accidental drags

### 3. Performance (HIGH)

- `image-optimization` - Use WebP/AVIF, responsive images (srcset/sizes), lazy load non-critical assets
- `image-dimension` - Declare width/height or use aspect-ratio to prevent layout shift (Core Web Vitals: CLS)
- `font-loading` - Use font-display: swap/optional to avoid invisible text (FOIT); reserve space to reduce layout shift (MD)
- `font-preload` - Preload only critical fonts; avoid overusing preload on every variant
- `critical-css` - Prioritize above-the-fold CSS (inline critical CSS or early-loaded stylesheet)
- `lazy-loading` - Lazy load non-hero components via dynamic import / route-level splitting
- `bundle-splitting` - Split code by route/feature (React Suspense / Next.js dynamic) to reduce initial load and TTI
- `third-party-scripts` - Load third-party scripts async/defer; audit and remove unnecessary ones (MD)
- `reduce-reflows` - Avoid frequent layout reads/writes; batch DOM reads then writes
- `content-jumping` - Reserve space for async content to avoid layout jumps (Core Web Vitals: CLS)
- `lazy-load-below-fold` - Use loading="lazy" for below-the-fold images and heavy media
- `virtualize-lists` - Virtualize lists with 50+ items to improve memory efficiency and scroll performance
- `main-thread-budget` - Keep per-frame work under ~16ms for 60fps; move heavy tasks off main thread (HIG, MD)
- `progressive-loading` - Use skeleton screens / shimmer instead of long blocking spinners for >1s operations (Apple HIG)
- `input-latency` - Keep input latency under ~100ms for taps/scrolls (Material responsiveness standard)
- `tap-feedback-speed` - Provide visual feedback within 100ms of tap (Apple HIG)
- `debounce-throttle` - Use debounce/throttle for high-frequency events (scroll, resize, input)
- `offline-support` - Provide offline state messaging and basic fallback (PWA / mobile)
- `network-fallback` - Offer degraded modes for slow networks (lower-res images, fewer animations)

### 4. Style Selection (HIGH)

- `style-match` - Match style to product type (use `--design-system` for recommendations)
- `consistency` - Use same style across all pages
- `no-emoji-icons` - Use SVG icons (Heroicons, Lucide), not emojis
- `color-palette-from-product` - Choose palette from product/industry (search `--domain color`)
- `effects-match-style` - Shadows, blur, radius aligned with chosen style (glass / flat / clay etc.)
- `platform-adaptive` - Respect platform idioms (iOS HIG vs Material): navigation, controls, typography, motion
- `state-clarity` - Make hover/pressed/disabled states visually distinct while staying on-style (Material state layers)
- `elevation-consistent` - Use a consistent elevation/shadow scale for cards, sheets, modals; avoid random shadow values
- `dark-mode-pairing` - Design light/dark variants together to keep brand, contrast, and style consistent
- `icon-style-consistent` - Use one icon set/visual language (stroke width, corner radius) across the product
- `system-controls` - Prefer native/system controls over fully custom ones; only customize when branding requires it (Apple HIG)
- `blur-purpose` - Use blur to indicate background dismissal (modals, sheets), not as decoration (Apple HIG)
- `primary-action` - Each screen should have only one primary CTA; secondary actions visually subordinate (Apple HIG)

### 5. Layout & Responsive (HIGH)

- `viewport-meta` - width=device-width initial-scale=1 (never disable zoom)
- `mobile-first` - Design mobile-first, then scale up to tablet and desktop
- `breakpoint-consistency` - Use systematic breakpoints (e.g. 375 / 768 / 1024 / 1440)
- `readable-font-size` - Minimum 16px body text on mobile (avoids iOS auto-zoom)
- `line-length-control` - Mobile 35–60 chars per line; desktop 60–75 chars
- `horizontal-scroll` - No horizontal scroll on mobile; ensure content fits viewport width
- `spacing-scale` - Use 4pt/8dp incremental spacing system (Material Design)
- `touch-density` - Keep component spacing comfortable for touch: not cramped, not causing mis-taps
- `container-width` - Consistent max-width on desktop (max-w-6xl / 7xl)
- `z-index-management` - Define layered z-index scale (e.g. 0 / 10 / 20 / 40 / 100 / 1000)
- `fixed-element-offset` - Fixed navbar/bottom bar must reserve safe padding for underlying content
- `scroll-behavior` - Avoid nested scroll regions that interfere with the main scroll experience
- `viewport-units` - Prefer min-h-dvh over 100vh on mobile
- `orientation-support` - Keep layout readable and operable in landscape mode
- `content-priority` - Show core content first on mobile; fold or hide secondary content
- `visual-hierarchy` - Establish hierarchy via size, spacing, contrast — not color alone

### 6. Typography & Color (MEDIUM)

- `line-height` - Use 1.5-1.75 for body text
- `line-length` - Limit to 65-75 characters per line
- `font-pairing` - Match heading/body font personalities
- `font-scale` - Consistent type scale (e.g. 12 14 16 18 24 32)
- `contrast-readability` - Darker text on light backgrounds (e.g. slate-900 on white)
- `text-styles-system` - Use platform type system: iOS 11 Dynamic Type styles / Material 5 type roles (display, headline, title, body, label) (HIG, MD)
- `weight-hierarchy` - Use font-weight to reinforce hierarchy: Bold headings (600–700), Regular body (400), Medium labels (500) (MD)
- `color-semantic` - Define semantic color tokens (primary, secondary, error, surface, on-surface) not raw hex in components (Material color system)
- `color-dark-mode` - Dark mode uses desaturated / lighter tonal variants, not inverted colors; test contrast separately (HIG, MD)
- `color-accessible-pairs` - Foreground/background pairs must meet 4.5:1 (AA) or 7:1 (AAA); use tools to verify (WCAG, MD)
- `color-not-decorative-only` - Functional color (error red, success green) must include icon/text; avoid color-only meaning (HIG, MD)
- `truncation-strategy` - Prefer wrapping over truncation; when truncating use ellipsis and provide full text via tooltip/expand (Apple HIG)
- `letter-spacing` - Respect default letter-spacing per platform; avoid tight tracking on body text (HIG, MD)
- `number-tabular` - Use tabular/monospaced figures for data columns, prices, and timers to prevent layout shift
- `whitespace-balance` - Use whitespace intentionally to group related items and separate sections; avoid visual clutter (Apple HIG)

### 7. Animation (MEDIUM)

- `duration-timing` - Use 150–300ms for micro-interactions; complex transitions ≤400ms; avoid >500ms (MD)
- `transform-performance` - Use transform/opacity only; avoid animating width/height/top/left
- `loading-states` - Show skeleton or progress indicator when loading exceeds 300ms
- `excessive-motion` - Animate 1-2 key elements per view max
- `easing` - Use ease-out for entering, ease-in for exiting; avoid linear for UI transitions
- `motion-meaning` - Every animation must express a cause-effect relationship, not just be decorative (Apple HIG)
- `state-transition` - State changes (hover / active / expanded / collapsed / modal) should animate smoothly, not snap
- `continuity` - Page/screen transitions should maintain spatial continuity (shared element, directional slide) (Apple HIG)
- `parallax-subtle` - Use parallax sparingly; must respect reduced-motion and not cause disorientation (Apple HIG)
- `spring-physics` - Prefer spring/physics-based curves over linear or cubic-bezier for natural feel (Apple HIG fluid animations)
- `exit-faster-than-enter` - Exit animations shorter than enter (~60–70% of enter duration) to feel responsive (MD motion)
- `stagger-sequence` - Stagger list/grid item entrance by 30–50ms per item; avoid all-at-once or too-slow reveals (MD)
- `shared-element-transition` - Use shared element / hero transitions for visual continuity between screens (MD, HIG)
- `interruptible` - Animations must be interruptible; user tap/gesture cancels in-progress animation immediately (Apple HIG)
- `no-blocking-animation` - Never block user input during an animation; UI must stay interactive (Apple HIG)
- `fade-crossfade` - Use crossfade for content replacement within the same container (MD)
- `scale-feedback` - Subtle scale (0.95–1.05) on press for tappable cards/buttons; restore on release (HIG, MD)
- `gesture-feedback` - Drag, swipe, and pinch must provide real-time visual response tracking the finger (MD Motion)
- `hierarchy-motion` - Use translate/scale direction to express hierarchy: enter from below = deeper, exit upward = back (MD)
- `motion-consistency` - Unify duration/easing tokens globally; all animations share the same rhythm and feel
- `opacity-threshold` - Fading elements should not linger below opacity 0.2; either fade fully or remain visible
- `modal-motion` - Modals/sheets should animate from their trigger source (scale+fade or slide-in) for spatial context (HIG, MD)
- `navigation-direction` - Forward navigation animates left/up; backward animates right/down — keep direction logically consistent (HIG)
- `layout-shift-avoid` - Animations must not cause layout reflow or CLS; use transform for position changes

### 8. Forms & Feedback (MEDIUM)

- `input-labels` - Visible label per input (not placeholder-only)
- `error-placement` - Show error below the related field
- `submit-feedback` - Loading then success/error state on submit
- `required-indicators` - Mark required fields (e.g. asterisk)
- `empty-states` - Helpful message and action when no content
- `toast-dismiss` - Auto-dismiss toasts in 3-5s
- `confirmation-dialogs` - Confirm before destructive actions
- `input-helper-text` - Provide persistent helper text below complex inputs, not just placeholder (Material Design)
- `disabled-states` - Disabled elements use reduced opacity (0.38–0.5) + cursor change + semantic attribute (MD)
- `progressive-disclosure` - Reveal complex options progressively; don't overwhelm users upfront (Apple HIG)
- `inline-validation` - Validate on blur (not keystroke); show error only after user finishes input (MD)
- `input-type-keyboard` - Use semantic input types (email, tel, number) to trigger the correct mobile keyboard (HIG, MD)
- `password-toggle` - Provide show/hide toggle for password fields (MD)
- `autofill-support` - Use autocomplete / textContentType attributes so the system can autofill (HIG, MD)
- `undo-support` - Allow undo for destructive or bulk actions (e.g. "Undo delete" toast) (Apple HIG)
- `success-feedback` - Confirm completed actions with brief visual feedback (checkmark, toast, color flash) (MD)
- `error-recovery` - Error messages must include a clear recovery path (retry, edit, help link) (HIG, MD)
- `multi-step-progress` - Multi-step flows show step indicator or progress bar; allow back navigation (MD)
- `form-autosave` - Long forms should auto-save drafts to prevent data loss on accidental dismissal (Apple HIG)
- `sheet-dismiss-confirm` - Confirm before dismissing a sheet/modal with unsaved changes (Apple HIG)
- `error-clarity` - Error messages must state cause + how to fix (not just "Invalid input") (HIG, MD)
- `field-grouping` - Group related fields logically (fieldset/legend or visual grouping) (MD)
- `read-only-distinction` - Read-only state should be visually and semantically different from disabled (MD)
- `focus-management` - After submit error, auto-focus the first invalid field (WCAG, MD)
- `error-summary` - For multiple errors, show summary at top with anchor links to each field (WCAG)
- `touch-friendly-input` - Mobile input height ≥44px to meet touch target requirements (Apple HIG)
- `destructive-emphasis` - Destructive actions use semantic danger color (red) and are visually separated from primary actions (HIG, MD)
- `toast-accessibility` - Toasts must not steal focus; use aria-live="polite" for screen reader announcement (WCAG)
- `aria-live-errors` - Form errors use aria-live region or role="alert" to notify screen readers (WCAG)
- `contrast-feedback` - Error and success state colors must meet 4.5:1 contrast ratio (WCAG, MD)
- `timeout-feedback` - Request timeout must show clear feedback with retry option (MD)

### 9. Navigation Patterns (HIGH)

- `bottom-nav-limit` - Bottom navigation max 5 items; use labels with icons (Material Design)
- `drawer-usage` - Use drawer/sidebar for secondary navigation, not primary actions (Material Design)
- `back-behavior` - Back navigation must be predictable and consistent; preserve scroll/state (Apple HIG, MD)
- `deep-linking` - All key screens must be reachable via deep link / URL for sharing and notifications (Apple HIG, MD)
- `tab-bar-ios` - iOS: use bottom Tab Bar for top-level navigation (Apple HIG)
- `top-app-bar-android` - Android: use Top App Bar with navigation icon for primary structure (Material Design)
- `nav-label-icon` - Navigation items must have both icon and text label; icon-only nav harms discoverability (MD)
- `nav-state-active` - Current location must be visually highlighted (color, weight, indicator) in navigation (HIG, MD)
- `nav-hierarchy` - Primary nav (tabs/bottom bar) vs secondary nav (drawer/settings) must be clearly separated (MD)
- `modal-escape` - Modals and sheets must offer a clear close/dismiss affordance; swipe-down to dismiss on mobile (Apple HIG)
- `search-accessible` - Search must be easily reachable (top bar or tab); provide recent/suggested queries (MD)
- `breadcrumb-web` - Web: use breadcrumbs for 3+ level deep hierarchies to aid orientation (MD)
- `state-preservation` - Navigating back must restore previous scroll position, filter state, and input (HIG, MD)
- `gesture-nav-support` - Support system gesture navigation (iOS swipe-back, Android predictive back) without conflict (HIG, MD)
- `tab-badge` - Use badges on nav items sparingly to indicate unread/pending; clear after user visits (HIG, MD)
- `overflow-menu` - When actions exceed available space, use overflow/more menu instead of cramming (MD)
- `bottom-nav-top-level` - Bottom nav is for top-level screens only; never nest sub-navigation inside it (MD)
- `adaptive-navigation` - Large screens (≥1024px) prefer sidebar; small screens use bottom/top nav (Material Adaptive)
- `back-stack-integrity` - Never silently reset the navigation stack or unexpectedly jump to home (HIG, MD)
- `navigation-consistency` - Navigation placement must stay the same across all pages; don't change by page type
- `avoid-mixed-patterns` - Don't mix Tab + Sidebar + Bottom Nav at the same hierarchy level
- `modal-vs-navigation` - Modals must not be used for primary navigation flows; they break the user's path (HIG)
- `focus-on-route-change` - After page transition, move focus to main content region for screen reader users (WCAG)
- `persistent-nav` - Core navigation must remain reachable from deep pages; don't hide it entirely in sub-flows (HIG, MD)
- `destructive-nav-separation` - Dangerous actions (delete account, logout) must be visually and spatially separated from normal nav items (HIG, MD)
- `empty-nav-state` - When a nav destination is unavailable, explain why instead of silently hiding it (MD)

### 10. Charts & Data (LOW)

- `chart-type` - Match chart type to data type (trend → line, comparison → bar, proportion → pie/donut)
- `color-guidance` - Use accessible color palettes; avoid red/green only pairs for colorblind users (WCAG, MD)
- `data-table` - Provide table alternative for accessibility; charts alone are not screen-reader friendly (WCAG)
- `pattern-texture` - Supplement color with patterns, textures, or shapes so data is distinguishable without color (WCAG, MD)
- `legend-visible` - Always show legend; position near the chart, not detached below a scroll fold (MD)
- `tooltip-on-interact` - Provide tooltips/data labels on hover (Web) or tap (mobile) showing exact values (HIG, MD)
- `axis-labels` - Label axes with units and readable scale; avoid truncated or rotated labels on mobile
- `responsive-chart` - Charts must reflow or simplify on small screens (e.g. horizontal bar instead of vertical, fewer ticks)
- `empty-data-state` - Show meaningful empty state when no data exists ("No data yet" + guidance), not a blank chart (MD)
- `loading-chart` - Use skeleton or shimmer placeholder while chart data loads; don't show an empty axis frame
- `animation-optional` - Chart entrance animations must respect prefers-reduced-motion; data should be readable immediately (HIG)
- `large-dataset` - For 1000+ data points, aggregate or sample; provide drill-down for detail instead of rendering all (MD)
- `number-formatting` - Use locale-aware formatting for numbers, dates, currencies on axes and labels (HIG, MD)
- `touch-target-chart` - Interactive chart elements (points, segments) must have ≥44pt tap area or expand on touch (Apple HIG)
- `no-pie-overuse` - Avoid pie/donut for >5 categories; switch to bar chart for clarity
- `contrast-data` - Data lines/bars vs background ≥3:1; data text labels ≥4.5:1 (WCAG)
- `legend-interactive` - Legends should be clickable to toggle series visibility (MD)
- `direct-labeling` - For small datasets, label values directly on the chart to reduce eye travel
- `tooltip-keyboard` - Tooltip content must be keyboard-reachable and not rely on hover alone (WCAG)
- `sortable-table` - Data tables must support sorting with aria-sort indicating current sort state (WCAG)
- `axis-readability` - Axis ticks must not be cramped; maintain readable spacing, auto-skip on small screens
- `data-density` - Limit information density per chart to avoid cognitive overload; split into multiple charts if needed
- `trend-emphasis` - Emphasize data trends over decoration; avoid heavy gradients/shadows that obscure the data
- `gridline-subtle` - Grid lines should be low-contrast (e.g. gray-200) so they don't compete with data
- `focusable-elements` - Interactive chart elements (points, bars, slices) must be keyboard-navigable (WCAG)
- `screen-reader-summary` - Provide a text summary or aria-label describing the chart's key insight for screen readers (WCAG)
- `error-state-chart` - Data load failure must show error message with retry action, not a broken/empty chart
- `export-option` - For data-heavy products, offer CSV/image export of chart data
- `drill-down-consistency` - Drill-down interactions must maintain a clear back-path and hierarchy breadcrumb
- `time-scale-clarity` - Time series charts must clearly label time granularity (day/week/month) and allow switching

## How to Use

Search specific domains using the CLI tool below.

---

## Prerequisites

Check if Python is installed:

```bash
python3 --version || python --version
```

If Python is not installed, install it based on user's OS:

**macOS:**
```bash
brew install python3
```

**Ubuntu/Debian:**
```bash
sudo apt update && sudo apt install python3
```

**Windows:**
```powershell
winget install Python.Python.3.12
```

> **Note:** On Windows, use `python` instead of `python3` to run scripts (e.g., `python scripts/search.py` instead of `python3 scripts/search.py`).

---

## How to Use This Skill

Use this skill when the user requests any of the following:

| Scenario | Trigger Examples | Start From |
|----------|-----------------|------------|
| **New project / page** | "Build a landing page", "Build a dashboard" | Step 1 → Step 2 (design system) |
| **New component** | "Create a pricing card", "Add a modal" | Step 3 (domain search: style, ux) |
| **Choose style / color / font** | "What style fits a fintech app?", "Recommend a color palette" | Step 2 (design system) |
| **Review existing UI** | "Review this page for UX issues", "Check accessibility" | Quick Reference checklist above |
| **Fix a UI bug** | "Button hover is broken", "Layout shifts on load" | Quick Reference → relevant section |
| **Improve / optimize** | "Make this faster", "Improve mobile experience" | Step 3 (domain search: ux, react) |
| **Implement dark mode** | "Add dark mode support" | Step 3 (domain: style "dark mode") |
| **Add charts / data viz** | "Add an analytics dashboard chart" | Step 3 (domain: chart) |
| **Stack best practices** | "React performance tips"、"SwiftUI navigation" | Step 4 (stack search) |

Follow this workflow:

### Step 1: Analyze User Requirements

Extract key information from user request:
- **Product type**: Entertainment (social, video, music, gaming), Tool (scanner, editor, converter), Productivity (task manager, notes, calendar), or hybrid
- **Target audience**: C-end consumer users; consider age group, usage context (commute, leisure, work)
- **Style keywords**: playful, vibrant, minimal, dark mode, content-first, immersive, etc.
- **Stack**: Match the project's framework. The engine ships guidance for many stacks (see [Available Stacks](#available-stacks) below) — pass the matching `--stack` (e.g. `nextjs`, `react`, `shadcn`, `vue`, `svelte`, `astro`, `swiftui`, `flutter`, `react-native`).

### Step 2: Generate Design System (REQUIRED)

**Always start with `--design-system`** to get comprehensive recommendations with reasoning:

```bash
python3 skills/ui-ux-pro-max/scripts/search.py "<product_type> <industry> <keywords>" --design-system [-p "Project Name"]
```

This command:
1. Searches domains in parallel (product, style, color, landing, typography)
2. Applies reasoning rules from `ui-reasoning.csv` to select best matches
3. Returns complete design system: pattern, style, colors, typography, effects
4. Includes anti-patterns to avoid

**Example:**
```bash
python3 skills/ui-ux-pro-max/scripts/search.py "beauty spa wellness service" --design-system -p "Serenity Spa"
```

### Step 2b: Persist Design System (Master + Overrides Pattern)

To save the design system for **hierarchical retrieval across sessions**, add `--persist`:

```bash
python3 skills/ui-ux-pro-max/scripts/search.py "<query>" --design-system --persist -p "Project Name"
```

This creates:
- `design-system/MASTER.md` — Global Source of Truth with all design rules
- `design-system/pages/` — Folder for page-specific overrides

**With page-specific override:**
```bash
python3 skills/ui-ux-pro-max/scripts/search.py "<query>" --design-system --persist -p "Project Name" --page "dashboard"
```

This also creates:
- `design-system/pages/dashboard.md` — Page-specific deviations from Master

**How hierarchical retrieval works:**
1. When building a specific page (e.g., "Checkout"), first check `design-system/pages/checkout.md`
2. If the page file exists, its rules **override** the Master file
3. If not, use `design-system/MASTER.md` exclusively

**Context-aware retrieval prompt:**
```
I am building the [Page Name] page. Please read design-system/MASTER.md.
Also check if design-system/pages/[page-name].md exists.
If the page file exists, prioritize its rules.
If not, use the Master rules exclusively.
Now, generate the code...
```

### Step 3: Supplement with Detailed Searches (as needed)

After getting the design system, use domain searches to get additional details:

```bash
python3 skills/ui-ux-pro-max/scripts/search.py "<keyword>" --domain <domain> [-n <max_results>]
```

**When to use detailed searches:**

| Need | Domain | Example |
|------|--------|---------|
| Product type patterns | `product` | `--domain product "entertainment social"` |
| More style options | `style` | `--domain style "glassmorphism dark"` |
| Color palettes | `color` | `--domain color "entertainment vibrant"` |
| Font pairings | `typography` | `--domain typography "playful modern"` |
| Chart recommendations | `chart` | `--domain chart "real-time dashboard"` |
| UX best practices | `ux` | `--domain ux "animation accessibility"` |
| Alternative fonts | `typography` | `--domain typography "elegant luxury"` |
| Individual Google Fonts | `google-fonts` | `--domain google-fonts "sans serif popular variable"` |
| Landing structure | `landing` | `--domain landing "hero social-proof"` |
| React Native perf | `react` | `--domain react "rerender memo list"` |
| App interface a11y | `web` | `--domain web "accessibilityLabel touch safe-areas"` |
| AI prompt / CSS keywords | `prompt` | `--domain prompt "minimalism"` |

### Step 4: Stack Guidelines (match your framework)

Get implementation-specific best practices for the stack you're building in.
Pass the `--stack` that matches the project's framework:

```bash
python3 skills/ui-ux-pro-max/scripts/search.py "<keyword>" --stack <your-stack>
# e.g. --stack nextjs | react | shadcn | vue | svelte | astro | swiftui | flutter | react-native
```

---

## Search Reference

### Available Domains

| Domain | Use For | Example Keywords |
|--------|---------|------------------|
| `product` | Product type recommendations | SaaS, e-commerce, portfolio, healthcare, beauty, service |
| `style` | UI styles, colors, effects | glassmorphism, minimalism, dark mode, brutalism |
| `typography` | Font pairings, Google Fonts | elegant, playful, professional, modern |
| `color` | Color palettes by product type | saas, ecommerce, healthcare, beauty, fintech, service |
| `landing` | Page structure, CTA strategies | hero, hero-centric, testimonial, pricing, social-proof |
| `chart` | Chart types, library recommendations | trend, comparison, timeline, funnel, pie |
| `ux` | Best practices, anti-patterns | animation, accessibility, z-index, loading |
| `google-fonts` | Individual Google Fonts lookup | sans serif, monospace, japanese, variable font, popular |
| `react` | React/Next.js performance | waterfall, bundle, suspense, memo, rerender, cache |
| `web` | App interface guidelines (iOS/Android/React Native) | accessibilityLabel, touch targets, safe areas, Dynamic Type |
| `prompt` | AI prompts, CSS keywords | (style name) |

### Available Stacks

Run `ls <skill>/data/stacks/` to see the live set. Shipped stacks:

| Stack | Focus |
|-------|-------|
| `react` | Components, hooks, render performance |
| `nextjs` | App Router, RSC, Server Actions, rendering |
| `vue` | Components, Composition API, reactivity |
| `nuxtjs` | Nuxt app patterns, SSR data fetching |
| `nuxt-ui` | Nuxt UI component patterns |
| `svelte` | Components, stores, transitions |
| `astro` | Islands, content, partial hydration |
| `shadcn` | shadcn/ui primitives, composition |
| `html-tailwind` | Tailwind utility patterns |
| `angular` | Components, signals, services |
| `laravel` | Blade / server-rendered UI patterns |
| `swiftui` | Views, state, navigation (iOS/macOS) |
| `flutter` | Widgets, state, navigation |
| `jetpack-compose` | Composables, state, navigation (Android) |
| `react-native` | Components, Navigation, Lists |
| `threejs` | 3D scenes, materials, performance |

---

## Example Workflow

**User request:** "Make an AI search homepage."

### Step 1: Analyze Requirements
- Product type: Tool (AI search engine)
- Target audience: C-end users looking for fast, intelligent search
- Style keywords: modern, minimal, content-first, dark mode
- Stack: Next.js (a homepage is a web surface; use a web `--stack`)

### Step 2: Generate Design System (REQUIRED)

```bash
python3 skills/ui-ux-pro-max/scripts/search.py "AI search tool modern minimal" --design-system -p "AI Search"
```

**Output:** Complete design system with pattern, style, colors, typography, effects, and anti-patterns.

### Step 3: Supplement with Detailed Searches (as needed)

```bash
# Get style options for a modern tool product
python3 skills/ui-ux-pro-max/scripts/search.py "minimalism dark mode" --domain style

# Get UX best practices for search interaction and loading
python3 skills/ui-ux-pro-max/scripts/search.py "search loading animation" --domain ux
```

### Step 4: Stack Guidelines

```bash
python3 skills/ui-ux-pro-max/scripts/search.py "list performance navigation" --stack nextjs
```

**Then:** Synthesize design system + detailed searches and implement the design.

---

## Output Formats

The `--design-system` flag supports two output formats:

```bash
# ASCII box (default) - best for terminal display
python3 skills/ui-ux-pro-max/scripts/search.py "fintech crypto" --design-system

# Markdown - best for documentation
python3 skills/ui-ux-pro-max/scripts/search.py "fintech crypto" --design-system -f markdown
```

---

## Tips for Better Results

### Query Strategy

- Use **multi-dimensional keywords** — combine product + industry + tone + density: `"entertainment social vibrant content-dense"` not just `"app"`
- Try different keywords for the same need: `"playful neon"` → `"vibrant dark"` → `"content-first minimal"`
- Use `--design-system` first for full recommendations, then `--domain` to deep-dive any dimension you're unsure about
- Add the `--stack` that matches the project's framework for implementation-specific guidance

### Common Sticking Points

| Problem | What to Do |
|---------|------------|
| Can't decide on style/color | Re-run `--design-system` with different keywords |
| Dark mode contrast issues | Quick Reference §6: `color-dark-mode` + `color-accessible-pairs` |
| Animations feel unnatural | Quick Reference §7: `spring-physics` + `easing` + `exit-faster-than-enter` |
| Form UX is poor | Quick Reference §8: `inline-validation` + `error-clarity` + `focus-management` |
| Navigation feels confusing | Quick Reference §9: `nav-hierarchy` + `bottom-nav-limit` + `back-behavior` |
| Layout breaks on small screens | Quick Reference §5: `mobile-first` + `breakpoint-consistency` |
| Performance / jank | Quick Reference §3: `virtualize-lists` + `main-thread-budget` + `debounce-throttle` |

### Pre-Delivery Checklist

- Run `--domain ux "animation accessibility z-index loading"` as a UX validation pass before implementation
- Run through Quick Reference **§1–§3** (CRITICAL + HIGH) as a final review
- Test on 375px (small phone) and landscape orientation
- Verify behavior with **reduced-motion** enabled and **Dynamic Type** at largest size
- Check dark mode contrast independently (don't assume light mode values work)
- Confirm all touch targets ≥44pt and no content hidden behind safe areas

---

## Common Rules for Professional UI

These are frequently overlooked issues that make UI look unprofessional:
Scope notice: The rules below are for App UI (iOS/Android/React Native/Flutter), not desktop-web interaction patterns.

### Icons & Visual Elements

| Rule | Standard | Avoid | Why It Matters |
|------|----------|--------|----------------|
| **No Emoji as Structural Icons** | Use vector-based icons (e.g., Lucide, react-native-vector-icons, @expo/vector-icons). | Using emojis (🎨 🚀 ⚙️) for navigation, settings, or system controls. | Emojis are font-dependent, inconsistent across platforms, and cannot be controlled via design tokens. |
| **Vector-Only Assets** | Use SVG or platform vector icons that scale cleanly and support theming. | Raster PNG icons that blur or pixelate. | Ensures scalability, crisp rendering, and dark/light mode adaptability. |
| **Stable Interaction States** | Use color, opacity, or elevation transitions for press states without changing layout bounds. | Layout-shifting transforms that move surrounding content or trigger visual jitter. | Prevents unstable interactions and preserves smooth motion/perceived quality on mobile. |
| **Correct Brand Logos** | Use official brand assets and follow their usage guidelines (spacing, color, clear space). | Guessing logo paths, recoloring unofficially, or modifying proportions. | Prevents brand misuse and ensures legal/platform compliance. |
| **Consistent Icon Sizing** | Define icon sizes as design tokens (e.g., icon-sm, icon-md = 24pt, icon-lg). | Mixing arbitrary values like 20pt / 24pt / 28pt randomly. | Maintains rhythm and visual hierarchy across the interface. |
| **Stroke Consistency** | Use a consistent stroke width within the same visual layer (e.g., 1.5px or 2px). | Mixing thick and thin stroke styles arbitrarily. | Inconsistent strokes reduce perceived polish and cohesion. |
| **Filled vs Outline Discipline** | Use one icon style per hierarchy level. | Mixing filled and outline icons at the same hierarchy level. | Maintains semantic clarity and stylistic coherence. |
| **Touch Target Minimum** | Minimum 44×44pt interactive area (use hitSlop if icon is smaller). | Small icons without expanded tap area. | Meets accessibility and platform usability standards. |
| **Icon Alignment** | Align icons to text baseline and maintain consistent padding. | Misaligned icons or inconsistent spacing around them. | Prevents subtle visual imbalance that reduces perceived quality. |
| **Icon Contrast** | Follow WCAG contrast standards: 4.5:1 for small elements, 3:1 minimum for larger UI glyphs. | Low-contrast icons that blend into the background. | Ensures accessibility in both light and dark modes. |


### Interaction (App)

| Rule | Do | Don't |
|------|----|----- |
| **Tap feedback** | Provide clear pressed feedback (ripple/opacity/elevation) within 80-150ms | No visual response on tap |
| **Animation timing** | Keep micro-interactions around 150-300ms with platform-native easing | Instant transitions or slow animations (>500ms) |
| **Accessibility focus** | Ensure screen reader focus order matches visual order and labels are descriptive | Unlabeled controls or confusing focus traversal |
| **Disabled state clarity** | Use disabled semantics (`disabled`/native disabled props), reduced emphasis, and no tap action | Controls that look tappable but do nothing |
| **Touch target minimum** | Keep tap areas >=44x44pt (iOS) or >=48x48dp (Android), expand hit area when icon is smaller | Tiny tap targets or icon-only hit areas without padding |
| **Gesture conflict prevention** | Keep one primary gesture per region and avoid nested tap/drag conflicts | Overlapping gestures causing accidental actions |
| **Semantic native controls** | Prefer native interactive primitives (`Button`, `Pressable`, platform equivalents) with proper accessibility roles | Generic containers used as primary controls without semantics |

### Light/Dark Mode Contrast

| Rule | Do | Don't |
|------|----|----- |
| **Surface readability (light)** | Keep cards/surfaces clearly separated from background with sufficient opacity/elevation | Overly transparent surfaces that blur hierarchy |
| **Text contrast (light)** | Maintain body text contrast >=4.5:1 against light surfaces | Low-contrast gray body text |
| **Text contrast (dark)** | Maintain primary text contrast >=4.5:1 and secondary text >=3:1 on dark surfaces | Dark mode text that blends into background |
| **Border and divider visibility** | Ensure separators are visible in both themes (not just light mode) | Theme-specific borders disappearing in one mode |
| **State contrast parity** | Keep pressed/focused/disabled states equally distinguishable in light and dark themes | Defining interaction states for one theme only |
| **Token-driven theming** | Use semantic color tokens mapped per theme across app surfaces/text/icons | Hardcoded per-screen hex values |
| **Scrim and modal legibility** | Use a modal scrim strong enough to isolate foreground content (typically 40-60% black) | Weak scrim that leaves background visually competing |

### Layout & Spacing

| Rule | Do | Don't |
|------|----|----- |
| **Safe-area compliance** | Respect top/bottom safe areas for all fixed headers, tab bars, and CTA bars | Placing fixed UI under notch, status bar, or gesture area |
| **System bar clearance** | Add spacing for status/navigation bars and gesture home indicator | Let tappable content collide with OS chrome |
| **Consistent content width** | Keep predictable content width per device class (phone/tablet) | Mixing arbitrary widths between screens |
| **8dp spacing rhythm** | Use a consistent 4/8dp spacing system for padding/gaps/section spacing | Random spacing increments with no rhythm |
| **Readable text measure** | Keep long-form text readable on large devices (avoid edge-to-edge paragraphs on tablets) | Full-width long text that hurts readability |
| **Section spacing hierarchy** | Define clear vertical rhythm tiers (e.g., 16/24/32/48) by hierarchy | Similar UI levels with inconsistent spacing |
| **Adaptive gutters by breakpoint** | Increase horizontal insets on larger widths and in landscape | Same narrow gutter on all device sizes/orientations |
| **Scroll and fixed element coexistence** | Add bottom/top content insets so lists are not hidden behind fixed bars | Scroll content obscured by sticky headers/footers |

---

## Pre-Delivery Checklist

Before delivering UI code, verify these items:
Scope notice: This checklist is for App UI (iOS/Android/React Native/Flutter).

### Visual Quality
- [ ] No emojis used as icons (use SVG instead)
- [ ] All icons come from a consistent icon family and style
- [ ] Official brand assets are used with correct proportions and clear space
- [ ] Pressed-state visuals do not shift layout bounds or cause jitter
- [ ] Semantic theme tokens are used consistently (no ad-hoc per-screen hardcoded colors)

### Interaction
- [ ] All tappable elements provide clear pressed feedback (ripple/opacity/elevation)
- [ ] Touch targets meet minimum size (>=44x44pt iOS, >=48x48dp Android)
- [ ] Micro-interaction timing stays in the 150-300ms range with native-feeling easing
- [ ] Disabled states are visually clear and non-interactive
- [ ] Screen reader focus order matches visual order, and interactive labels are descriptive
- [ ] Gesture regions avoid nested/conflicting interactions (tap/drag/back-swipe conflicts)

### Light/Dark Mode
- [ ] Primary text contrast >=4.5:1 in both light and dark mode
- [ ] Secondary text contrast >=3:1 in both light and dark mode
- [ ] Dividers/borders and interaction states are distinguishable in both modes
- [ ] Modal/drawer scrim opacity is strong enough to preserve foreground legibility (typically 40-60% black)
- [ ] Both themes are tested before delivery (not inferred from a single theme)

### Layout
- [ ] Safe areas are respected for headers, tab bars, and bottom CTA bars
- [ ] Scroll content is not hidden behind fixed/sticky bars
- [ ] Verified on small phone, large phone, and tablet (portrait + landscape)
- [ ] Horizontal insets/gutters adapt correctly by device size and orientation
- [ ] 4/8dp spacing rhythm is maintained across component, section, and page levels
- [ ] Long-form text measure remains readable on larger devices (no edge-to-edge paragraphs)

### Accessibility
- [ ] All meaningful images/icons have accessibility labels
- [ ] Form fields have labels, hints, and clear error messages
- [ ] Color is not the only indicator
- [ ] Reduced motion and dynamic text size are supported without layout breakage
- [ ] Accessibility traits/roles/states (selected, disabled, expanded) are announced correctly



---



---
name: valtio
description: "Use valtio from the pmndrs ecosystem."
---

# Skill: Valtio

> Category: Frontend Engineering
> Priority: High

---

## Description

<code>npm install valtio</code> makes proxy-state simple This skill provides the essential guidance, workflow, anti-patterns, and verification checklist needed to use Valtio correctly within the pmndrs ecosystem and within DevinOS projects.

## Purpose

Reduce implementation risk and accelerate development by applying the correct patterns, configuration, and integration steps for Valtio. The goal is to produce code that is performant, maintainable, and aligned with the official documentation.

## Trigger

Use this skill when:

- Building a feature that depends on Valtio.
- Deciding whether Valtio is the right tool for the current architecture.
- Reviewing, debugging, or refactoring code that uses Valtio.
- Integrating Valtio with other pmndrs libraries or React patterns.
- Setting up a new project or adding the library to an existing project.
- Evaluating performance, accessibility, or SSR implications of Valtio.

## Context

- Project framework, version, and build tooling.
- Target devices and performance budgets (desktop, mobile, VR/AR).
- Related libraries already in use (React, Three.js, state managers, animation libraries).
- Client-only versus SSR constraints.
- Existing component structure and coding standards.
- Need for TypeScript types, tests, and documentation.
- License and compatibility requirements.

## Workflow

1. Confirm the problem or feature that requires Valtio.
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
import * as Lib from 'valtio'

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

- Using Valtio without understanding its primary use case and trade-offs.
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

- Repository: https://github.com/pmndrs/valtio
- data/readme.md Ã¢â‚¬â€ latest README from Valtio
- data/docs/ Ã¢â‚¬â€ latest documentation from Valtio
- LICENSE Ã¢â‚¬â€ license of Valtio


---



---
name: verification
description: "Rigorous validation that a task is truly complete and correct."
---

# Skill: Verification
> Category: Core Engineering
> Priority: Critical

---

## Description

Rigorous validation that a task is truly complete and correct.

## Purpose

Prevent false confidence. Never claim success without evidence.

## Trigger

Use this skill when:
- Declaring a task complete
- Preparing a pull request
- Before merging code
- Before deploying to production
- After any significant change

## Context

- Requirements and acceptance criteria
- Test results
- Security checklist
- Performance benchmarks
- Documentation state

## Workflow

1. **Re-read Requirements** - Does the implementation match exactly?
2. **Run All Tests** - Unit, integration, e2e. All must pass.
3. **Check Linting** - No style violations.
4. **Manual Verification** - Test the feature manually if needed.
5. **Security Check** - Inputs validated? Secrets safe?
6. **Performance Check** - No regressions?
7. **Documentation Check** - README updated? API docs current?
8. **Git Check** - Clean history? No secrets in diff?
9. **Peer Review** - Has another person reviewed?
10. **Sign Off** - Only then declare complete.

## Examples

### Good

```
Task: Add email validation to signup form

Verification:
[x] Unit tests for validator pass (12 tests)
[x] Integration test for signup flow passes
[x] Manual test: invalid email shows error
[x] Manual test: valid email proceeds
[x] No secrets in code
[x] README updated with validation rules
[x] Commit history clean
[x] Reviewed by @teammate
```

### Bad

```
Task done. It works on my machine.
```

## Anti-patterns

- Claiming completion without running tests
- Skipping manual verification for UI changes
- Ignoring lint errors
- Not checking for secrets
- Skipping peer review

## Verification

- [ ] Have all tests been run?
- [ ] Have you manually verified the feature?
- [ ] Is documentation updated?
- [ ] Is the git history clean?

## References

- [Definition of Done by Scrum.org](https://www.scrum.org/resources/blog/done-understanding-definition-done)
- [Checklist Manifesto by Atul Gawande](https://atulgawande.com/book/the-checklist-manifesto/)


---





---



---
name: viverse
description: "Use @react-three/viverse from the pmndrs ecosystem."
---

# Skill: Viverse

> Category: Frontend Engineering
> Priority: High

---

## Description

<h1 align="center">@react-three/viverse</h1> This skill provides the essential guidance, workflow, anti-patterns, and verification checklist needed to use Viverse correctly within the pmndrs ecosystem and within DevinOS projects.

## Purpose

Reduce implementation risk and accelerate development by applying the correct patterns, configuration, and integration steps for Viverse. The goal is to produce code that is performant, maintainable, and aligned with the official documentation.

## Trigger

Use this skill when:

- Building a feature that depends on Viverse.
- Deciding whether Viverse is the right tool for the current architecture.
- Reviewing, debugging, or refactoring code that uses Viverse.
- Integrating Viverse with other pmndrs libraries or React patterns.
- Setting up a new project or adding the library to an existing project.
- Evaluating performance, accessibility, or SSR implications of Viverse.

## Context

- Project framework, version, and build tooling.
- Target devices and performance budgets (desktop, mobile, VR/AR).
- Related libraries already in use (React, Three.js, state managers, animation libraries).
- Client-only versus SSR constraints.
- Existing component structure and coding standards.
- Need for TypeScript types, tests, and documentation.
- License and compatibility requirements.

## Workflow

1. Confirm the problem or feature that requires Viverse.
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
import * as Lib from 'viverse'

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

- Using Viverse without understanding its primary use case and trade-offs.
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

- Repository: https://github.com/pmndrs/viverse
- data/readme.md Ã¢â‚¬â€ latest README from Viverse
- data/docs/ Ã¢â‚¬â€ latest documentation from Viverse
- LICENSE Ã¢â‚¬â€ license of Viverse


---



---
name: xr
description: "Use xr from the pmndrs ecosystem."
---

# Skill: Xr

> Category: Frontend Engineering
> Priority: High

---

## Description

<h1 align="center">xr</h1> This skill provides the essential guidance, workflow, anti-patterns, and verification checklist needed to use Xr correctly within the pmndrs ecosystem and within DevinOS projects.

## Purpose

Reduce implementation risk and accelerate development by applying the correct patterns, configuration, and integration steps for Xr. The goal is to produce code that is performant, maintainable, and aligned with the official documentation.

## Trigger

Use this skill when:

- Building a feature that depends on Xr.
- Deciding whether Xr is the right tool for the current architecture.
- Reviewing, debugging, or refactoring code that uses Xr.
- Integrating Xr with other pmndrs libraries or React patterns.
- Setting up a new project or adding the library to an existing project.
- Evaluating performance, accessibility, or SSR implications of Xr.

## Context

- Project framework, version, and build tooling.
- Target devices and performance budgets (desktop, mobile, VR/AR).
- Related libraries already in use (React, Three.js, state managers, animation libraries).
- Client-only versus SSR constraints.
- Existing component structure and coding standards.
- Need for TypeScript types, tests, and documentation.
- License and compatibility requirements.

## Workflow

1. Confirm the problem or feature that requires Xr.
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
import * as Lib from 'xr'

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

- Using Xr without understanding its primary use case and trade-offs.
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

- Repository: https://github.com/pmndrs/xr
- data/readme.md Ã¢â‚¬â€ latest README from Xr
- data/docs/ Ã¢â‚¬â€ latest documentation from Xr
- LICENSE Ã¢â‚¬â€ license of Xr


---



---
name: zustand
description: "Use zustand from the pmndrs ecosystem."
---

# Skill: Zustand

> Category: Frontend Engineering
> Priority: High

---

## Description

<a href="https://dai-shi.github.io/zustand-banner-sponsorship/sponsors/" target="_blank" rel="noopener"> This skill provides the essential guidance, workflow, anti-patterns, and verification checklist needed to use Zustand correctly within the pmndrs ecosystem and within DevinOS projects.

## Purpose

Reduce implementation risk and accelerate development by applying the correct patterns, configuration, and integration steps for Zustand. The goal is to produce code that is performant, maintainable, and aligned with the official documentation.

## Trigger

Use this skill when:

- Building a feature that depends on Zustand.
- Deciding whether Zustand is the right tool for the current architecture.
- Reviewing, debugging, or refactoring code that uses Zustand.
- Integrating Zustand with other pmndrs libraries or React patterns.
- Setting up a new project or adding the library to an existing project.
- Evaluating performance, accessibility, or SSR implications of Zustand.

## Context

- Project framework, version, and build tooling.
- Target devices and performance budgets (desktop, mobile, VR/AR).
- Related libraries already in use (React, Three.js, state managers, animation libraries).
- Client-only versus SSR constraints.
- Existing component structure and coding standards.
- Need for TypeScript types, tests, and documentation.
- License and compatibility requirements.

## Workflow

1. Confirm the problem or feature that requires Zustand.
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
import * as Lib from 'zustand'

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

- Using Zustand without understanding its primary use case and trade-offs.
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

- Repository: https://github.com/pmndrs/zustand
- data/readme.md Ã¢â‚¬â€ latest README from Zustand
- data/docs/ Ã¢â‚¬â€ latest documentation from Zustand
- LICENSE Ã¢â‚¬â€ license of Zustand


---




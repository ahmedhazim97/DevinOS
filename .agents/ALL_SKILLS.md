# DevinOS — All Global Skills (26)

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

# Skill: UI/UX Pro Max

> Category: Frontend Design
> Priority: High
> Source: https://github.com/nextlevelbuilder/ui-ux-pro-max-skill
> Author: NextLevelBuilder
> License: MIT

---

## Description

AI-powered design intelligence with 84 UI styles, 161 color palettes, 73 font pairings, 99 UX guidelines, and 25 chart types across 17 tech stacks.

## Purpose

Provide advanced UI/UX design guidance, visual systems, accessibility, typography, palette, chart, and frontend styling resources for AI coding agents.

## Trigger

Use this skill when:
- Designing or improving application UI/UX
- Creating visual systems, color palettes, typography, dashboards, or charts
- Implementing accessible frontend interfaces
- Reviewing UI quality, responsiveness, layout, or design consistency

## Context

- Original upstream project: nextlevelbuilder/ui-ux-pro-max-skill
- Included as a DevinOS skill with original MIT attribution preserved
- Supporting files live in `.agents/skills/ui-ux-pro-max/`

## Workflow

1. Identify the target interface, audience, and platform.
2. Select appropriate visual style, palette, typography, and component patterns.
3. Apply accessibility, responsiveness, hierarchy, and consistency checks.
4. Use the bundled references and sub-skills for implementation guidance.
5. Verify the final UI against UX, accessibility, and frontend quality criteria.

## Verification

- [ ] Is the design accessible and responsive?
- [ ] Are visual hierarchy and spacing consistent?
- [ ] Are colors and typography appropriate for the product?
- [ ] Are upstream attribution and license preserved?

## References

- [UI/UX Pro Max](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill)
- `.agents/skills/ui-ux-pro-max/README.md`
- `.agents/skills/ui-ux-pro-max/LICENSE`
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

- `data/components.csv` — component selection guide
- `data/design-systems.csv` — library comparison
- `data/resources.csv` — categorized design resources
- `ui-ux-pro-max` skill — design rules, styles, palettes, UX guidelines
- shadcn/ui: https://ui.shadcn.com
- Ant Design: https://ant.design
- Material UI: https://mui.com/material-ui
- Brad Traversy Design Resources: https://github.com/bradtraversy/design-resources-for-developers

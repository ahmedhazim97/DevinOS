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

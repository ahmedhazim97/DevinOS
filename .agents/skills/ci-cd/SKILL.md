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

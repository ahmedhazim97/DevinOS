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



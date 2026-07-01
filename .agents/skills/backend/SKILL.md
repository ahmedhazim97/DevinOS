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



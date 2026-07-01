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



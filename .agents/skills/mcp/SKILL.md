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



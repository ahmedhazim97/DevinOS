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



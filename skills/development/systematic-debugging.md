# Systematic Debugging

A structured methodology for diagnosing and resolving software issues.

## Purpose

This skill provides a rigorous four-phase approach to debugging that prevents wasted effort from random fix attempts and ensures root causes are properly identified before solutions are implemented.

## When to Activate

Use this skill when:
- Encountering bugs, errors, or unexpected behavior
- Phrases like "not working", "broken", "fix", "debug", or "investigate" appear
- After 2+ failed fix attempts on the same issue

---

## The Iron Law

**NO FIXES WITHOUT ROOT CAUSE INVESTIGATION FIRST**

Proposing solutions before completing Phase 1 violates this process. Every fix attempt without understanding the root cause is a guess—and guesses compound complexity.

---

## The Four Phases

### Phase 1: Root Cause Investigation

**Never skip this phase.** Before any fix attempt:

1. **Read the error message thoroughly**
   - Full stack trace, not just the first line
   - Note file paths, line numbers, variable values
   - Check if error relates to specific frameworks or libraries

2. **Reproduce consistently**
   - Document exact steps to trigger
   - Identify if it's deterministic or intermittent
   - Test across different environments/browsers if applicable

3. **Check recent changes**
   - `git diff HEAD~5` for recent modifications
   - Look for pattern: "It worked before X was changed"
   - Review any dependency updates

4. **Trace data flow**
   - Follow the data from source to error
   - For frontend: State → Component → Render → DOM
   - For backend: Request → Route → Service → Database → Response

5. **Gather diagnostic evidence**
   ```bash
   # For state issues
   console.log('State:', JSON.stringify(state, null, 2))

   # For API issues
   curl -v endpoint | jq

   # For CSS/styling issues
   getComputedStyle(element).getPropertyValue('--property-name')
   ```

### Phase 2: Pattern Analysis

1. **Find working examples**
   - What similar code works correctly?
   - Check existing components using the same patterns

2. **Study reference implementations**
   - Read the WHOLE working example, not just the relevant line
   - Check library/framework docs for correct usage patterns

3. **Identify differences**
   - What's different between working and broken?
   - Compare configurations, prop shapes, API usage

4. **Map dependencies**
   - What does this code depend on?
   - Trace the dependency chain

### Phase 3: Hypothesis & Testing

1. **Form ONE clear hypothesis**
   ```
   ❌ "It might be the CSS or maybe the state or the API"
   ✅ "The state update is being called before the API response"
   ```

2. **Test minimally**
   - Change ONE thing at a time
   - Verify each change before moving on
   - Test in isolation before full integration

3. **Record results**
   ```markdown
   Hypothesis: Race condition in async state update
   Test: Added await before setState
   Result: FAILED - state still stale
   Learning: Issue is in the parent component
   ```

### Phase 4: Implementation

1. **Write a failing test first**
   - Captures the bug so it can't regress
   - Provides verification of the fix

2. **Implement focused fix**
   - Single responsibility: fix THIS bug
   - Don't refactor "while you're in there"
   - Maintain existing patterns and conventions

3. **Verify comprehensively**
   - Original bug test passes
   - No regression in related tests
   - Run full test suite

---

## Common Debugging Scenarios

### CSS/Styling Issues
```bash
# Check if variable is defined
grep -r "--variable-name" *.css *.config.*

# Check variable inheritance
# (Variables may not inherit into portals, iframes, shadow DOM)

# Verify build tool is processing correctly
npm run build -- --verbose
```

### React/Component Issues
```tsx
// Common issue: Missing Provider
// Fix: Wrap in appropriate Provider

// Common issue: Stale closure
// Check: Are dependencies in useEffect correct?

// Common issue: Hydration mismatch
// Fix: Use useEffect for browser-only values
```

### API/Network Issues
```bash
# Check request/response
curl -v -X POST endpoint -H "Content-Type: application/json" -d '{}'

# Check CORS headers
# Check authentication tokens
# Verify request payload format
```

---

## Escalation Trigger

**If 3+ fix attempts fail: STOP**

This pattern indicates:
- The bug is a symptom, not the root cause
- Architecture may need redesign
- Assumptions about the system are wrong

**Required action:**
1. Document all failed attempts
2. List current hypotheses (all disproven)
3. Step back and question the architecture
4. Ask: "What would have to be true for this bug to exist?"

---

## Red Flags (Abandon Process Warning)

Stop if you catch yourself:
- Trying random changes hoping one works
- Adding code without understanding why
- Skipping straight to "solutions"
- Saying "let me just try..." without a hypothesis
- Making the same type of fix repeatedly
- Adding workarounds instead of understanding

---

## Debug Log Template

```markdown
## Debug Session: [Issue Title]

### Symptom
[Exact error message and behavior]

### Reproduction Steps
1. [Step 1]
2. [Step 2]
3. [Expected vs Actual]

### Root Cause Investigation
- Error analysis: [findings]
- Recent changes: [relevant commits]
- Data flow trace: [source → error]

### Hypotheses Tested
| # | Hypothesis | Test | Result |
|---|------------|------|--------|
| 1 | [Theory] | [What I did] | PASS/FAIL |

### Root Cause
[Final determination]

### Fix
[What was changed and why]

### Verification
- [ ] Original bug test passes
- [ ] No regressions
- [ ] Builds successfully
```

---

## Related Skills

- verification-before-completion
- design-system-quality

---

*Version: 1.0 | Adapted from obra/superpowers methodology*

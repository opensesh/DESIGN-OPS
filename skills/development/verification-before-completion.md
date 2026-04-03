# Verification Before Completion

Enforce evidence-based completion claims with fresh verification.

## Purpose

This skill ensures no work gets marked "done" without concrete proof. It prevents false confidence, catches missed issues, and builds trust through demonstrated evidence.

## When to Activate

Use this skill when:
- Making any claim of completion, success, or task finish
- Phrases like "done", "complete", "finished", "working", "fixed", or "ready for review" appear
- Before committing code or creating pull requests
- When accepting work from others or delegated tasks

---

## The Iron Law

**NO COMPLETION CLAIMS WITHOUT FRESH VERIFICATION EVIDENCE**

Bypassing verification is not efficiency—it's misrepresentation. Trust depends on accuracy. Every claim must be backed by concrete evidence gathered in THIS session.

---

## The Gate Function

Before asserting ANY positive status, execute this sequence:

```
1. IDENTIFY  → What command/check proves the claim?
2. RUN       → Execute it completely and freshly
3. READ      → Examine FULL output, not just success messages
4. VERIFY    → Does output actually confirm the claim?
5. CLAIM     → Only then make assertion with evidence
```

**Skipping ANY step = unverified claim = potential misrepresentation**

---

## Claim Types & Required Evidence

| Claim | Required Evidence |
|-------|-------------------|
| "Tests pass" | Fresh test output showing zero failures |
| "Lint clean" | Linter output with zero errors/warnings |
| "Build succeeds" | Build output + exit code 0 |
| "Bug fixed" | Original failing case now passes |
| "Feature complete" | Line-by-line requirement verification |
| "PR ready" | All checks pass + diff review |
| "Design compliant" | Passes design system quality checks |

---

## Red Flags (Stop Immediately If...)

You catch yourself:
- Saying "should work" without running it
- Claiming "probably fine" without checking
- Expressing satisfaction before verification
- Trusting previous output instead of re-running
- Assuming delegated work completed correctly without inspecting

---

## Verification Patterns

### Pattern A: Test Verification
```
❌ WRONG:
"I wrote the tests. The component should work now."

✅ CORRECT:
"Let me run the tests to verify."
[Runs: npm test components/FeatureName.test.tsx]
[Output shows: PASS 3/3 tests]
"Tests pass. The component is verified working."
```

### Pattern B: Build Verification
```
❌ WRONG:
"I fixed the type error. Build should succeed."

✅ CORRECT:
"Let me verify the build succeeds."
[Runs: npm run build]
[Output shows: ✓ Compiled successfully]
"Build verified. Exit code 0, no errors."
```

### Pattern C: Design System Verification
```
❌ WRONG:
"I used the design tokens throughout."

✅ CORRECT:
"Let me verify design system compliance."
[Runs: grep for hardcoded colors - none found]
[Runs: grep for CSS variables - confirms usage]
[Inspects: component uses semantic tokens]
"Design system compliance verified. All colors use semantic tokens."
```

### Pattern D: Regression Verification
```
❌ WRONG:
"Fixed the bug. Moving on."

✅ CORRECT:
"Let me verify the original issue is resolved."
[Reproduces original failing case]
[Confirms it now passes]
[Runs full test suite for regressions]
"Bug fix verified. Original case passes, no regressions."
```

---

## Delegated Work Verification

When accepting work from others or subagents:

1. **Never trust the report alone** - delegates may have incomplete context
2. **Run verification yourself** - fresh test runs, build checks
3. **Inspect the actual output** - compare against requirements
4. **Check quality standards** - they may not know project-specific patterns

```
❌ "The delegate reports tests pass. Task complete."
✅ "The delegate reports tests pass. Let me verify."
   [Runs tests independently]
   [Confirms output matches claim]
   "Independently verified. Task complete."
```

---

## When to Apply

**ALWAYS before:**
- Claiming any task is "done" or "complete"
- Expressing satisfaction with work
- Moving to the next task
- Committing code
- Creating pull requests
- Reporting progress
- Accepting delegated work

---

## Evidence Documentation

When completing work, document evidence:

```markdown
## Verification Evidence

### Tests
- Command: `npm test`
- Result: 47 tests, 0 failures
- Time: 12.3s

### Build
- Command: `npm run build`
- Result: Exit code 0
- Warnings: 0

### Design System
- Hardcoded colors: 0 found
- CSS variable usage: Confirmed in all new files
- Component patterns: Match project standards
```

---

## Related Skills

- systematic-debugging
- design-system-quality

---

*Version: 1.0 | Adapted from obra/superpowers methodology*

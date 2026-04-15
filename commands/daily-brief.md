# /design-ops:daily-brief

**Legacy alias** for `/design-ops:dashboard daily`

## Trigger

User invokes `/design-ops:daily-brief` to start their day with a consolidated view.

---

## Behavior

This command is a backwards-compatible alias. It delegates to the unified dashboard command:

```
/design-ops:daily-brief  →  /design-ops:dashboard daily
```

### Execution

1. **Invoke** `/design-ops:dashboard daily`
2. **Return** the daily dashboard output (all enabled pillars)

---

## Migration Notice

`/design-ops:daily-brief` continues to work for backwards compatibility, but the recommended command is now:

```bash
/design-ops:dashboard              # All pillars, daily (default)
/design-ops:dashboard daily        # Explicit daily timeframe
/design-ops:dashboard ops daily    # Operations only, daily
```

See `/design-ops:dashboard` for full documentation on pillar and timeframe options.

---

## Why This Alias Exists

- **Muscle memory** — Existing users know `/design-ops:daily-brief`
- **Documentation links** — Prevents broken references
- **Gradual migration** — Users can adopt new syntax at their own pace

---

*Version: 2.0 (alias wrapper)*
*Delegates to: /design-ops:dashboard daily*

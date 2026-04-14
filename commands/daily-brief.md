# /do:daily-brief

**Legacy alias** for `/do:dashboard daily`

## Trigger

User invokes `/do:daily-brief` to start their day with a consolidated view.

---

## Behavior

This command is a backwards-compatible alias. It delegates to the unified dashboard command:

```
/do:daily-brief  →  /do:dashboard daily
```

### Execution

1. **Invoke** `/do:dashboard daily`
2. **Return** the daily dashboard output (all enabled pillars)

---

## Migration Notice

`/do:daily-brief` continues to work for backwards compatibility, but the recommended command is now:

```bash
/do:dashboard              # All pillars, daily (default)
/do:dashboard daily        # Explicit daily timeframe
/do:dashboard ops daily    # Operations only, daily
```

See `/do:dashboard` for full documentation on pillar and timeframe options.

---

## Why This Alias Exists

- **Muscle memory** — Existing users know `/do:daily-brief`
- **Documentation links** — Prevents broken references
- **Gradual migration** — Users can adopt new syntax at their own pace

---

*Version: 2.0 (alias wrapper)*
*Delegates to: /do:dashboard daily*

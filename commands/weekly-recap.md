# /do:weekly-recap

**Legacy alias** for `/do:dashboard weekly`

## Trigger

User invokes `/do:weekly-recap` at the end of a week to review accomplishments and plan ahead.

---

## Behavior

This command is a backwards-compatible alias. It delegates to the unified dashboard command:

```
/do:weekly-recap  →  /do:dashboard weekly
```

### Execution

1. **Invoke** `/do:dashboard weekly`
2. **Return** the weekly dashboard output (all enabled pillars)

---

## Migration Notice

`/do:weekly-recap` continues to work for backwards compatibility, but the recommended command is now:

```bash
/do:dashboard weekly           # All pillars, weekly
/do:dashboard ops weekly       # Operations only, weekly
/do:dashboard design weekly    # Design only, weekly
```

See `/do:dashboard` for full documentation on pillar and timeframe options.

---

## Why This Alias Exists

- **Muscle memory** — Existing users know `/do:weekly-recap`
- **Documentation links** — Prevents broken references
- **Gradual migration** — Users can adopt new syntax at their own pace

---

*Version: 2.0 (alias wrapper)*
*Delegates to: /do:dashboard weekly*

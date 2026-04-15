# /design-ops:weekly-recap

**Legacy alias** for `/design-ops:dashboard weekly`

## Trigger

User invokes `/design-ops:weekly-recap` at the end of a week to review accomplishments and plan ahead.

---

## Behavior

This command is a backwards-compatible alias. It delegates to the unified dashboard command:

```
/design-ops:weekly-recap  →  /design-ops:dashboard weekly
```

### Execution

1. **Invoke** `/design-ops:dashboard weekly`
2. **Return** the weekly dashboard output (all enabled pillars)

---

## Migration Notice

`/design-ops:weekly-recap` continues to work for backwards compatibility, but the recommended command is now:

```bash
/design-ops:dashboard weekly           # All pillars, weekly
/design-ops:dashboard ops weekly       # Operations only, weekly
/design-ops:dashboard design weekly    # Design only, weekly
```

See `/design-ops:dashboard` for full documentation on pillar and timeframe options.

---

## Why This Alias Exists

- **Muscle memory** — Existing users know `/design-ops:weekly-recap`
- **Documentation links** — Prevents broken references
- **Gradual migration** — Users can adopt new syntax at their own pace

---

*Version: 2.0 (alias wrapper)*
*Delegates to: /design-ops:dashboard weekly*

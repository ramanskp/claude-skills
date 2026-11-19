# <Pattern Name>

> One sentence: the user problem this pattern solves.

<!--
Contributor rules
- Keep the file 60–120 lines. Use bullets, not prose.
- Stay stack-agnostic. Describe behavior, not framework APIs. Snippets go in ../stacks/.
- Use the token names from ../principles.md (e.g. space-4, radius-md, color-danger). Never raw hex/px.
- Keep ALL headings below, in this order. scripts/check-patterns.sh enforces them.
- After adding a file, add a row to INDEX.md.
-->

## When to use
- <Concrete situation 1>
- <Concrete situation 2>

## When NOT to use
- <Situation> → use [<alternative>](../<group>/<file>.md) instead

## Anatomy
1. **<Part>** — <purpose; required/optional>
2. **<Part>** — <purpose>

## Required states
| State | Behavior / appearance |
|-------|------------------------|
| Default | |
| Hover | |
| Focus-visible | |
| Active / selected | |
| Disabled | |
| Loading | |
| Empty | |
| Error | |
<!-- Write "n/a — <reason>" when a state truly does not apply. Don't delete the row. -->

## Behavior & responsive
- <Interaction rules, timing, overflow handling>
- **Mobile (< 640px):** <how it adapts>

## Accessibility
- **Role / semantics:** <native element or ARIA role>
- **Keyboard:** <key → action map>
- **Announcements:** <what assistive tech hears, live regions>
- **Focus management:** <where focus goes on open/close/submit>

## Do & Don't
- ✅ Do: <...>
- ❌ Don't: <...>

## Anti-patterns
- **<Name>** — <why it hurts users>

## Related patterns
- [<Pattern>](../<group>/<file>.md) — <relationship>

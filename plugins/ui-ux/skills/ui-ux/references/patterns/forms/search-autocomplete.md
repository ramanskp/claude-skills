# Search with Autocomplete

> Users who know roughly what they want need to find and pick it by typing a few characters instead of scanning a long list.

## When to use
- Choosing one value from > 15 options (country, assignee, product, city) — the "searchable select".
- Global or in-app search where suggestions (recent, popular, matching items) speed up navigation.
- Large or remote datasets that can't be rendered as a full list.

## When NOT to use
- ≤ 5 options → use radio buttons in [Form layout](../forms/form-layout.md) instead; 6–15 options → native select
- Narrowing a result set by attributes → use [Filters / faceted search](../forms/filters.md) instead
- Entering a date → use [Date picker](../forms/date-picker.md) instead
- Browsing without a known target → use [Cards & lists](../data-feedback/cards-lists.md) instead

## Anatomy
1. **Label** — visible ("Assignee"); for global search a visually hidden label + magnifier icon is acceptable. Required.
2. **Input** — text field with search icon; height per density; `radius-sm`.
3. **Clear button** — "×" inside input when non-empty, 24px minimum target, labelled "Clear search". Optional.
4. **Listbox popup** — `color-surface-raised`, `shadow-2`, `radius-md`, max height ~ 8 options then scroll.
5. **Option** — primary text with matched substring in bold, optional secondary line `text-sm` `color-text-muted`, optional avatar/icon.
6. **Group headings** — "Recent", "People", "Projects". Optional.
7. **Status row** — "Searching…", "No results for 'xyz'", "Showing 10 of 240 – press Enter to see all". Required for remote data.

## Required states
| State | Behavior / appearance |
|-------|------------------------|
| Default | Input empty with label; popup closed (or showing recent items on focus for global search) |
| Hover | Option background `color-surface` tint; pointer hover does not change keyboard-active option until moved |
| Focus-visible | `color-focus` ring on input; DOM focus stays in input while the active option is highlighted with a distinct background + left marker |
| Active / selected | Active (highlighted) option is visually distinct; selected value shows in input with a check in the list on reopen |
| Disabled | Disabled options stay visible with `color-text-muted` and `aria-disabled="true"`, are skipped on selection |
| Loading | After 300ms debounce, spinner in status row "Searching…"; keep previous results visible (dimmed) until new ones arrive |
| Empty | "No results for 'query'" + suggestion (check spelling, broaden term, or "Create 'query'" if creation is allowed) |
| Error | Status row "Couldn't load results. Try again" with retry action; input value kept |

## Behavior & responsive
- **Debounce** remote queries 250–300ms; local filtering can be instant. Min 1–2 characters before querying (0 for recents).
- **Cancel stale requests**; render only results matching the current input to avoid out-of-order flashes.
- **Match:** case- and accent-insensitive; prefix and word-start matches rank above substring; highlight matched text.
- **Limit** suggestions to ~8–10; offer "See all results" for full search.
- **Selection** sets the value and closes the popup; for a searchable select, free text that matches no option is rejected on blur with an inline error (see [Inline validation](../forms/inline-validation.md)).
- **Escape** first closes popup; second Escape clears input (per APG).
- **Don't auto-select** the first option on blur; only an explicit Enter/click commits.
- **Global search:** Enter on input with no active option submits the full query to a results page; persist query in URL.
- **Recent searches** shown on focus with a "Clear recent" action; never show other users' queries.
- **Popup open/close:** ≤ `duration-fast` opacity, no motion under `prefers-reduced-motion`.
- **Mobile (< 640px):** on focus expand to a full-screen search sheet with input pinned top, results filling the viewport, "Cancel" to exit; options ≥ 44px tall; `inputmode="search"` / `enterkeyhint="search"`.

## Accessibility
- **Role / semantics:** WAI-ARIA APG Combobox pattern. Input `role="combobox"`, `aria-expanded="true|false"`, `aria-controls="listbox-id"`, `aria-autocomplete="list"` (or `"both"` with inline completion). Popup `role="listbox"`, items `role="option"` with `aria-selected` on the active option. Groups use `role="group"` + `aria-labelledby`.
- **Active option:** focus stays in the input; set `aria-activedescendant` to the highlighted option's id; clear it when no option is active.
- **Keyboard:** Down Arrow opens popup / moves to next option; Up Arrow previous; Alt+Down opens without moving; Enter selects active option; Escape closes (then clears); Home/End move the caret in the input; Tab closes popup and moves on without committing a new value unless the APG "select on Tab" variant is documented.
- **Announcements:** result count in a polite live region after results settle ("8 results available"), not on every keystroke; "No results" and errors announced the same way.
- **Focus management:** focus never leaves the input while navigating; after selection it stays on the input (form) or moves to the results page heading (global search). Clear button returns focus to the input.
- **WCAG 2.2:** 1.4.13 popup dismissible with Escape and doesn't hide content under pointer; 2.5.8 option/clear targets ≥ 24px; 4.1.2 name/role/value exposed; visible label (not placeholder).

## Do & Don't
- ✅ Do: show matched text in bold so users see why a result appears.
- ✅ Do: keep typed text when there are no results so the user can edit it.
- ✅ Do: provide a keyboard shortcut ("/" or Ctrl/Cmd+K) for global search and display it.
- ❌ Don't: fire a request on every keystroke without debounce.
- ❌ Don't: move DOM focus into the list; use `aria-activedescendant`.
- ❌ Don't: replace the user's typed text with the first suggestion while they type.

## Anti-patterns
- **Placeholder-only search label** — disappears on typing; no accessible name.
- **Flickering results** — out-of-order responses overwrite newer ones.
- **Silent free-text** — searchable select accepts arbitrary text that's then dropped on save.
- **Hover-dependent options** — secondary actions only on hover are unreachable on touch and keyboard.

## Related patterns
- [Filters / faceted search](../forms/filters.md) — combine with search to narrow results
- [Data table](../data-feedback/data-table.md) — search within table results
- [Empty states](../data-feedback/empty-states.md) — "no results" page design
- [Top navigation](../navigation/top-nav.md) — placement of global search
- [Form layout](../forms/form-layout.md) — choosing radio vs. select vs. combobox

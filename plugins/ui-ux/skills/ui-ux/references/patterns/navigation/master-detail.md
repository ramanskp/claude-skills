# Master–detail

> Users need to browse a list and inspect or act on one item without losing their place in the list.

## When to use
- Triage workflows: email, tickets, messages, notifications, review queues.
- Users move through items sequentially (next/previous) and compare by memory.
- Detail content is rich (more than fits in a table row) but the list stays relevant.
- Screens ≥ 1024px wide where list and detail fit side by side.

## When NOT to use
- Comparing many records across attributes → use [Data table](../data-feedback/data-table.md) instead
- Quick peek or edit of one row while keeping full list width → use a drawer from [Modal vs. drawer](../data-feedback/modal-vs-drawer.md)
- Detail is a long, deep-linkable workspace users return to → use a full page with [Breadcrumbs](../navigation/breadcrumbs.md)
- Switching peer views of one object → use [Tabs](../navigation/tabs.md) inside the detail pane

## Anatomy
1. **List pane** — required; ≈ 20–28rem wide (or 30–40%), with search/[filters](../forms/filters.md) on top and a count ("128 tickets").
2. **List item** — required; 2–3 lines: title (`text-sm` weight 600), metadata (`text-xs` muted), status badge; row 56–72px, `space-3` padding.
3. **Divider / resize handle** — optional; `color-border`, draggable, min widths for both panes.
4. **Detail pane** — required; header (title, key actions, prev/next, close on narrow screens), scrollable body.
5. **Detail placeholder** — required; shown when nothing is selected.
6. **Bulk-action bar** — optional; replaces list header when items are multi-selected via checkboxes.

## Required states
| State | Behavior / appearance |
|-------|------------------------|
| Default | List left, detail right; first item auto-selected only if the user's task is sequential (inbox), otherwise placeholder. |
| Hover | List row background `color-surface-raised` over `duration-fast`; reveal quick actions (archive, assign). |
| Focus-visible | 2px `color-focus` ring inset on the focused row; distinct from the selected style. |
| Active / selected | Selected row: tinted background + a `space-1`-wide leading `color-primary` bar; `aria-current="true"` (or `aria-selected` in a listbox/grid). Unread items use weight 600 + dot, not color alone. |
| Disabled | n/a for rows — show inaccessible items with a lock icon and explanation in detail, rather than disabling. |
| Loading | List: skeleton rows at real height. Detail: keep the previous item's header, skeleton the body; show after 300ms to avoid flicker. |
| Empty | No items: [empty state](../data-feedback/empty-states.md) in list, detail hidden. No results for filter: "No matches" + "Clear filters". No selection: placeholder "Select a ticket to see details". |
| Error | List failure: inline error + retry in list pane. Detail failure: error in detail pane only; list stays usable. Item deleted elsewhere: "This item no longer exists" + select next. |

## Behavior & responsive
- Selection updates the URL (`/tickets/123`) so detail is deep-linkable, reloadable and back-button safe.
- Keep list scroll position, filters and selection when detail changes or the user returns.
- After archive/delete, auto-advance to the next item (configurable) and offer Undo via [toast](../data-feedback/toasts.md).
- Prev/next controls and shortcuts (J/K or ↑/↓) step through items; preload adjacent details.
- Unsaved edits in detail: warn before switching items, or autosave.
- Virtualize lists > 200 items; load more on scroll with a visible count.
- **Large (≥ 1280px):** list + detail; optional third pane (nav or inspector).
- **Medium (1024–1279px):** list + detail; collapse app sidebar to rail.
- **Tablet (640–1023px):** list + detail if the list fits ≥ 18rem, else single-pane drill-in.
- **Mobile (< 640px):** single pane. Tapping a row pushes the detail full-screen with a 44×44px back button showing the list name; back restores list scroll and highlights the last-viewed row.

## Accessibility
- **Role / semantics:** list pane is a `<ul>` of links/buttons (simplest), or `role="listbox"`/`role="grid"` when it needs arrow-key selection and multi-select. Detail pane is a labelled region (`<section aria-labelledby>` pointing to the detail heading).
- **Keyboard:** in a link list, Tab moves through rows; in a listbox/grid, ↑/↓ move, Home/End jump, Space toggles selection, Enter opens detail. Provide a shortcut or skip link to jump from list to detail and back. Single-key shortcuts (J/K) must be remappable or disable-able (WCAG 2.1.4).
- **Announcements:** on selection, the detail heading is the announced name; loading and "item archived, 127 remaining" via polite `role="status"`.
- **Focus management:** selecting with keyboard keeps focus in the list (wide layout) and updates detail; Enter moves focus to the detail heading. On mobile, push moves focus to the detail heading; back returns focus to the originating row. After delete, focus the next row.

## Do & Don't
- ✅ Do: make list items scannable: most distinguishing info first, max 3 lines.
- ✅ Do: keep the selected item visible in the list (scroll it into view).
- ✅ Do: show the same key fields in list and detail so users recognize the item.
- ❌ Don't: re-fetch and reset the list when the detail changes.
- ❌ Don't: hide the list on desktop when an item opens.
- ❌ Don't: rely on hover-only quick actions; provide them in the detail and via keyboard.

## Anti-patterns
- **Lost place** — returning from detail scrolls the list to top and clears filters.
- **Selection = focus confusion** — the focus ring and selected style look identical.
- **Nested scroll traps** — list, detail and page all scroll independently on mobile.
- **Non-linkable detail** — selection not in URL; users can't share or reload.

## Related patterns
- [Data table](../data-feedback/data-table.md) — when attributes need comparison
- [Modal vs. drawer](../data-feedback/modal-vs-drawer.md) — drawer as lightweight detail
- [Filters](../forms/filters.md) — narrowing the list pane
- [Search with autocomplete](../forms/search-autocomplete.md) — finding an item in the list
- [Cards & lists](../data-feedback/cards-lists.md) — list item design
- [Toasts](../data-feedback/toasts.md) — undo after archive/delete
- [Empty states](../data-feedback/empty-states.md) — no items / no selection

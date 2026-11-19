# Filters / Faceted Search

> Users facing a large result set need to narrow it by attributes, see what's applied, and undo any choice without starting over.

## When to use
- Result sets of ~50+ items with meaningful attributes (status, category, price, date, owner).
- Catalogs, tables, logs, and search results where users combine criteria.
- Users need to compare counts across options ("In stock (124)").

## When NOT to use
- Fewer than ~20 items → show them all; maybe sort only
- User knows the exact item → use [Search with autocomplete](../forms/search-autocomplete.md) instead
- Switching between 2–4 fixed views (Day / Week / Month) → use a segmented control or [Tabs](../navigation/tabs.md) instead
- Complex boolean queries for experts → a query builder, not faceted filters

## Anatomy
1. **Filter panel** — left sidebar (desktop) listing facets in collapsible groups; `space-6` between groups. Required for > 4 facets.
2. **Facet group** — heading + controls: checkboxes (multi-select), radios (single), range inputs (price), [Date picker](../forms/date-picker.md) (dates).
3. **Option counts** — result count next to each option, tabular numerals, `color-text-muted`. Recommended.
4. **"Show more"** — collapse facets beyond 5–7 options; add a search box above options when > 15.
5. **Applied filter chips** — above results, each chip "Status: Open ×", `radius-full`, `space-2` padding. Required.
6. **Clear all** — text button after chips. Required when ≥ 2 filters applied.
7. **Result count** — "128 results" next to sort control; updates with filters. Required.
8. **Sort control** — separate from filters, labeled ("Sort by: Newest").
9. **Mobile trigger** — "Filters (3)" button opening a sheet. Required on mobile.

## Required states
| State | Behavior / appearance |
|-------|------------------------|
| Default | No filters applied; all results; facet groups for top 3–5 attributes expanded, rest collapsed |
| Hover | Option row background tint; chip "×" darkens to `color-text` over `duration-fast` |
| Focus-visible | `color-focus` ring on checkboxes, group toggles, chips and their remove buttons |
| Active / selected | Checked options filled; group heading shows count ("Status (2)"); chip appears in applied bar |
| Disabled | Options yielding 0 results show "(0)" in `color-text-muted` and remain focusable but inert, or are hidden — pick one consistently; never disable an already-selected option |
| Loading | Results area shows [Skeleton loading](../data-feedback/skeleton-loading.md) or dims existing results; panel stays interactive; counts update after load |
| Empty | "No results match these filters" + list of applied filters + "Clear all" and a suggestion to remove the most restrictive one; see [Empty states](../data-feedback/empty-states.md) |
| Error | Results area shows "Couldn't load results. Try again" with retry; applied filters remain intact |

## Behavior & responsive
- **Apply mode:**
  - **Desktop: apply instantly** on each change (debounce range/text inputs 300–500ms); no "Apply" button needed.
  - **Mobile sheet: batch** changes and apply on "Show 42 results" (live count in the button); "Cancel" discards.
- **Logic:** OR within a facet (Red OR Blue), AND across facets (Red AND Size M). State it if ambiguous.
- **URL reflects state:** every filter, sort, and page in query parameters so results are shareable, bookmarkable, and Back restores them.
- **Preserve scroll and focus** when results update; reset pagination to page 1 on filter change.
- **Counts** reflect other selected facets (disjunctive faceting) so users can see what adding an option yields.
- **Order facets** by usefulness (analytics), not alphabetically; options within by count or natural order (sizes S→XL).
- **Range filters** use two labeled number inputs (Min / Max) optionally paired with a slider; never a slider alone.
- **Remember** recent filter state per view in the session; "Save view" for frequent combinations in productivity apps.
- **Mobile (< 640px):** "Filters (n)" button + sort in a sticky bar; filters open in a full-height sheet with groups as accordions and a sticky footer "Clear all" / "Show n results"; chips scroll horizontally below the bar.
- **Tablet (640–1023px):** collapsible side panel or the mobile sheet; don't squeeze results under 2 columns.

## Accessibility
- **Role / semantics:** each facet is a `fieldset` + `legend` (or a heading + group with `aria-labelledby`); native checkboxes/radios; group toggles are buttons with `aria-expanded` + `aria-controls`. Panel is a landmark (`aside` or `region` with `aria-label="Filters"`).
- **Chips:** remove control is a button with accessible name "Remove filter: Status Open".
- **Keyboard:** Tab between groups and controls; Space toggles checkbox; arrows within radio group; Enter/Space toggles group expand; Escape closes mobile sheet.
- **Announcements:** after results update, polite live region "42 results" (debounced, once per change). Don't announce each count change in the panel.
- **Focus management:** instant apply keeps focus on the changed control (never jump to results). Removing a chip moves focus to the next chip, or to the results heading if none remain. Mobile sheet traps focus while open, returns it to the "Filters" button on close.
- **WCAG 2.2:** 3.2.2 instant apply is acceptable when the change is predictable and focus is not moved; 2.5.8 chip "×" ≥ 24×24px; 1.4.1 selected state not by color alone.

## Do & Don't
- ✅ Do: always show what's applied and how to remove it in one click.
- ✅ Do: show counts so users avoid dead ends.
- ✅ Do: keep filters when users navigate to an item and come back.
- ❌ Don't: reload the full page and lose scroll position on each checkbox.
- ❌ Don't: hide the result count or applied filters on mobile.
- ❌ Don't: mix sorting into the filter panel.

## Anti-patterns
- **Zero-result traps** — options that lead to empty pages without warning.
- **Invisible state** — filters applied in a collapsed panel with no chips; users think data is missing.
- **Apply button on desktop instant filters** — users toggle options and wonder why nothing changed.
- **Focus jump to results** after each change — keyboard users lose their place.
- **Non-shareable filters** — state lost on refresh or when sending a link.

## Related patterns
- [Data table](../data-feedback/data-table.md) — column filters and sorting
- [Search with autocomplete](../forms/search-autocomplete.md) — combine keyword search with facets
- [Date picker](../forms/date-picker.md) — date range facets
- [Empty states](../data-feedback/empty-states.md) — no results after filtering
- [Modal vs. drawer](../data-feedback/modal-vs-drawer.md) — mobile filter sheet
- [Sidebar navigation](../navigation/sidebar.md) — avoid confusing filter panel with app nav

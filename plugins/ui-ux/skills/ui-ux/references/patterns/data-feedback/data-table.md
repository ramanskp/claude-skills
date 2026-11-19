# Data Table

> Users need to scan, compare, sort, and act on many records across the same set of attributes.

## When to use
- Records share 3+ comparable attributes (status, owner, date, amount) and users compare across rows
- Users sort, filter, bulk-select, or export (admin consoles, orders, invoices, logs)
- Lookup tasks where position matters ("row 41 of 1,200") and pagination is expected
- Dense desktop workflows where scanning columns beats reading cards

## When NOT to use
- Items are visual or heterogeneous (products, media, people with avatars) → use [Cards & lists](../data-feedback/cards-lists.md)
- Fewer than ~5 records or only 1–2 attributes → use a simple list from [Cards & lists](../data-feedback/cards-lists.md)
- Primary use is inspecting one record at a time → use [Master–detail](../navigation/master-detail.md)
- High-level metrics overview → use [Dashboard grid](../navigation/dashboard-grid.md)

## Anatomy
1. **Toolbar** — search, [filters](../forms/filters.md), column/density toggles, export; optional
2. **Bulk action bar** — replaces/overlays toolbar when ≥ 1 row selected; shows "3 selected" + actions + "Clear"
3. **Header row** — sticky; column labels, sort controls, optional select-all checkbox
4. **Body rows** — one record per row; first column is the identifier (name/ID), often a link to detail
5. **Cells** — text left-aligned, numbers/currency/dates-as-durations right-aligned with tabular numerals
6. **Row actions** — inline primary action or an overflow "More actions" menu at row end
7. **Footer** — pagination ("1–50 of 1,240"), rows-per-page selector; required for > 1 page
8. **Caption** — table title/description; may be visually hidden but present for assistive tech

## Required states
| State | Behavior / appearance |
|-------|------------------------|
| Default | Rows separated by `color-border` dividers or zebra `color-surface`; header `text-sm` weight 600; cells `text-sm`, padding `space-3`/`space-4` |
| Hover | Row background shifts to `color-surface-raised` over `duration-fast`; never the only cue that a row is clickable |
| Focus-visible | visible `color-focus` ring (3:1 contrast) on the focused cell, row link, or control; never removed |
| Active / selected | Checkbox checked + row tint + `aria-selected="true"` on selectable rows; selection count in bulk bar |
| Disabled | Row/action at reduced emphasis with `color-text-muted`; tooltip or text explains why; still readable |
| Loading | Keep header + column widths; [skeleton](../data-feedback/skeleton-loading.md) rows matching page size; `aria-busy="true"` on table; re-sort/filter dims existing rows instead of blanking |
| Empty | Header stays; one full-width row with [empty state](../data-feedback/empty-states.md): "No invoices match 'acme'" + "Clear filters" |
| Error | Replace body with inline error row: what failed + "Retry"; keep toolbar and filters usable |

## Behavior & responsive
- Header is sticky (`position: sticky`) on vertical scroll; first identifier column sticky on horizontal scroll
- Sorting: click header toggles ascending → descending (→ unsorted optional); show one arrow icon on the sorted column only; default sort is stated
- Paginate by default (25/50/100 per page); keep page, sort, and filters in the URL so state survives refresh and back
- Prefer "Load more" or virtualization only for 1,000+ rows in exploratory views; keep header semantics when virtualizing
- Truncate long text with ellipsis + full value in tooltip/title and detail view; never truncate IDs or numbers
- Column widths: fixed for status/dates/actions, flexible for name; min width so headers don't wrap mid-word
- Bulk select: header checkbox selects visible page; offer "Select all 1,240" link explicitly
- Destructive bulk actions follow [Confirmation dialog](../data-feedback/confirm-dialog.md) or undo via [Toasts](../data-feedback/toasts.md)
- Density toggle: Comfortable / Compact rows per the density table in principles; keep the 24px minimum target
- **Mobile (< 640px):** collapse each row into a stacked card (label: value pairs) or show 2–3 priority columns + horizontal scroll with sticky first column; filters move into a drawer

## Accessibility
- **Role / semantics:** native `<table>`, `<caption>`, `<thead>`, `<tbody>`, `<th scope="col">` for headers, `<th scope="row">` for the identifier cell; never build with divs + CSS grid without `role="table"`/`grid` roles
- **Sorting:** sort control is a `<button>` inside `<th>`; `aria-sort="ascending|descending"` only on the currently sorted header (omit elsewhere)
- **Interactive grid:** only use `role="grid"` with arrow-key cell navigation when cells are editable; otherwise plain table + Tab through controls
- **Keyboard:** Tab → header buttons, row links, checkboxes, row action menus; Space toggles checkbox; Enter activates link/button
- **Announcements:** live region (`role="status"`) announces "Sorted by amount, descending", "3 rows selected", "Showing 51–100 of 1,240"
- **Focus management:** after deleting a row, focus moves to the next row (or previous if last); after page change, focus moves to table caption/top
- Checkboxes have labels like "Select invoice INV-204"; row action menus labelled "More actions for INV-204"
- Status cells use icon + text, never color alone

## Do & Don't
- ✅ Do: right-align numbers and use tabular numerals so magnitudes line up
- ✅ Do: make the whole first-column cell a real link to the detail page
- ✅ Do: preserve selection across sort, clear it on filter change, and say so
- ❌ Don't: make entire rows clickable without a real link/button inside (breaks keyboard and middle-click)
- ❌ Don't: hide critical actions behind hover-only icons; touch and keyboard users can't find them
- ❌ Don't: center-align text columns or mix alignment within a column

## Anti-patterns
- **Div soup table** — no header associations; screen readers read a stream of unlabelled values
- **Infinite scroll table** — users lose position, can't reach the footer, can't share "page 3"
- **Spinner replacing the table** — layout jumps and context is lost on every sort
- **Twenty columns by default** — horizontal scroll hides key data; show 5–7, let users add more
- **Silent bulk delete** — no confirm or undo for a 200-row action

## Related patterns
- [Filters / faceted search](../forms/filters.md) — narrowing the rows
- [Search with autocomplete](../forms/search-autocomplete.md) — toolbar search
- [Master–detail](../navigation/master-detail.md) — row opens detail alongside
- [Modal vs. drawer](../data-feedback/modal-vs-drawer.md) — editing a row in place
- [Skeleton loading](../data-feedback/skeleton-loading.md) — loading rows
- [Empty states](../data-feedback/empty-states.md) — zero rows or no results
- [Confirmation dialog](../data-feedback/confirm-dialog.md) — destructive bulk actions

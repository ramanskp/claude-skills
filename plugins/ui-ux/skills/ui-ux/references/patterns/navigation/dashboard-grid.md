# Dashboard grid

> Users need an at-a-glance overview of key metrics and widgets, with a path to the detail behind each one.

## When to use
- Monitoring KPIs, status or activity across several sources on one screen.
- Home screen of an analytics, admin or operations product.
- Users scan for change ("is anything wrong?") before drilling in.

## When NOT to use
- Comparing many records across attributes → use [Data table](../data-feedback/data-table.md) instead
- Browsing a collection of similar items → use [Cards & lists](../data-feedback/cards-lists.md) instead
- One metric needs deep exploration → give it its own full page with [Filters](../forms/filters.md)
- Purely decorative tile mosaic → that's a style choice; see [Bento](../styles/bento.md)

## Anatomy
1. **Page header** — required; title, date-range picker, global filters, refresh/last-updated time.
2. **KPI row** — recommended; 3–5 stat tiles: label (`text-sm` muted), value (`text-2xl`/`text-3xl`, tabular numerals), delta with icon + sign + text ("▲ 12% vs last week").
3. **Widget** — required; card (`color-surface`, `radius-md`, `shadow-1` or border, padding `space-4`/`space-6`) with title, optional menu, content, and "View all" link.
4. **Grid** — required; 12-column grid, `space-4` (compact) or `space-6` gutters; widgets span 3, 4, 6 or 12 columns.
5. **Widget menu** — optional; overflow button for export, expand, remove.
6. **Customize mode** — optional; drag/resize, add widget, reset layout.

## Required states
| State | Behavior / appearance |
|-------|------------------------|
| Default | Widgets arranged by priority: top-left most important (F-pattern); each shows its data and timeframe. |
| Hover | Clickable widgets raise to `shadow-2` over `duration-fast`; chart points show tooltips with exact values. |
| Focus-visible | 2px `color-focus` ring on the widget link or the focused control within it. |
| Active / selected | Selected filter/date range shown in the header; drilled-into widget is highlighted when returning. |
| Disabled | n/a — hide widgets the user can't access; in customize mode, gray out widgets already added. |
| Loading | Each widget loads independently with a [skeleton](../data-feedback/skeleton-loading.md) at final size; no page-level spinner; no layout shift on resolve. |
| Empty | Per widget: "No orders in this period" + suggested action; first-run dashboard uses an [empty state](../data-feedback/empty-states.md) with setup steps. |
| Error | Per widget: inline "Couldn't load revenue" + "Retry"; other widgets unaffected. Stale data shows "Last updated 2h ago" with `color-warning` icon. |

## Behavior & responsive
- Limit to 5–9 widgets above the fold; more becomes noise. Put KPIs first, trends second, lists last.
- One global date range and filter set applies to all widgets; widget-level overrides must be labeled.
- Every widget links to its detail view; preserve filters in that link.
- Auto-refresh no faster than every 30–60s; pause when the tab is hidden; never reflow layout on refresh.
- Show "Last updated" time; announce manual refresh completion.
- Customize mode: drag with handle, keyboard alternative (move up/down/left/right buttons), "Reset layout", persist per user.
- **Large (≥ 1280px):** 12 columns; KPI tiles span 3; charts span 6; tables span 12.
- **Medium (1024–1279px):** charts span 6 or 12; KPIs span 3 or 6.
- **Tablet (640–1023px):** 2-column layout; KPIs 2 per row.
- **Mobile (< 640px):** single column in priority order; KPI row becomes a 2-up grid or horizontal scroll; tables become summary lists with "View all".

## Accessibility
- **Role / semantics:** each widget is a `<section>` with a heading (`<h2>`) as its accessible name; page has one `<h1>`.
- **Charts:** provide a text summary ("Revenue up 12% to $48k") and a data-table alternative or "View as table"; never rely on color alone (use patterns, labels, direct annotation).
- **Keyboard:** Tab order follows visual priority order (left-to-right, top-to-bottom); widget menus are `<button aria-haspopup aria-expanded>`; drag-and-drop has keyboard move controls (WCAG 2.5.7).
- **Announcements:** refresh results and layout changes announced via a polite `role="status"` region; deltas include direction in text ("up", "down"), not just arrows.
- **Focus management:** after removing a widget, focus moves to the next widget (or "Add widget"); returning from drill-down restores focus to the originating widget.

## Do & Don't
- ✅ Do: answer "what changed and is it good or bad?" with deltas and comparison periods.
- ✅ Do: use consistent units, number formats and timeframe across widgets.
- ✅ Do: make widget heights align to rows so the grid scans cleanly.
- ❌ Don't: use 3D, gauges or pie charts with > 5 slices for anything compared precisely.
- ❌ Don't: block the whole dashboard on the slowest query.
- ❌ Don't: show a metric without its timeframe.

## Anti-patterns
- **Wall of charts** — 20 equal-weight widgets with no hierarchy; nothing reads as important.
- **Dead-end widgets** — metrics that can't be clicked into force users to hunt for details.
- **Color-only status** — red/green deltas without icon or text fail color-blind users.
- **Jumping layout** — widgets resizing as data arrives cause misclicks and lost place.

## Related patterns
- [Data table](../data-feedback/data-table.md) — drill-down and chart alternative
- [Cards & lists](../data-feedback/cards-lists.md) — widget card structure
- [Filters](../forms/filters.md) — global dashboard filters
- [Date picker](../forms/date-picker.md) — date-range control
- [Skeleton loading](../data-feedback/skeleton-loading.md) — per-widget loading
- [Empty states](../data-feedback/empty-states.md) — first-run and no-data widgets
- [Bento](../styles/bento.md) — visual style preset for varied tile sizes

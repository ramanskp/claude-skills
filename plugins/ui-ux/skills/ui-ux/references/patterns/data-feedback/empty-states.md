# Empty States

> Users hit a screen with nothing to show and need to know why and what to do next.

## When to use
- **First use:** the user hasn't created anything yet ("No projects yet")
- **No results:** a search or filter returned zero matches
- **User-cleared:** inbox zero, all tasks done, all notifications read
- **No permission / not available:** content exists but the user can't see it, or the feature isn't set up
- Any container (table, list, panel, chart, dashboard widget) that can legitimately be empty

## When NOT to use
- Data is still loading → use [Skeleton loading](../data-feedback/skeleton-loading.md); never flash "No items" before the fetch resolves
- The request failed → show an error state with retry (see [Toasts](../data-feedback/toasts.md) decision guide: inline, not toast)
- A guided first-run tour across the product → use [Onboarding](../flows/onboarding.md)
- System-wide status (outage, trial ended) → use a banner, not an empty state

## Anatomy
1. **Illustration / icon** — optional; small, decorative, `color-text-muted`; never the only message
2. **Headline** — required; `text-lg`/`text-xl`; states the situation plainly ("No invoices yet")
3. **Explanation** — required; 1–2 sentences, `text-base` `color-text-muted`; why it's empty or what this area is for
4. **Primary action** — required for first-use and no-results; one button naming the outcome ("Create invoice", "Clear filters")
5. **Secondary action** — optional link ("Import from CSV", "Learn about invoices")
6. **Context retention** — the surrounding frame (header, toolbar, filters, table headers) stays visible

## Required states
| State | Behavior / appearance |
|-------|------------------------|
| Default | Centered in the container, max width ~45–60ch, vertical padding `space-12`; stack gap `space-4` |
| Hover | n/a — static content; only its buttons/links have hover states |
| Focus-visible | Primary/secondary actions show visible `color-focus` ring (3:1 contrast) |
| Active / selected | n/a — no selectable content |
| Disabled | If the user lacks permission to create, hide the button and explain who can ("Ask an admin to add members") rather than showing a disabled button |
| Loading | n/a — loading is a separate state; show skeleton until data resolves, then the empty state |
| Empty | This pattern; pick the variant: first-use (invite to create), no-results (echo query + clear filters), cleared (positive confirmation, no CTA needed) |
| Error | n/a — failures render an error state ("Couldn't load invoices" + "Retry"), never an empty state |

## Behavior & responsive
- Decide variant from data, not just `count == 0`: distinguish never-created, filtered-to-zero, and fetch failure
- No-results variant echoes the query and active filters: "No results for 'acme' in Paid invoices" + "Clear filters" + spelling or broader-search suggestions
- First-use variant may include a sample/template or import option to shorten time-to-value
- Cleared variant is celebratory but brief ("You're all caught up"); no forced CTA
- Small containers (widget, side panel): icon + one-line headline + inline link; skip illustrations
- When the user creates the first item, replace the empty state with the populated view immediately and focus the new item
- Don't animate illustrations by default; respect `prefers-reduced-motion`
- **Mobile (< 640px):** shrink or drop illustration; keep headline and primary action above the fold; full-width button ≥ 44px tall

## Accessibility
- **Role / semantics:** headline is a real heading at the correct level for the region; illustration `alt=""` / `aria-hidden="true"` when decorative
- **Keyboard:** primary action reachable by Tab right after the region heading/toolbar
- **Announcements:** when a filter/search produces zero results, announce via `role="status"` ("No results for 'acme'"); don't announce empty states on initial page load
- **Focus management:** after "Clear filters", keep focus on the filter area or move to the first result; after deleting the last item, move focus to the empty-state heading (`tabindex="-1"`) or primary action
- Text contrast ≥ 4.5:1 even when styled muted

## Do & Don't
- ✅ Do: say what's empty and give exactly one obvious next step
- ✅ Do: keep table headers, filters, and search visible on no-results so users can adjust
- ✅ Do: write copy in the product's voice, sentence case, no blame ("No matches", not "You entered nothing valid")
- ❌ Don't: show a blank white area or a lone "No data"
- ❌ Don't: show a "Create" CTA to users who can't create
- ❌ Don't: use the same generic empty state for first-use, no-results, and errors

## Anti-patterns
- **Flash of empty** — "No items" renders before data arrives, then content pops in; users think data is lost
- **Empty-as-error** — failed fetch shown as "Nothing here"; users believe their data is gone
- **Illustration-only** — big art, no explanation or action; looks polished, helps no one
- **Dead end** — no-results with no way to broaden, clear, or retry

## Related patterns
- [Skeleton loading](../data-feedback/skeleton-loading.md) — the state before you know it's empty
- [Data table](../data-feedback/data-table.md) — empty row within a retained header
- [Cards & lists](../data-feedback/cards-lists.md) — empty collection
- [Filters / faceted search](../forms/filters.md) — no-results with active filters
- [Search with autocomplete](../forms/search-autocomplete.md) — no-match suggestions
- [Onboarding](../flows/onboarding.md) — first-run guidance beyond one container

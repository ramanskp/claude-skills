# Skeleton Loading

> Users wait for content and need to see that it's coming and roughly what shape it will take, without layout jumps.

## When to use
- Initial load of content whose layout is known (lists, cards, tables, profile headers, dashboards)
- Loads expected to take ~300ms–10s
- Page or region transitions where the frame (nav, header, toolbar) renders immediately and content follows
- Progressive loading: show parts as they arrive (header first, then list)

## When NOT to use
- Expected wait < ~300ms → show nothing; a flash of skeleton feels slower
- Action feedback on a button (save, submit) → use an inline spinner/"Saving…" label in the button
- Long or measurable operations (> ~10s, uploads, exports) → use a determinate progress bar with percent/time (see [File upload](../forms/file-upload.md))
- Data loaded and empty → use [Empty states](../data-feedback/empty-states.md)
- Unknown layout (search results of mixed types) → a single compact spinner with label is acceptable

## Anatomy
1. **Frame** — real header, nav, toolbar, filters, and table headers render immediately; only data regions are skeletons
2. **Placeholder blocks** — `color-surface-raised` (or border-tinted) shapes matching final content: text lines, avatars (`radius-full`), media (fixed aspect ratio), buttons
3. **Text lines** — height of the target line-height; widths vary (100%, 90%, 60%) so it reads as text, last line shorter
4. **Repeat count** — matches the expected count (page size or last known count), capped to fill the viewport
5. **Shimmer / pulse** — optional subtle animation (~1.5–2s loop); disabled under `prefers-reduced-motion`
6. **Accessible label** — visually hidden "Loading invoices…" for assistive tech

## Required states
| State | Behavior / appearance |
|-------|------------------------|
| Default | Skeleton appears only after ~300ms delay; once shown, keep it ≥ ~500ms to avoid a flicker |
| Hover | n/a — placeholders are not interactive; no hover or pointer cursor |
| Focus-visible | n/a — placeholders are never focusable; real frame controls keep their focus styles |
| Active / selected | n/a — nothing to select until content arrives |
| Disabled | Controls depending on unloaded data (bulk actions, export) are disabled until load completes |
| Loading | This pattern; container has `aria-busy="true"`; shimmer/pulse animation unless reduced motion |
| Empty | Resolve to the [empty state](../data-feedback/empty-states.md), never leave skeletons when the result is zero |
| Error | Replace skeleton with inline error ("Couldn't load invoices" + "Retry") in the same region; never shimmer forever |

## Behavior & responsive
- Timing: 0–300ms show nothing; 300ms–10s skeleton; > 10s add a text hint ("Still loading…") and/or switch to progress with cancel
- Set a timeout (e.g. 15–30s) that converts the skeleton into an error with retry
- Skeleton dimensions match the real content so the swap causes zero layout shift (CLS ~0)
- Cross-fade skeleton → content over `duration-base` with `ease-standard`; with reduced motion, swap instantly
- Refetch / re-sort / pagination: keep stale content visible, dimmed, with a small inline indicator; don't flash skeletons over known data
- Load regions independently; one slow widget must not hold the whole page in skeleton
- Images: keep a media placeholder until the image decodes, then fade in
- Never use skeletons for content that will never exist (e.g. a sidebar section the user lacks access to)
- **Mobile (< 640px):** fewer repeats (fill one viewport, ~4–6 items); match the mobile layout (stacked cards, not desktop table columns)

## Accessibility
- **Role / semantics:** set `aria-busy="true"` on the region being loaded; remove (set `false`) when content is in place; hide placeholder shapes with `aria-hidden="true"`
- **Keyboard:** placeholders are not in the tab order; focus is never moved into a skeleton
- **Announcements:** one polite announcement via `role="status"` ("Loading invoices…") only for user-initiated loads that take > ~1s; announce completion only if useful ("24 invoices loaded"); never announce every shimmering block
- **Focus management:** if the user triggered the load (pagination, filter), keep focus on the trigger, or move it to the region heading once content arrives; don't steal focus on background refresh
- Animation: shimmer must not flash > 3 times per second (WCAG 2.3.1); stop under `prefers-reduced-motion`
- Placeholder color is decorative; no contrast requirement, but must be distinguishable from real content

## Do & Don't
- ✅ Do: render the real page frame instantly and skeleton only the data
- ✅ Do: delay ~300ms before showing, and keep it ~500ms minimum once visible
- ✅ Do: mirror the real layout (avatar circle + two lines, table rows with column widths)
- ❌ Don't: replace an entire page with one centered spinner
- ❌ Don't: show skeletons over data the user is already looking at during refresh
- ❌ Don't: leave skeletons up indefinitely when the request failed

## Anti-patterns
- **Skeleton flash** — sub-300ms loads flicker grey boxes, feeling slower than nothing
- **Generic skeleton** — same three grey bars for every screen; content then shifts massively
- **Infinite shimmer** — no timeout or error handling; users wait forever
- **Skeleton on every keystroke** — search-as-you-type blanks results each character; debounce and keep stale results

## Related patterns
- [Empty states](../data-feedback/empty-states.md) — what to show when the load returns nothing
- [Data table](../data-feedback/data-table.md) — skeleton rows with retained headers
- [Cards & lists](../data-feedback/cards-lists.md) — skeleton cards
- [Dashboard grid](../navigation/dashboard-grid.md) — per-widget loading
- [App shell](../navigation/app-shell.md) — the frame that renders first
- [File upload](../forms/file-upload.md) — determinate progress for long operations

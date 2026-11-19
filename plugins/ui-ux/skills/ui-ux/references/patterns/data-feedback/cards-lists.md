# Cards & Lists

> Users need to browse and pick from collections of visual or heterogeneous items without comparing every attribute.

## When to use
- Items have a strong visual (thumbnail, avatar, cover) or varied content (products, projects, articles, people)
- Browsing/discovery matters more than precise attribute comparison
- Each item has 1–2 key actions and a single destination (detail page)
- Simple lists: settings rows, notifications, contacts, activity feeds

## When NOT to use
- Users compare 3+ attributes across many records, sort, or bulk-edit → use [Data table](../data-feedback/data-table.md)
- Overview of metrics/widgets of different kinds → use [Dashboard grid](../navigation/dashboard-grid.md)
- Inspecting one item while keeping the list visible → use [Master–detail](../navigation/master-detail.md)

## Anatomy
1. **Container** — card: `color-surface`, `radius-md`, `shadow-1` or `color-border` outline; list row: divider only
2. **Media** — optional; fixed aspect ratio (16:9, 4:3, 1:1) so the grid doesn't jump while images load
3. **Title** — required; `text-lg` (card) or `text-base` weight 500 (list); the primary link
4. **Metadata** — optional; `text-sm` `color-text-muted` (owner, date, price); max 2 lines
5. **Status badge** — optional; icon + text, never color alone
6. **Actions** — max 1 primary inline action + overflow "More actions" menu
7. **Selection control** — optional checkbox for multi-select; visible on focus/selection, not hover-only
8. **Collection controls** — sort, filter, view toggle (grid/list), result count, pagination or "Load more"

## Required states
| State | Behavior / appearance |
|-------|------------------------|
| Default | Consistent card height per row; padding `space-4` (mobile) / `space-6` (desktop); gap `space-4`–`space-6` |
| Hover | Elevation `shadow-1` → `shadow-2` and/or `color-border-strong` over `duration-fast`; cursor pointer only if card is a link |
| Focus-visible | visible `color-focus` ring (3:1 contrast) around the whole card (focus on the title link, ring drawn on container) |
| Active / selected | Checked checkbox + `color-primary` border + `aria-selected`/`aria-checked`; selection count in a toolbar |
| Disabled | `color-text-muted`, no hover lift, reason shown ("Archived"); remains readable and focusable if it has info |
| Loading | [Skeleton](../data-feedback/skeleton-loading.md) cards matching real layout and count (e.g. 6–12); `aria-busy="true"` on the collection; images fade in `duration-base` |
| Empty | [Empty state](../data-feedback/empty-states.md) in the grid area with a primary action ("Create project") |
| Error | Collection-level inline error with "Retry"; per-card media failure shows a neutral placeholder, not a broken image icon |

## Behavior & responsive
- Grid columns by breakpoint: 1 (< 640px), 2 (≥ 640px), 3 (≥ 1024px), 4 (≥ 1280px); use auto-fill with a min card width, not fixed counts
- Whole-card click: make the title a real link and stretch its hit area over the card; nested buttons sit above it with their own targets
- Clamp titles to 2 lines and descriptions to 3 with ellipsis; full text on the detail page
- Sort order and filters persist in the URL; restore scroll position on back navigation
- Use "Load more" for catalogs, pagination for goal-oriented lookup, infinite scroll only for open-ended feeds (see INDEX decision guide)
- Lazy-load images below the fold; reserve space with aspect ratio to avoid layout shift (CLS)
- Grid/list view toggle remembers the user's choice
- **Mobile (< 640px):** single column; list rows preferred over big cards for scannability; targets ≥ 44px; swipe actions only as a shortcut duplicating a visible menu

## Accessibility
- **Role / semantics:** wrap collection in `<ul>`/`<li>` (or `role="list"`) so count is announced; card title is a heading (`<h2>`/`<h3>`) inside an `<article>` when content is rich
- **Keyboard:** Tab reaches the title link, then each inline action; don't make the card container itself a tab stop in addition to its link
- **Announcements:** result count updates via `role="status"` ("24 projects", "12 more loaded"); "Load more" moves focus to the first new item
- **Focus management:** after deleting a card, focus the next card (or the heading if list is empty); returning from detail restores focus to the originating card
- Images: meaningful `alt` for content images; `alt=""` for decorative thumbnails duplicating the title
- Don't wrap an entire card (with nested buttons) in one `<a>`; nested interactive content is invalid

## Do & Don't
- ✅ Do: keep card structure identical across items so the eye can scan the same position
- ✅ Do: show the result count and current sort above the collection
- ✅ Do: provide a visible overflow menu instead of hover-only action icons
- ❌ Don't: put 4+ buttons on a card; pick one primary and move the rest into a menu
- ❌ Don't: use cards for dense tabular data just because they look modern
- ❌ Don't: vary card heights randomly in a strict grid (use masonry only for media galleries)

## Anti-patterns
- **Card-in-card-in-card** — nested surfaces flatten hierarchy and waste space; use spacing and dividers
- **Mystery-meat cards** — image only, no title; unscannable and inaccessible
- **Hover-reveal everything** — metadata and actions invisible on touch and to keyboard users
- **Layout shift on image load** — content jumps under the cursor; reserve media space

## Related patterns
- [Data table](../data-feedback/data-table.md) — when attribute comparison dominates
- [Filters / faceted search](../forms/filters.md) — narrowing the collection
- [Master–detail](../navigation/master-detail.md) — list + detail side by side
- [Dashboard grid](../navigation/dashboard-grid.md) — widgets rather than items
- [Skeleton loading](../data-feedback/skeleton-loading.md) — loading cards
- [Empty states](../data-feedback/empty-states.md) — no items yet

# Breadcrumbs

> Users deep in a hierarchy need to see where they are and jump back to any ancestor in one click.

## When to use
- Hierarchies 3+ levels deep (Workspace › Project › Folder › File).
- Users land deep from search, links or notifications and need context.
- E-commerce categories, docs, file systems, admin record pages.

## When NOT to use
- Flat sites with 1–2 levels → the [Top navigation](../navigation/top-nav.md) active state is enough
- Linear processes (checkout, onboarding) → use a stepper from [Multi-step wizard](../forms/wizard.md) instead
- Replacing primary navigation → breadcrumbs are secondary; keep a [Sidebar](../navigation/sidebar.md) or top nav
- Showing browsing history → breadcrumbs reflect hierarchy (location), not the path the user took

## Anatomy
1. **Container** — required; sits above the page title, below the header, `space-4` from the title.
2. **Ancestor links** — required; each level is a link, `text-sm`, `color-text-muted`.
3. **Separator** — required; chevron or "/" with `space-2` either side, decorative (hidden from AT).
4. **Current page** — required; last item, `color-text`, not a link.
5. **Overflow menu** — optional; "…" button collapsing middle levels when there are > 4 items.
6. **Level switcher** — optional; a chevron menu on an item to jump to siblings (file browsers).

## Required states
| State | Behavior / appearance |
|-------|------------------------|
| Default | Muted ancestor links, `color-text` current item, separators in `color-text-muted`. |
| Hover | Link turns `color-text` with underline over `duration-fast`. |
| Focus-visible | 2px `color-focus` ring around the link text, offset 2px. |
| Active / selected | Current page: `aria-current="page"`, non-interactive, weight 500. |
| Disabled | n/a — every ancestor is reachable; if access is restricted, show the name as plain text. |
| Loading | Render known levels instantly; unknown names show short skeleton bars (`radius-sm`) at text height. |
| Empty | n/a — at the root level, omit breadcrumbs entirely rather than show a single item. |
| Error | If an ancestor name fails to resolve, show its ID or "Untitled" as a working link; never drop the level. |

## Behavior & responsive
- Start at the first meaningful level (home or workspace); skip redundant "Home" if the logo already links there.
- Show at most 4 items; collapse the middle into "…" keeping first, last-ancestor and current.
- Truncate long names at ≈ 24 characters with ellipsis; full name in tooltip and accessible name.
- Breadcrumbs must match the URL hierarchy; update immediately on navigation.
- Never wrap onto multiple lines at desktop widths.
- **Mobile (< 640px):** show only the parent as a back link ("‹ Project Alpha"), 44px tall target; or a horizontally scrollable trail scrolled to the end.

## Accessibility
- **Role / semantics:** `<nav aria-label="Breadcrumb">` containing an ordered list `<ol>` of `<li>` items with `<a href>` links (APG Breadcrumb pattern).
- **Current item:** `aria-current="page"` on the last item (a link to the current page or a plain element).
- **Separators:** rendered via CSS or with `aria-hidden="true"` so they aren't read as "slash" or "greater than".
- **Keyboard:** standard Tab between links; the overflow "…" is a `<button aria-expanded>` opening a list of links; Escape closes and returns focus to it.
- **Announcements:** screen readers announce "Breadcrumb navigation, list, 4 items"; don't add extra live regions.
- **Focus management:** no focus moves on load; after navigating via a crumb, focus follows normal page-load / route-change handling (to main heading).

## Do & Don't
- ✅ Do: use the same names as the page titles they point to.
- ✅ Do: keep breadcrumbs in the same position on every page.
- ✅ Do: pair with a visible page title; breadcrumbs don't replace the `<h1>`.
- ❌ Don't: make the current page look like a clickable link.
- ❌ Don't: use breadcrumbs on the homepage or top-level pages.
- ❌ Don't: show breadcrumbs that differ from the actual URL hierarchy.

## Anti-patterns
- **History trail** — "where you've been" crumbs duplicate the back button and confuse location.
- **Tiny targets** — separators eating space so links are < 24px tall fail WCAG 2.5.8.
- **Breadcrumbs as only nav** — users can't reach siblings or other sections.
- **Read-aloud separators** — "Home greater than Projects greater than..." clutters screen-reader output.

## Related patterns
- [Sidebar navigation](../navigation/sidebar.md) — primary nav breadcrumbs supplement
- [Top navigation](../navigation/top-nav.md) — breadcrumbs sit just below
- [Master–detail](../navigation/master-detail.md) — detail pages often carry breadcrumbs
- [App shell](../navigation/app-shell.md) — breadcrumb slot in the page header
- [Multi-step wizard](../forms/wizard.md) — use a stepper for sequences instead

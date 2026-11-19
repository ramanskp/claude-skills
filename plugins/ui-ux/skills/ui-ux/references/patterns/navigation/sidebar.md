# Sidebar navigation

> Users of a productivity app need persistent access to many destinations or a nested hierarchy without losing their place.

## When to use
- More than 7 app-level destinations, or sections with sub-pages (2 levels; 3 at most).
- Productivity tools, admin consoles, dashboards where users switch sections many times per session.
- User-generated destinations (projects, channels, folders) that grow over time.
- Wide screens (≥ 1024px) where horizontal space is cheaper than vertical.

## When NOT to use
- 3–7 flat destinations on a marketing site → use [Top navigation](../navigation/top-nav.md) instead
- Peer views of a single object → use [Tabs](../navigation/tabs.md) instead (see "Tabs vs. segmented control vs. sidebar" in [INDEX](../INDEX.md))
- Mobile-first app with 3–5 destinations → use [Bottom navigation](../navigation/bottom-nav.md) instead
- Browsing records with a detail pane → use [Master–detail](../navigation/master-detail.md) instead

## Anatomy
1. **Header** — optional; product logo or workspace switcher.
2. **Primary items** — required; icon (20–24px) + label, `text-sm`, row height 36–40px (comfortable) or 32px (compact).
3. **Group headings** — optional; `text-xs` `color-text-muted` overlines; group every 5–7 items.
4. **Nested items** — optional; indented `space-4` per level, collapsible parent with chevron.
5. **Badges / counts** — optional; right-aligned, tabular numerals, cap at "99+".
6. **Footer** — optional; settings, help, account; pinned to bottom.
7. **Collapse toggle** — optional; switches between expanded (≈ 15–18rem) and rail (icon-only, ≈ 4rem) modes.

## Required states
| State | Behavior / appearance |
|-------|------------------------|
| Default | `color-text` labels on `color-surface`; right `color-border` divider; items `radius-md` inset by `space-2`. |
| Hover | Row background `color-surface-raised` over `duration-fast`; in rail mode, show a tooltip with the label after ~300ms. |
| Focus-visible | 2px `color-focus` ring inside the row bounds (so it isn't clipped by overflow). |
| Active / selected | `aria-current="page"`; tinted background plus a `space-1`-wide leading bar in `color-primary`, weight 600. Parent of active child stays expanded and is marked as containing the current page. |
| Disabled | n/a — hide destinations the user lacks permission for; for upsells, keep the item enabled and route to an explanation page. |
| Loading | Static items render instantly; dynamic lists (projects) show 3–5 skeleton rows at real row height. |
| Empty | Dynamic section with no items shows one muted line + action ("No projects yet · Create project"). |
| Error | Dynamic section failed: inline message "Couldn't load projects" + "Retry" button; rest of nav works. |

## Behavior & responsive
- Persist expanded/collapsed state and open groups per user across sessions.
- Scroll the item list independently; keep header and footer fixed. Scroll the active item into view on load.
- Long labels truncate with ellipsis and expose the full text via tooltip / title.
- Expand/collapse animates width over `duration-base` with `ease-standard`; instant under `prefers-reduced-motion`.
- Cap nesting at 2 levels in the sidebar; deeper hierarchy belongs in page content + [Breadcrumbs](../navigation/breadcrumbs.md).
- Optional resize handle: clamp between rail width and ≈ 22rem; double-click resets.
- **Large (≥ 1280px):** expanded by default.
- **Medium (1024–1279px):** rail mode by default, expand on toggle (push content, don't overlay).
- **Tablet / mobile (< 1024px):** hidden off-canvas; a 44×44px menu button opens it as a modal drawer with a scrim; selecting an item closes it. On < 640px consider [Bottom navigation](../navigation/bottom-nav.md) for the top 3–5 items.

## Accessibility
- **Role / semantics:** `<nav aria-label="Primary">` containing nested `<ul>` lists of `<a href>`. Group headings are real headings or `aria-labelledby` on the group list.
- **Keyboard:** Tab/Shift+Tab move between links; expandable parents are `<button aria-expanded>` toggled with Enter/Space. Use `role="tree"` (arrow-key nav) only for file-tree-like structures, never for ordinary links.
- **Announcements:** `aria-current="page"` on the active link; badges include text ("3 unread"), not just a number; rail-mode icons keep the label as accessible name.
- **Focus management:** opening the mobile drawer moves focus into it, traps focus, Escape closes and returns focus to the menu button. Collapsing the sidebar keeps focus on the toggle.

## Do & Don't
- ✅ Do: put the 3–5 most-used destinations at the top; settings and help at the bottom.
- ✅ Do: keep icons consistent in style and size; labels carry the meaning.
- ✅ Do: allow keyboard shortcut to toggle the sidebar (e.g. `[`), documented in help.
- ❌ Don't: use icon-only rail as the only mode; new users can't learn it.
- ❌ Don't: auto-expand on hover; it causes accidental overlays.
- ❌ Don't: mix navigation links with action buttons ("New project") without visual separation.

## Anti-patterns
- **Infinite nesting** — 4+ levels make users lose their place; flatten or move to page content.
- **Accordion that collapses others** — closing the group the user just used forces re-navigation.
- **Overlay on desktop** — expanded sidebar covering content blocks the work it navigates to.
- **Unlabeled rail** — icons without tooltips or accessible names are mystery meat.

## Related patterns
- [App shell](../navigation/app-shell.md) — sidebar is the shell's primary nav region
- [Top navigation](../navigation/top-nav.md) — alternative for few, flat sections
- [Breadcrumbs](../navigation/breadcrumbs.md) — location below sidebar depth
- [Bottom navigation](../navigation/bottom-nav.md) — mobile replacement
- [Modal vs. drawer](../data-feedback/modal-vs-drawer.md) — off-canvas drawer behavior
- [Empty states](../data-feedback/empty-states.md) — empty dynamic sections

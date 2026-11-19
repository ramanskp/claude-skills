# Top navigation

> Users need to see and reach the 3–7 top-level sections of a site or simple app from any page.

## When to use
- Marketing sites, docs portals and simple apps with 3–7 top-level destinations.
- Flat information architecture: each section is at most 1–2 levels deep.
- Content needs the full viewport width (articles, product pages, landing pages).
- Brand presence matters: logo, primary CTA ("Start free trial") and account menu live in one bar.

## When NOT to use
- More than 7 destinations or nested hierarchy → use [Sidebar navigation](../navigation/sidebar.md) instead
- Switching peer views of one object → use [Tabs](../navigation/tabs.md) instead (see "Tabs vs. segmented control vs. sidebar" in [INDEX](../INDEX.md))
- Mobile-first app with 3–5 primary destinations → use [Bottom navigation](../navigation/bottom-nav.md) instead
- Full productivity app frame → compose it inside an [App shell](../navigation/app-shell.md)

## Anatomy
1. **Logo / home link** — required; links to home, has accessible name of the product, not "logo".
2. **Primary links** — required; 3–7 items, `text-sm`/`text-base`, `space-6` apart, ordered by usage.
3. **Dropdown / mega menu** — optional; only for sections with 4+ children; max 2 columns of ≤ 8 links each, or a mega menu grouped by heading.
4. **Search** — optional; icon button that expands, or a field ≥ 12rem wide on desktop.
5. **Primary CTA** — optional; one `color-primary` button, rightmost before account.
6. **Account / utility menu** — optional; avatar or "Sign in" link at the far end.
7. **Mobile menu toggle** — required below the collapse breakpoint; 44×44px hamburger with a text label where space allows.

## Required states
| State | Behavior / appearance |
|-------|------------------------|
| Default | `color-text` links on `color-surface`; bar height ≈ 56–64px desktop, 56px mobile; bottom `color-border` divider or `shadow-1` once scrolled. |
| Hover | Link text shifts to `color-primary` or gets a `color-surface-raised` background over `duration-fast`; dropdown opens after ~100ms hover intent, closes after ~300ms grace. |
| Focus-visible | 2px `color-focus` ring offset 2px around the link; never removed. |
| Active / selected | Current section: `aria-current="page"` plus a bottom indicator bar in `color-primary` and weight 600; never color alone. |
| Disabled | n/a — remove links the user cannot access; do not show disabled nav links. |
| Loading | Bar renders immediately (static). Account slot shows a `radius-full` skeleton circle until session resolves; no layout shift. |
| Empty | n/a — a nav always has at least the home link; hide optional slots (search, CTA) rather than leaving gaps. |
| Error | If dynamic menu data fails, fall back to the static top-level links; never render an empty bar. |

## Behavior & responsive
- Keep the label set short (1–2 words each); if labels wrap at 1024px you have too many items.
- Sticky bars: hide on scroll down and reveal on scroll up only on content-heavy pages; always re-show on focus.
- Sticky header must not obscure focused elements (WCAG 2.4.11): add `scroll-padding-top` equal to bar height.
- Dropdowns open on click/Enter for touch and keyboard; hover-open is a desktop enhancement only.
- Close dropdowns on Escape, outside click, or focus leaving the menu.
- Mega menus animate with opacity over `duration-base`; no slide when `prefers-reduced-motion`.
- **Tablet (640–1023px):** collapse secondary links into a "More" menu; keep logo, 3–4 primary links, CTA.
- **Mobile (< 640px):** logo + menu toggle (+ optional search icon). Toggle opens a full-height panel or drawer with links stacked, 48px rows, current page marked. Lock body scroll while open.

## Accessibility
- **Role / semantics:** wrap links in `<nav aria-label="Main">`; use a `<ul>` of `<a href>` links. One "Main" nav per page; label others ("Footer", "Account").
- **Keyboard:** Tab moves between top-level links; Enter/Space on a disclosure button toggles its submenu; Escape closes and returns focus to the trigger; Tab continues into open submenus.
- **Pattern:** use the APG *disclosure navigation* pattern (`<button aria-expanded aria-controls>`), not `role="menu"`/`menubar`, which is for application menus and changes keyboard expectations.
- **Announcements:** `aria-current="page"` on the current link; mobile toggle is a `<button>` with `aria-expanded` and name "Menu".
- **Focus management:** opening the mobile panel moves focus to the first link (or panel close button); trap focus while modal; closing returns focus to the toggle. Provide a "Skip to main content" link before the nav.

## Do & Don't
- ✅ Do: order links by frequency of use; put the most important task leftmost (LTR).
- ✅ Do: keep the same items and order on every page.
- ✅ Do: make the parent of a dropdown a real link or a button, not both.
- ❌ Don't: use icons alone for top-level links on desktop.
- ❌ Don't: open dropdowns on hover only; touch and keyboard users can't reach them.
- ❌ Don't: put more than one primary CTA in the bar.

## Anti-patterns
- **Hamburger on desktop** — hides navigation that fits; discoverability drops sharply.
- **Split-link dropdown parent** — clicking the label navigates while the chevron opens; tiny, ambiguous targets.
- **Mystery-meat labels** — clever names ("Discover", "Solutions") hide what's behind them.
- **Jumping sticky header** — bar height changes on scroll and shifts content (CLS).
- **Nav as `role="menubar"`** — forces arrow-key navigation screen-reader users don't expect on websites.

## Related patterns
- [App shell](../navigation/app-shell.md) — the frame top nav usually lives in
- [Sidebar navigation](../navigation/sidebar.md) — scale up when sections exceed 7
- [Bottom navigation](../navigation/bottom-nav.md) — mobile app alternative
- [Breadcrumbs](../navigation/breadcrumbs.md) — sits below the bar for deep pages
- [Search with autocomplete](../forms/search-autocomplete.md) — search slot behavior
- [Modal vs. drawer](../data-feedback/modal-vs-drawer.md) — mobile menu panel behavior

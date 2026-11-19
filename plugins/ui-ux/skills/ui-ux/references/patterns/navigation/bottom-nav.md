# Bottom navigation

> Mobile users need one-thumb access to the 3–5 primary destinations of an app.

## When to use
- Mobile apps and mobile web apps with 3–5 top-level destinations of similar importance.
- Destinations users switch between often within a session (Home, Search, Inbox, Profile).
- Viewports < 640px (optionally up to 1023px on touch tablets).

## When NOT to use
- Fewer than 3 destinations → use [Tabs](../navigation/tabs.md) or a simple header instead
- More than 5 destinations → put the top 4 in bottom nav + "More", or use a [Sidebar](../navigation/sidebar.md) drawer
- Desktop layouts → use [Top navigation](../navigation/top-nav.md) or [Sidebar](../navigation/sidebar.md) instead
- Actions (Compose, Upload) → use a primary button or floating action button, not a nav item
- Single-task flows (checkout, wizard, auth) → hide bottom nav; see [Checkout](../flows/checkout.md)

## Anatomy
1. **Bar** — required; fixed to the viewport bottom, `color-surface`, top `color-border` or `shadow-1`, height ≈ 56–64px plus safe-area inset.
2. **Destination items** — required; 3–5, equal width, each ≥ 48×48px target.
3. **Icon** — required; 24px, outline for inactive, filled for active.
4. **Label** — required; `text-xs`, 1 word, always visible (not only on active item).
5. **Badge** — optional; dot or count (cap "99+") on the icon's top-end corner.

## Required states
| State | Behavior / appearance |
|-------|------------------------|
| Default | Outline icon + label in `color-text-muted`. |
| Hover | Pointer devices only: `color-surface-raised` pill behind icon over `duration-fast`. |
| Focus-visible | 2px `color-focus` ring around the whole item (icon + label). |
| Active / selected | `aria-current="page"`; filled icon, `color-primary` icon and label, `radius-full` indicator pill behind icon; weight 600 label. On press, brief tint over `duration-fast` (none under `prefers-reduced-motion`). |
| Disabled | n/a — never disable a primary destination; show its own empty or sign-in state instead. |
| Loading | Bar is static and renders instantly; the destination's content loads with skeletons, the bar never shows a spinner. |
| Empty | n/a — the bar always has 3–5 items; empty content is handled by the destination screen. |
| Error | n/a for the bar; errors live in the destination screen. Badges hide (not "0" or "!") if counts fail. |

## Behavior & responsive
- Tapping an item switches destination instantly (no transition longer than `duration-base`).
- Each destination keeps its own navigation stack and scroll position; switching back restores them.
- Tapping the already-active item scrolls to top, then pops to that destination's root.
- Keep the bar visible; hiding on scroll down is acceptable only for reading-heavy screens and it must reappear on scroll up.
- Hide the bar when the on-screen keyboard is open and in full-screen flows (camera, checkout, compose).
- Respect the device safe-area inset at the bottom; never place items in the home-indicator zone.
- Add bottom padding to page content equal to bar height so the last item isn't covered.
- **Tablet (640–1023px):** switch to a side rail (icons + labels) or keep bottom nav with centered items, max ≈ 30rem wide.
- **Desktop (≥ 1024px):** replace with [Sidebar](../navigation/sidebar.md) or [Top navigation](../navigation/top-nav.md), same destinations and order.

## Accessibility
- **Role / semantics:** `<nav aria-label="Primary">` containing a `<ul>` of `<a href>` links. Don't use `role="tablist"`: items navigate between destinations, they don't switch panels in place.
- **Keyboard:** Tab/Shift+Tab move between items in DOM order; Enter activates. DOM order matches visual left-to-right order.
- **Announcements:** `aria-current="page"` on the active item; label text is the accessible name; badges add text ("Inbox, 3 unread").
- **Focus management:** after switching destination, move focus to the new screen's main heading (or top of main) and announce the title; bar stays reachable at the end of the tab order or via a skip link.
- **Targets:** ≥ 44×44px (48px preferred), with no gaps that cause mis-taps between items.

## Do & Don't
- ✅ Do: keep the same items in the same order on every top-level screen.
- ✅ Do: always show labels; icons alone are ambiguous.
- ✅ Do: match the order of your desktop navigation.
- ❌ Don't: put more than 5 items, or a "More" item holding critical destinations.
- ❌ Don't: mix actions (Compose) with destinations inside the bar.
- ❌ Don't: stack bottom nav with a bottom toolbar or bottom tabs.

## Anti-patterns
- **Hidden labels** — icon-only bars force users to guess and hurt screen-reader users.
- **Reset on switch** — losing the destination's stack and scroll punishes multitasking.
- **Bar over content** — no bottom padding means the last list item or CTA is unreachable.
- **Hamburger plus bottom nav** — two competing primary navs split mental models.

## Related patterns
- [App shell](../navigation/app-shell.md) — bottom nav is the mobile shell's primary nav
- [Sidebar navigation](../navigation/sidebar.md) — desktop equivalent
- [Top navigation](../navigation/top-nav.md) — desktop equivalent for simpler apps
- [Tabs](../navigation/tabs.md) — for in-page peer views
- [Skeleton loading](../data-feedback/skeleton-loading.md) — destination loading

# App shell

> Users of an app need a stable frame (header, navigation, content) so only the content changes as they move around.

## When to use
- Any multi-screen web or desktop app where users stay for long sessions.
- Products with persistent global elements: navigation, search, notifications, account.
- SPAs that swap content without full page reloads and need a fast first paint of the frame.

## When NOT to use
- Single-page marketing sites → a [Top navigation](../navigation/top-nav.md) header is enough
- Focused single-task flows (auth, checkout, onboarding) → use a minimal frame; see [Authentication](../flows/auth.md), [Checkout](../flows/checkout.md)
- Embedded widgets or iframes → let the host provide the frame

## Anatomy
1. **Skip link** — required; first focusable element, "Skip to main content", visible on focus.
2. **Header** — required; `<header>`, 56–64px tall, logo, global search, notifications, account menu.
3. **Primary navigation** — required; [Sidebar](../navigation/sidebar.md) (many sections), [Top nav](../navigation/top-nav.md) (few) or [Bottom nav](../navigation/bottom-nav.md) (mobile).
4. **Page header** — recommended; [Breadcrumbs](../navigation/breadcrumbs.md), `text-2xl` `<h1>`, primary page action on the right.
5. **Main content** — required; `<main id="main">`, padding `space-4` mobile / `space-6`–`space-8` desktop, max reading width ≈ 75ch for text-heavy pages.
6. **Global banner region** — optional; above the header for system-wide status (outage, trial ending).
7. **Secondary panel** — optional; right-side inspector or help panel, collapsible.
8. **Toast region** — required if toasts are used; fixed corner, live region.

## Required states
| State | Behavior / appearance |
|-------|------------------------|
| Default | Header and nav fixed; only `<main>` scrolls. `color-bg` page, `color-surface` header and nav. |
| Hover | n/a at shell level — hover states belong to the contained nav items and controls. |
| Focus-visible | Skip link appears top-left on focus with `color-focus` ring and `shadow-2`; all shell controls show 2px `color-focus` rings. |
| Active / selected | Current destination marked in the nav with `aria-current="page"`; document `<title>` reflects the page ("Invoices · Acme"). |
| Disabled | n/a — the shell is never disabled; block interaction only via a modal with a reason. |
| Loading | Initial: render the shell immediately, [skeleton](../data-feedback/skeleton-loading.md) in `<main>`. Route change: keep old content, show a thin top progress bar after 300ms, swap when ready. |
| Empty | n/a for the shell; first-run content uses [Empty states](../data-feedback/empty-states.md) or [Onboarding](../flows/onboarding.md). |
| Error | Route-level error replaces only `<main>` with message + retry; nav stays usable. Offline: persistent banner "You're offline. Changes will sync when you reconnect." |

## Behavior & responsive
- Shell must paint within the first frame; never block it on data fetches.
- Preserve nav state (expanded groups, scroll) across route changes.
- Each route sets a unique document title and updates the URL; back/forward always work.
- Use one scroll container (`<main>` or the document); never nest scrollable regions that trap wheel scroll.
- Sticky header: apply `scroll-padding-top` so focused elements aren't hidden behind it (WCAG 2.4.11).
- Layering order (low → high): content, sticky header, drawers, modals, toasts.
- **Large (≥ 1280px):** header + expanded sidebar + main (+ optional right panel).
- **Medium (1024–1279px):** sidebar collapses to rail; right panel overlays as a drawer.
- **Tablet (640–1023px):** sidebar becomes an off-canvas drawer opened by a 44×44px menu button.
- **Mobile (< 640px):** compact header (title + 1–2 actions) and [Bottom navigation](../navigation/bottom-nav.md) for 3–5 destinations; secondary items in an account/"More" screen.

## Accessibility
- **Landmarks:** exactly one `<header>` (banner), one `<main>`, `<nav>` elements each with a unique `aria-label` ("Primary", "Breadcrumb"), optional `<aside>` for side panels, `<footer>` if present.
- **Skip link:** first in DOM, targets `<main id="main" tabindex="-1">`; visible on focus (WCAG 2.4.1).
- **Keyboard:** logical tab order: skip link → header → nav → main → side panel. Optional F6 cycles landmarks; document global shortcuts and avoid single-key shortcuts without a way to turn them off (WCAG 2.1.4).
- **Announcements:** on client-side route change, announce the new page title via a polite live region or by focusing the `<h1>`. Toast region uses `role="status"` (polite); critical errors `role="alert"`.
- **Focus management:** after navigation, move focus to the `<h1>` or `<main>`; never leave it on a removed element. Drawer/modal open → trap focus; close → return to trigger.

## Do & Don't
- ✅ Do: keep global elements in the same place on every screen (WCAG 3.2.3 consistent navigation).
- ✅ Do: give each page one `<h1>` and one primary action in the page header.
- ✅ Do: reserve space for dynamic header items to avoid layout shift.
- ❌ Don't: put page-specific actions in the global header.
- ❌ Don't: make the header taller than 64px or stack multiple sticky bars on mobile.
- ❌ Don't: full-screen spinner over the whole shell on route change.

## Anti-patterns
- **Blank-until-ready** — white screen while data loads; users think the app is broken.
- **Double scrollbars** — nested scroll containers trap wheel and touch scrolling.
- **Silent route changes** — screen-reader users aren't told the page changed.
- **Sticky stack** — header + banner + tabs + toolbar all sticky leaves little room for content on small screens.

## Related patterns
- [Sidebar navigation](../navigation/sidebar.md) — primary nav for complex apps
- [Top navigation](../navigation/top-nav.md) — primary nav for simple apps
- [Bottom navigation](../navigation/bottom-nav.md) — mobile primary nav
- [Breadcrumbs](../navigation/breadcrumbs.md) — page header location
- [Toasts](../data-feedback/toasts.md) — shell-level notification region
- [Skeleton loading](../data-feedback/skeleton-loading.md) — content loading inside the shell

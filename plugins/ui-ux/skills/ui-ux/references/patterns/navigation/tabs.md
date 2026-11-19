# Tabs

> Users need to switch between 2–7 peer views of the same object without leaving the page.

## When to use
- 2–7 peer views of one object with distinct content (Overview / Activity / Settings of a project).
- Users rarely need to see two views at once.
- Each panel has enough content to justify its own view.

## When NOT to use
- 2–4 options that filter or re-render the *same* content (Day / Week / Month) → use a segmented control (see "Tabs vs. segmented control vs. sidebar" in [INDEX](../INDEX.md))
- App-level destinations or more than 7 views → use [Sidebar navigation](../navigation/sidebar.md) instead
- Sequential steps the user must complete in order → use [Multi-step wizard](../forms/wizard.md) instead
- Users must compare content side by side → show sections on one page or use [Master–detail](../navigation/master-detail.md)
- Narrowing a result set → use [Filters](../forms/filters.md) instead

## Anatomy
1. **Tab list** — required; horizontal row, bottom `color-border` divider, `space-6` between tabs (or `space-4` compact).
2. **Tab** — required; 1–2 word label in sentence case, `text-sm`/`text-base`, min height 40px (44px touch); optional leading icon and count badge.
3. **Selection indicator** — required; `color-primary` underline bar plus weight 600.
4. **Tab panel** — required; content area, `space-6` top padding.
5. **Overflow control** — optional; "More" menu or scroll buttons when tabs exceed width.

## Required states
| State | Behavior / appearance |
|-------|------------------------|
| Default | `color-text-muted` label, no indicator. |
| Hover | Label to `color-text`, subtle `color-border-strong` underline over `duration-fast`. |
| Focus-visible | 2px `color-focus` ring around the tab; ring is not clipped by the scroll container. |
| Active / selected | `aria-selected="true"`, `color-text` weight 600, `color-primary` indicator; indicator slides between tabs over `duration-base` (fade only under `prefers-reduced-motion`). |
| Disabled | Avoid; if needed, `color-text-muted` at reduced opacity, `aria-disabled="true"`, still focusable, with tooltip explaining why. |
| Loading | Tab list renders immediately; panel shows [skeleton](../data-feedback/skeleton-loading.md) matching its layout; don't block switching. |
| Empty | Panel shows an [empty state](../data-feedback/empty-states.md); keep the tab visible (optionally with "0" count). |
| Error | Panel-level inline error with retry; other tabs remain usable. Optional error icon on the tab with text alternative. |

## Behavior & responsive
- Default selection is the first tab unless the URL says otherwise.
- Reflect the selected tab in the URL (path or `?tab=`) when panels are substantial, so it survives reload, back and sharing.
- Preserve each panel's scroll position and unsaved input when switching; warn before discarding edits.
- Never wrap tab labels to two rows; never stack two rows of tabs.
- Lazy-load heavy panels on first activation; cache afterward.
- Tab order is fixed; don't reorder by usage.
- **Overflow:** keep the selected tab visible; scroll horizontally with fade edges or move trailing tabs into "More".
- **Mobile (< 640px):** horizontally scrollable tab list with 44px targets; if > 4 tabs, consider a select menu or separate pages. Panels stack full width.

## Accessibility
- **Role / semantics:** container `role="tablist"` (with `aria-label` or `aria-labelledby`); each tab `role="tab"` with `aria-selected` and `aria-controls`; each panel `role="tabpanel"` with `aria-labelledby` pointing to its tab. Tabs that change the URL to separate pages are just a nav of links with `aria-current="page"`, not ARIA tabs.
- **Keyboard (APG):** Tab moves focus into the tablist to the *selected* tab (roving tabindex: selected tab `tabindex="0"`, others `-1`); Left/Right arrows move between tabs and wrap; Home/End jump to first/last; Tab again moves to the panel (give the panel `tabindex="0"` if it has no focusable content). Vertical tablists use Up/Down and set `aria-orientation="vertical"`.
- **Activation:** automatic (selection follows focus) when panels render instantly; manual (arrow moves focus, Enter/Space activates) when panels load slowly or fetch data.
- **Announcements:** screen readers announce "tab, selected, 2 of 4"; count badges need text ("Comments, 12").
- **Focus management:** switching tabs never moves focus into the panel automatically; closing a closable tab moves focus to the adjacent tab.

## Do & Don't
- ✅ Do: keep labels short, specific nouns ("Members", not "Manage your members").
- ✅ Do: place tabs directly above the content they control.
- ✅ Do: keep shared actions (Save, object header) outside the panels.
- ❌ Don't: use tabs for a sequence or for a form split arbitrarily.
- ❌ Don't: nest tabs inside tabs.
- ❌ Don't: hide validation errors in an inactive tab without marking that tab.

## Anti-patterns
- **Tabs as primary app navigation** — breaks back button and landmarks; use a sidebar or top nav.
- **Two-row tabs** — rows jump on selection and destroy spatial memory.
- **Selection by color only** — fails WCAG 1.4.1; always add an indicator and weight.
- **Content reset on switch** — losing scroll, filters or draft input punishes exploration.

## Related patterns
- [Sidebar navigation](../navigation/sidebar.md) — app-level destinations
- [Top navigation](../navigation/top-nav.md) — site-level sections
- [Multi-step wizard](../forms/wizard.md) — ordered steps instead of peers
- [Settings](../flows/settings.md) — often uses tabs or sidebar sections
- [Skeleton loading](../data-feedback/skeleton-loading.md) — panel loading
- [Empty states](../data-feedback/empty-states.md) — empty panels

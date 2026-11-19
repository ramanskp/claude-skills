# Modal vs. Drawer

> Users need to complete a focused sub-task layered over the current page, and the container must match how much context and space the task needs.

## When to use
- **Modal (dialog):** short, blocking decision or input (≤ ~5 fields); user must finish or cancel before continuing (rename, invite, quick create)
- **Drawer (side sheet):** user needs the page visible, or inspects/edits one item from a list (row details, filters, comment thread)
- **Non-modal drawer:** reference panel that stays open while the user keeps working (help, properties panel)
- **Bottom sheet:** mobile equivalent for short choices or actions

## When NOT to use
- Long, complex, multi-step, or deep-linkable task → use a full page or [Multi-step wizard](../forms/wizard.md)
- Destructive confirmation → use [Confirmation dialog](../data-feedback/confirm-dialog.md) (an `alertdialog`)
- Transient success feedback → use [Toasts](../data-feedback/toasts.md)
- Persistent list + detail browsing → use [Master–detail](../navigation/master-detail.md)
- Primary navigation → use [Sidebar](../navigation/sidebar.md); don't open nav in a modal on desktop
- Never stack a modal on a modal; restructure the flow instead

## Anatomy
1. **Backdrop / scrim** — modal and modal drawer only; dims page (`color-bg` overlay); click closes only if no unsaved input
2. **Surface** — `color-surface`, `shadow-3`; modal `radius-lg`, centered, widths sm / md / lg (~40ch / ~60ch / ~80ch); drawer full height, ~25–40% of viewport width, edge-anchored
3. **Header** — title (`text-xl`, required, becomes accessible name) + close button "×"
4. **Body** — scrolls independently when content overflows; padding `space-6`
5. **Footer** — actions right-aligned (desktop): secondary "Cancel" then primary verb ("Save changes"); sticky in drawers
6. **Optional description** — one sentence under the title, referenced by `aria-describedby`

## Required states
| State | Behavior / appearance |
|-------|------------------------|
| Default | Modal: fade + scale 0.96→1 over `duration-base`; drawer: slide from edge over `duration-slow`; reduced motion → opacity only |
| Hover | Close and footer buttons show hover color; backdrop shows no hover effect |
| Focus-visible | visible `color-focus` ring (3:1 contrast) on all controls; focus visible on open |
| Active / selected | n/a — the container itself isn't selectable; for drawers tied to a list row, the source row stays highlighted |
| Disabled | Primary action disabled only while submitting or invalid-with-explanation; prefer enabling and validating on submit |
| Loading | Body skeleton if content is fetched; submit shows inline spinner + "Saving…", prevent double submit, keep dialog open |
| Empty | n/a — never open an empty container; for drawers with lists, use an [empty state](../data-feedback/empty-states.md) in the body |
| Error | Inline error at top of body or at the field; dialog stays open with input preserved; never close on failure |

## Behavior & responsive
- Choose modal when interruption is intentional; choose drawer when the user benefits from seeing the page (compare, copy, reference)
- Close via: "×" button, Cancel, Esc, backdrop click (modal only, and only when nothing is dirty)
- Unsaved changes: on close attempt, ask "Discard changes?" (Discard / Keep editing) — or better, autosave drafts
- Lock background scroll while a modal is open; drawers that are non-modal leave the page scrollable
- Opening a drawer for another list row swaps content in place rather than closing/reopening
- Drawer state (which item is open) should be reflected in the URL when users may share or refresh it
- Max height for modal ~85vh; body scrolls, header and footer stay fixed
- **Mobile (< 640px):** modals become full-screen sheets or bottom sheets (with drag handle + visible close button); drawers become full-screen; footer buttons stack full width with primary on top or right; targets ≥ 44px; respect safe areas

## Accessibility
- **Role / semantics:** `role="dialog"` (or native `<dialog>` opened with `showModal()`), `aria-modal="true"` for modal surfaces, `aria-labelledby` → title, optional `aria-describedby` → description; non-modal drawer is `role="dialog"` without `aria-modal` or a labelled `complementary` region
- **Keyboard:** Esc closes; Tab / Shift+Tab cycle within the modal (focus trap); Enter submits only from form fields, never accidentally from anywhere
- **Focus on open:** move focus to the first meaningful element: first input for forms, the title/body (`tabindex="-1"`) for long read content, the least destructive action for decisions
- **Focus on close:** return focus to the trigger element; if the trigger is gone (deleted row), focus the next logical element
- **Background:** page content behind a modal is inert (`inert` attribute or `aria-hidden` on siblings); non-modal drawers keep the page interactive, with F6 or a shortcut to move between page and panel
- **Announcements:** opening is announced by focus moving into a labelled dialog; submission errors announced via `role="alert"` inside the dialog
- Focus must not be obscured by sticky headers/footers inside the surface (WCAG 2.4.11)

## Do & Don't
- ✅ Do: title the dialog with the task ("Invite teammates"), and name the primary button with the outcome ("Send invites")
- ✅ Do: preserve input on error and on accidental backdrop click
- ✅ Do: use a drawer for "edit row" so the table stays visible
- ❌ Don't: open modals on page load or without user action (except blocking legal/consent requirements)
- ❌ Don't: put a 15-field form or a wizard inside a modal
- ❌ Don't: rely on backdrop click as the only way to close

## Anti-patterns
- **Modal on modal** — focus management breaks and users lose their place
- **Leaky focus trap** — Tab escapes into the dimmed page; keyboard users get lost
- **Close-on-fail** — submit fails, dialog closes, input lost
- **Scroll-through** — background scrolls behind an open modal on mobile

## Related patterns
- [Confirmation dialog](../data-feedback/confirm-dialog.md) — specialized modal for destructive actions
- [Master–detail](../navigation/master-detail.md) — persistent alternative to a drawer
- [Multi-step wizard](../forms/wizard.md) — when the task outgrows a modal
- [Form layout](../forms/form-layout.md) — fields inside the surface
- [Filters / faceted search](../forms/filters.md) — filter drawer on mobile
- [Toasts](../data-feedback/toasts.md) — confirmation after the dialog closes

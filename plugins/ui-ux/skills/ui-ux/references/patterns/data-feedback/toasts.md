# Toasts

> Users need brief confirmation that an action they took succeeded (or can be undone) without being interrupted.

## When to use
- Confirming a user-initiated action that completed off-screen or without a visible change ("Invoice sent")
- Offering undo for a reversible action ("Project archived · Undo")
- Background task finished that the user started ("Export ready · Download")
- Low-priority, transient info the user can safely miss

## When NOT to use
- Field or form errors → inline message at the field (see [Inline validation](../forms/inline-validation.md))
- System- or page-wide persistent status (outage, trial ending, unsaved changes) → banner
- Anything the user must read, decide, or act on to continue → [Confirmation dialog](../data-feedback/confirm-dialog.md) or [Modal vs. drawer](../data-feedback/modal-vs-drawer.md)
- The UI already shows the change clearly (item appears in the list) → no toast needed
- Critical errors as the only signal → show inline/region error; a toast may only duplicate it

## Anatomy
1. **Container** — `color-surface-raised` (or inverse), `radius-md`, `shadow-2`, padding `space-3`/`space-4`, max width ~40ch
2. **Status icon** — optional; success/info/warning/danger icon paired with text, never color alone
3. **Message** — required; one line, ≤ ~80 characters, past tense, names the object ("'Q3 report' deleted")
4. **Action** — optional; at most one text button ("Undo", "View", "Retry")
5. **Dismiss button** — "×" with accessible name "Dismiss notification"; required when there is an action or duration is long
6. **Region / stack** — fixed corner region holding up to ~3 toasts; newest nearest the edge

## Required states
| State | Behavior / appearance |
|-------|------------------------|
| Default | Enters with slide/fade over `duration-base` `ease-standard`; reduced motion → opacity only |
| Hover | Pauses the dismiss timer; action/dismiss buttons show hover color |
| Focus-visible | Focus on action/dismiss pauses timer; visible `color-focus` ring (3:1 contrast) |
| Active / selected | n/a — toasts are not selectable; the action button has a pressed state |
| Disabled | n/a — remove a toast rather than disabling it; after "Undo" is used, replace with "Restored" |
| Loading | Optional for long background tasks: "Exporting…" persistent toast that updates in place to "Export ready" |
| Empty | n/a — no toasts means the region is empty and invisible (but stays in the DOM for live announcements) |
| Error | `color-danger` icon + text ("Couldn't send invoice") + "Retry"; does not auto-dismiss; error also shown inline where relevant |

## Behavior & responsive
- Duration: ~5s minimum for short info/success; add ~1s per extra 10 words; ≥ 8–10s if it contains a link
- **Never auto-dismiss a toast that contains an action** (Undo, Retry, View); keep until dismissed or acted upon (WCAG 2.2.1 Timing Adjustable)
- Errors persist until dismissed
- Pause the timer on hover, on keyboard focus within, and while the window is hidden; restart on leave
- Stack max ~3; queue the rest; collapse duplicates ("3 files deleted" instead of three toasts)
- Position: bottom-center or bottom-left/right on desktop, consistent product-wide; never cover primary actions or the bottom nav
- Undo: perform the action optimistically, keep the undo window open as long as the toast is visible; commit on dismiss/expire
- Don't fire toasts on page load or for passive events the user didn't trigger
- **Mobile (< 640px):** full width minus `space-4` gutters, bottom of viewport above bottom nav and safe area; support swipe to dismiss in addition to the "×"; targets ≥ 44px

## Accessibility
- **Role / semantics:** a persistent live region container in the DOM from page load: `role="status"` (`aria-live="polite"`) for success/info; `role="alert"` (assertive) only for errors; inject toast content into it
- **Keyboard:** Tab reaches the action/dismiss when the toast is visible; Esc dismisses the focused toast; optionally provide a shortcut (e.g. F6 / documented key) to jump to the toast region
- **Announcements:** message + action text announced once ("Project archived. Undo, button"); don't re-announce on stack reflow
- **Focus management:** never steal focus when a toast appears; if focus was inside a toast that closes, return it to the previous logical element (the trigger or the list)
- Timing: users must be able to pause, extend, or dismiss (WCAG 2.2.1); actions also available elsewhere (e.g. Trash for undo) so a missed toast is recoverable
- Contrast ≥ 4.5:1 for text, 3:1 for icons and the container edge against the page

## Do & Don't
- ✅ Do: write specific, past-tense messages ("2 members invited")
- ✅ Do: pair reversible destructive actions with "Undo" instead of a confirm dialog
- ✅ Do: keep the live region mounted before injecting messages so screen readers catch them
- ❌ Don't: auto-dismiss toasts with Undo/Retry/links before the user can act
- ❌ Don't: use a toast as the only place an error appears
- ❌ Don't: stack 6 toasts or put paragraphs or forms inside one

## Anti-patterns
- **Disappearing error** — 3s red toast vanishes; user never learns what failed or how to fix it
- **Toast storm** — one toast per item in a bulk action; group them
- **Focus-stealing toast** — moves keyboard focus away from the user's work
- **"Success!"** — generic message that doesn't say what happened

## Related patterns
- [Confirmation dialog](../data-feedback/confirm-dialog.md) — for irreversible actions; prefer undo toast for reversible ones
- [Inline validation](../forms/inline-validation.md) — where field errors belong
- [Modal vs. drawer](../data-feedback/modal-vs-drawer.md) — blocking content
- [Data table](../data-feedback/data-table.md) — bulk action results
- [Form layout](../forms/form-layout.md) — save confirmation

# Confirmation Dialog

> Users need a deliberate pause before an action that is destructive, irreversible, or costly, without being nagged for safe ones.

## When to use
- Irreversible destructive actions: permanently delete, purge, revoke access, cancel subscription
- Actions with significant side effects on others: remove a member, publish to all customers, send to 10k recipients
- Actions that cost money or can't be recalled (charge card, submit tax filing)
- Bulk destructive actions where scope may surprise ("Delete 248 files")

## When NOT to use
- Reversible actions (archive, move to trash, hide, remove from list) → do it immediately and offer Undo via [Toasts](../data-feedback/toasts.md)
- Routine, frequent actions (save, close a tab, mark read) → no confirmation; confirmation fatigue trains users to click through
- Unsaved-changes on navigation → use a lightweight "Discard changes?" prompt or autosave (see [Modal vs. drawer](../data-feedback/modal-vs-drawer.md))
- Collecting input beyond a confirm phrase → use a regular dialog from [Modal vs. drawer](../data-feedback/modal-vs-drawer.md)

## Anatomy
1. **Title** — required; a question naming action + object: "Delete 'Q3 report'?" / "Delete 3 files?"
2. **Consequence text** — required; what will happen and what can't be recovered: "This permanently deletes 3 files and their version history. This can't be undone."
3. **Scope detail** — optional; list affected items (max ~5, then "+ 243 more") or counts of dependent data
4. **Type-to-confirm field** — optional, high-severity only; "Type **acme-prod** to confirm"
5. **Cancel button** — secondary, left of primary on desktop; label "Cancel" or "Keep file"
6. **Destructive button** — names the action and scope: "Delete 3 files", "Remove member", "Cancel subscription"; `color-danger` background with `color-text-inverse`
7. **Surface** — small modal (sm width, ~40ch), `radius-lg`, `shadow-3`, backdrop

## Required states
| State | Behavior / appearance |
|-------|------------------------|
| Default | Opens over `duration-base`; destructive button styled `color-danger` with icon/text, never color alone |
| Hover | Buttons show hover tokens (`color-primary-hover` for neutral, darker danger for destructive) |
| Focus-visible | visible `color-focus` ring (3:1 contrast); initial focus lands on Cancel (least destructive), not the destructive button |
| Active / selected | n/a — no selection; buttons show pressed state |
| Disabled | Destructive button disabled until type-to-confirm matches exactly (case-sensitive); show hint why it's disabled |
| Loading | Destructive button shows spinner + "Deleting…"; both buttons disabled; Esc ignored until complete; dialog stays open |
| Empty | n/a — the dialog always has content; never open with no scope (e.g. 0 items selected → don't open) |
| Error | Inline `role="alert"` message in the dialog ("Couldn't delete 2 of 3 files. Retry") with retry; don't close silently |

## Behavior & responsive
- Prefer undo over confirm: if you can soft-delete and restore, skip the dialog and show "3 files deleted · Undo" (toast with no auto-dismiss)
- Destructive button label repeats the verb from the title; never "OK", "Yes", or "Confirm"
- Severity ladder: low (reversible) → undo toast; medium (irreversible, scoped) → confirm dialog; high (irreversible, wide blast radius: delete workspace, production DB) → confirm + type-to-confirm resource name
- Type-to-confirm: show the exact string to type, allow paste, compare trimmed; don't require typing "DELETE" for routine items
- Enter in the dialog must not trigger the destructive action unless focus is on it; no default destructive button
- Backdrop click and Esc = Cancel; never treat them as confirmation
- After success: close, return focus, show a toast ("3 files deleted"), update the view immediately
- **Mobile (< 640px):** centered dialog or bottom sheet; buttons stack full width with destructive at the bottom or separated from Cancel; targets ≥ 44px; keep the consequence text visible above the buttons

## Accessibility
- **Role / semantics:** `role="alertdialog"` + `aria-modal="true"`; `aria-labelledby` → title; `aria-describedby` → consequence text (so it's read on open)
- **Keyboard:** Esc cancels; Tab / Shift+Tab trapped within the dialog; Enter/Space activate the focused button only
- **Focus on open:** Cancel button (or the type-to-confirm input when present)
- **Focus on close:** return to the trigger; if the trigger was deleted, move to the next row/item or the list heading
- **Background:** page is inert while open
- **Announcements:** title + consequence announced on open via `alertdialog` semantics; loading and errors announced inside via `role="status"` / `role="alert"`
- Destructive meaning is conveyed by label text, not only `color-danger`

## Do & Don't
- ✅ Do: name the action and scope in both title and button: "Delete 3 files?" → "Delete 3 files"
- ✅ Do: state exactly what is lost and whether it's recoverable
- ✅ Do: reserve type-to-confirm for high-severity, wide-impact actions
- ❌ Don't: use "Are you sure?" with "OK / Cancel"
- ❌ Don't: confirm reversible actions; use undo instead
- ❌ Don't: put the initial focus or the Enter key on the destructive button

## Anti-patterns
- **Confirmation fatigue** — dialogs on every action teach users to click "Yes" blindly, defeating the guard
- **Ambiguous buttons** — "Cancel" vs. "OK" on "Cancel subscription?"; users can't tell which cancels what
- **Double negative copy** — "Don't keep unsaved changes?"; confusing under pressure
- **Silent partial failure** — dialog closes while some items failed to delete

## Related patterns
- [Toasts](../data-feedback/toasts.md) — undo for reversible actions, success after confirmation
- [Modal vs. drawer](../data-feedback/modal-vs-drawer.md) — base dialog behavior and focus rules
- [Data table](../data-feedback/data-table.md) — bulk destructive actions
- [Settings](../flows/settings.md) — account and workspace deletion
- [Checkout](../flows/checkout.md) — confirming costly actions

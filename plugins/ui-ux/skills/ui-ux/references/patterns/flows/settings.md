# Settings

> Users find and change a preference quickly, know when it is saved, and cannot destroy data by accident.

## When to use
- User profile, notifications, privacy, and appearance preferences
- Account, billing, security (password, passkeys, MFA), and connected apps
- Workspace or organization administration
- Per-object settings (project, integration) that users change occasionally

## When NOT to use
- Choices users make every session (sort, view mode) → keep them inline where they apply, e.g. [filters](../forms/filters.md)
- First-time setup → use [Onboarding](onboarding.md), then link to settings for later changes
- A one-off destructive action from a list → use a [confirmation dialog](../data-feedback/confirm-dialog.md) in context

## Anatomy
1. **Settings navigation** — sections grouped by the user's mental model (Profile, Notifications, Security, Billing, Team), not by internal system or team ownership.
2. **Section page** — `h1` with the section name and a one-line description; grouped cards or fieldsets with subheadings.
3. **Setting row** — label, short helper text explaining the effect, control (toggle, select, input), and current value.
4. **Save model indicator** — either autosave status ("Saved") per control, or a sticky "Save changes" / "Discard" bar. One model per page.
5. **Unsaved-changes guard** — prompt when leaving a page with unsaved explicit-save changes.
6. **Danger zone** — visually separated section at the bottom (delete account, transfer ownership, reset), bordered with `color-danger`.
7. **Search (optional)** — for large settings areas, find a setting by name or synonym and jump to it.

## Required states
| State | Behavior / appearance |
|-------|------------------------|
| Default | Controls show current saved values; helper text in `color-text-muted` at `text-sm` |
| Hover | Rows and nav items show hover background within `duration-fast` |
| Focus-visible | `color-focus` ring on every control, nav item, and save bar button |
| Active / selected | Current section highlighted in navigation with `aria-current="page"`; toggles show on/off with text, not color alone |
| Disabled | Settings unavailable on the plan or role explain why and how to unlock ("Admins only", "Upgrade to Pro") |
| Loading | Skeleton rows on first load; per-control spinner while an autosave is in flight; save button shows "Saving…" |
| Empty | Lists inside settings (API keys, sessions, integrations) show an empty state with an add action |
| Error | Failed save keeps the user's value, shows the error next to the control, and offers retry; never silently revert |

## Behavior & responsive
- Pick one save model per page and signal it:
  - **Autosave** for independent, low-risk toggles and selects: save on change, show "Saved" inline, offer undo for impactful changes.
  - **Explicit save** for related fields edited together or text inputs: sticky bar appears on first change, "Save changes" and "Discard".
- Never mix models on the same page; if one group needs explicit save, put it on its own page or card with its own save button.
- Unsaved-changes guard: warn on navigation, tab close, or section switch when explicit-save changes are pending.
- Destructive actions: separate them in a danger zone, name the consequence, and require typed confirmation for irreversible ones.
- Sensitive changes (email, password, MFA) may require re-authentication; return the user to the same setting afterward.
- Settings are deep-linkable; each section has its own URL so support can point users to it.
- Changes take effect visibly where possible (theme preview, notification sample).
- **Mobile (< 640px):** navigation becomes a list that drills into section pages with a back link; save bar sticks to the bottom; controls at Touch density.

## Accessibility
- **Role / semantics:** navigation is a `nav` landmark; groups use `fieldset`/`legend` or headed regions; toggles use a switch role or native checkbox with a visible label.
- **Keyboard:** Tab through controls in visual order; Space toggles switches; Enter activates save; Escape dismisses the unsaved-changes prompt (staying on the page).
- **Announcements:** autosave status ("Saved", "Couldn't save") in a polite live region; errors announced assertively.
- **Focus management:** after save, focus stays on the control or save button; after a danger-zone confirmation, focus moves to the resulting page heading.
- Helper text is associated with its control so it is read with the label.
- Do not rely on `color-danger` alone to mark the danger zone; include a heading and warning text.

## Do & Don't
- ✅ Do: write labels that describe the effect ("Email me when someone mentions me").
- ✅ Do: show the current value of every setting without extra clicks.
- ✅ Do: keep frequently used settings near the top of each section.
- ❌ Don't: hide important settings in an "Advanced" catch-all.
- ❌ Don't: put "Delete account" next to "Save changes".
- ❌ Don't: use a toggle for something that only applies after pressing save.

## Anti-patterns
- **Org-chart grouping** — sections named after internal teams or systems users don't know.
- **Mixed save models** — some fields autosave, others need a button, so users never know what stuck.
- **Silent revert** — a failed save quietly restores the old value.
- **Lost edits** — navigating away discards changes without warning.
- **Buried danger** — destructive actions styled like regular buttons among everyday settings.

## Related patterns
- [Sidebar navigation](../navigation/sidebar.md) — settings section navigation on desktop
- [Form layout](../forms/form-layout.md) — grouping and labeling settings fields
- [Confirmation dialog](../data-feedback/confirm-dialog.md) — guarding danger-zone actions
- [Toasts](../data-feedback/toasts.md) — confirming saves with undo
- [Authentication](auth.md) — re-authentication and MFA management

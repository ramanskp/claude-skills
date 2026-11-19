# File Upload

> Users need to attach files confidently, knowing in advance what's accepted, seeing progress, and fixing problems without re-selecting everything.

## When to use
- Attaching documents, images, or data files to a record, message, or form.
- Bulk import (CSV, images) where per-file progress and errors matter.
- Avatar or cover image selection with preview.

## When NOT to use
- The content is short text users could type or paste → use a text field in [Form layout](../forms/form-layout.md) instead
- Picking from files already in the system → use [Search with autocomplete](../forms/search-autocomplete.md) or a file browser instead
- Multi-step import with mapping and validation of contents → use [Multi-step wizard](../forms/wizard.md) with upload as step 1

## Anatomy
1. **Label** — visible ("Supporting documents"), with "(optional)" if applicable. Required.
2. **Constraints hint** — accepted types, max size, max count: "PDF, JPG or PNG, up to 10 MB each, max 5 files". Required.
3. **Choose button** — native file input styled as a secondary button, "Choose files". Required.
4. **Drop zone** — dashed `color-border-strong` area, `radius-md`, `space-6` padding, "or drag files here". Optional enhancement; never the only path.
5. **File list** — one row per file: type icon or thumbnail, name (middle-truncated, full name on focus/title), size, status, actions.
6. **Progress** — per-file progress bar + percentage; overall "3 of 5 uploaded" for multiple files.
7. **Row actions** — "Cancel" while uploading, "Remove" when done, "Retry" on failure; each labelled with the file name.
8. **Error message** — per file, in the row; field-level error for count or missing required file.

## Required states
| State | Behavior / appearance |
|-------|------------------------|
| Default | Label, hint, "Choose files" button, optional drop zone; empty file list |
| Hover | Button `color-surface` tint; drop zone border darkens; dragging files over the window highlights the zone (`color-primary` border, "Drop to upload") |
| Focus-visible | `color-focus` ring on button, drop zone (if focusable), and row actions |
| Active / selected | Uploaded file rows show success icon + "Uploaded" in `color-success` text, size, and Remove action |
| Disabled | Count limit reached: hide or replace the button with text "Maximum 5 files reached. Remove one to add another." rather than a silent disabled control |
| Loading | Row shows progress bar + "Uploading… 45%"; indeterminate spinner + "Processing…" for server-side scanning; Cancel available |
| Empty | Required field without file on submit → inline error "Upload your proof of address"; optional field shows nothing extra |
| Error | Row in error: `color-danger` icon + specific reason + Retry/Remove; other files unaffected |

## Behavior & responsive
- **State limits up front:** types, max size per file and in total, max count; validate client-side immediately on selection (type, size, count), then server-side.
- **Specific error copy:**
  - "report.docx is not a PDF. Upload a PDF file."
  - "photo.jpg is 14 MB. Choose a file smaller than 10 MB."
  - "You can upload up to 5 files. Remove a file to add another."
  - "upload failed — connection lost. Retry."
- **Upload immediately on select** (async) so form submit isn't blocked by a long upload; block submit only while uploads are in progress and say so ("Wait for 2 uploads to finish").
- **Partial failure:** keep successful files; only failed rows need action. Never clear the list on one failure.
- **Large files (> 50 MB):** chunked/resumable uploads, show remaining time when > 10s; warn before leaving the page while uploading.
- **Duplicates:** detect same name + size; ask "Replace" or "Keep both".
- **Previews:** thumbnails for images (generated client-side), page count for PDFs; strip location metadata from photos if privacy-sensitive and tell users.
- **Security:** server scans and validates type by content, not extension; show "Scanning…" status if it delays availability.
- **Removal** is immediate with an undo [Toast](../data-feedback/toasts.md) rather than a confirmation dialog.
- **Mobile (< 640px):** no drag-and-drop; the button opens the OS picker (camera, photos, files) — use `accept` with types and `capture` only when camera is the expected source; rows stack with actions ≥ 44px; file names middle-truncated.

## Accessibility
- **Role / semantics:** a native `input type="file"` with a visible `label`; constraints hint and errors linked via `aria-describedby`; `aria-invalid="true"` on field-level error. The drop zone is supplementary — the native input must remain keyboard-operable (visually styled, not `display:none` without a focusable proxy).
- **Keyboard:** Tab to "Choose files", Enter/Space opens the picker; Tab through rows' Cancel/Remove/Retry buttons. Drag-and-drop has a button alternative (2.5.7 Dragging movements).
- **Announcements:** polite live region for status changes: "report.pdf uploaded", "photo.jpg failed: larger than 10 MB", "3 of 5 files uploaded". Throttle progress announcements (e.g. at 25% steps or not at all) — the progress bar uses `role="progressbar"` with `aria-valuenow` and a name including the file.
- **Focus management:** after selection keep focus on the button (or move to the first new row); after Remove, move focus to the next row's action or back to the button; on submit with errors, focus the error summary.
- **Action names** include the file: "Remove report.pdf", "Retry photo.jpg".
- **WCAG 2.2:** 2.5.8 targets ≥ 24px (44px touch); 1.4.1 status not by color alone; 3.3.7 don't require re-uploading files after a form error elsewhere; 3.3.1 errors identified in text.

## Do & Don't
- ✅ Do: state type, size, and count limits before the user picks a file.
- ✅ Do: show each file's own status and let users fix one without touching others.
- ✅ Do: keep uploaded files when the rest of the form fails validation.
- ❌ Don't: make drag-and-drop the only way to upload.
- ❌ Don't: show a generic "Upload failed" with no reason or retry.
- ❌ Don't: accept a file client-side and reject it only after a long upload for a type/size you could check instantly.

## Anti-patterns
- **Hidden native input** — styled zone that's not keyboard- or screen-reader-operable.
- **Silent rejection** — wrong-type files vanish from the selection without explanation.
- **All-or-nothing batches** — one bad file fails the whole set.
- **Lost-on-error** — attachments discarded when another field fails validation.
- **Progressless uploads** — a spinner for a 200 MB file; users refresh and lose it.

## Related patterns
- [Form layout](../forms/form-layout.md) — placement within a form
- [Inline validation](../forms/inline-validation.md) — field-level error timing and copy
- [Multi-step wizard](../forms/wizard.md) — bulk import flows
- [Toasts](../data-feedback/toasts.md) — undo after removing a file
- [Skeleton loading](../data-feedback/skeleton-loading.md) — preview placeholders
- [Empty states](../data-feedback/empty-states.md) — no attachments yet

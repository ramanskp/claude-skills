# Form Layout

> Users need to enter structured data in one view quickly, without guessing what each field wants or losing what they typed.

## When to use
- Collecting up to ~12–15 related fields that make sense to complete in one sitting (profile, contact, create-item).
- Editing an existing record where all fields are visible and saved together.
- Short settings groups with an explicit "Save changes" action.

## When NOT to use
- More than ~15 fields, or later fields depend on earlier answers → use [Multi-step wizard](../forms/wizard.md) instead
- Instant-apply preferences (toggles that save immediately) → use [Settings](../flows/settings.md) instead
- 1–5 fields for a quick decision over the current page → use [Modal vs. drawer](../data-feedback/modal-vs-drawer.md) instead
- Editing many records at once → use [Data table](../data-feedback/data-table.md) inline editing instead

## Anatomy
1. **Form title** — `text-2xl`; states the outcome ("Create project"). Required.
2. **Required/optional legend** — one line at top ("All fields required unless marked optional"). Required if mixed.
3. **Field group (fieldset + legend)** — related fields grouped, `space-8` between groups. Optional for < 6 fields.
4. **Label** — visible, above the input, `text-sm` weight 500, `space-1`–`space-2` to input. Required.
5. **Hint text** — format or constraint below label, `text-sm` `color-text-muted`. Optional.
6. **Input** — control height per density (Comfortable by default), `space-3` padding, `radius-sm`, `color-border-strong` (≥ 3:1).
7. **Inline error** — below input, icon + text in `color-danger`. See [Inline validation](../forms/inline-validation.md).
8. **Error summary** — top of form, appears on failed submit. Required for forms with > 3 fields.
9. **Actions** — primary ("Save changes") + secondary ("Cancel"); left-aligned with fields, `space-8` above.

## Required states
| State | Behavior / appearance |
|-------|------------------------|
| Default | Labels visible, inputs `color-border-strong`, `space-6` between fields, primary button enabled |
| Hover | Input border shifts to `color-text-muted` over `duration-fast`; button uses `color-primary-hover` |
| Focus-visible | Thick `color-focus` ring with offset on the focused control; never remove outline without replacement |
| Active / selected | Checked radio/checkbox shows fill + mark; selected option text in select is visible without opening |
| Disabled | Avoid disabling fields; prefer read-only with visible value. Disabled submit is not allowed — validate on submit instead |
| Loading | Submit button shows spinner + "Saving…", keeps its width, ignores repeat clicks; fields stay editable-read-only |
| Empty | Empty inputs show nothing or a neutral example in hint text; edit forms prefill saved values |
| Error | Field: `color-danger` border + icon + message. Form: error summary with linked list, focus moved to it |

## Behavior & responsive
- **Single column.** One field per row; multi-column only for tightly related short pairs (City + Postcode, First + Last name).
- **Field width signals expected length:** postcode ~ 8 characters, phone ~ 15, full-width for names/addresses.
- **Order** follows the user's mental model, not the database schema; put the most important or easiest fields first.
- **Ask less:** every field must justify itself; mark optional fields "(optional)" rather than starring required ones (or star + legend, consistently).
- **Correct input types:** email, tel, url, number only for quantities (not card numbers or postcodes); set `inputmode` and `autocomplete` tokens (`name`, `email`, `street-address`, `postal-code`, `one-time-code`).
- **Prefer radios over selects** for ≤ 5 options; select for 6–15; [Search with autocomplete](../forms/search-autocomplete.md) for > 15.
- **Validate on blur and submit**, never on every keystroke — details in [Inline validation](../forms/inline-validation.md).
- **Never lose input:** preserve values after a failed submit or server error; warn on navigation with unsaved changes; autosave drafts for long forms.
- **Submit** with Enter in single-line inputs; prevent double submission with an idempotent request + in-flight state.
- **On success:** navigate to the created object or show a [Toast](../data-feedback/toasts.md) ("Project created"); do not reset an edit form silently.
- **Desktop (≥ 1024px):** cap form width at a 60–75 character measure; labels stay above inputs (left-aligned labels only for dense admin forms).
- **Mobile (< 640px):** full-width inputs with `space-4` page gutter, touch height 44–48px, sticky action bar only if it doesn't cover the focused field; input font ≥ `text-base` to prevent zoom on focus.

## Accessibility
- **Role / semantics:** native `form`, `label for`/`id` on every control, `fieldset` + `legend` for radio/checkbox groups and related groups (e.g. "Billing address"). Placeholders are never labels.
- **Required:** native `required` (or `aria-required="true"`) plus visible text; don't rely on an asterisk or color alone.
- **Hints & errors:** linked via `aria-describedby` (hint id + error id); invalid fields get `aria-invalid="true"`.
- **Keyboard:** Tab/Shift+Tab in visual order (no positive `tabindex`); Space toggles checkboxes; arrows move within a radio group; Enter submits.
- **Announcements:** error summary has a heading ("There are 2 problems") and links to each field; success announced via the page change or a polite live region.
- **Focus management:** on failed submit move focus to the error summary (`tabindex="-1"`); each summary link focuses its field. On success focus the new page heading.
- **WCAG 2.2:** 3.3.7 Redundant entry — prefill or offer "Same as shipping" instead of re-asking; 2.5.8 targets ≥ 24×24px (aim 44px); 1.3.5 identify input purpose via `autocomplete`; 3.3.8 allow paste and password managers.

## Do & Don't
- ✅ Do: label every field visibly and keep the label when the field has a value.
- ✅ Do: group with headings and `space-8`, not boxes inside boxes.
- ✅ Do: name the primary button after the outcome ("Create account").
- ❌ Don't: use placeholder text as the label or for critical format hints — it vanishes on input and has low contrast.
- ❌ Don't: disable the submit button until valid — users can't learn what's missing.
- ❌ Don't: add a "Reset" / "Clear form" button next to submit.

## Anti-patterns
- **Floating label only** — shrinks text to unreadable size and loses context on autofill; use a static label above.
- **Multi-column field grid** — eyes zig-zag, fields get skipped; completion rates drop.
- **Split inputs** (3 boxes for a phone number, date, or card) — break paste and autofill; use one input with a format hint.
- **Required asterisk without legend** — screen-reader and novice users don't know what it means.
- **Wiping the form on error** — forces re-entry, violates 3.3.7, causes abandonment.

## Related patterns
- [Inline validation](../forms/inline-validation.md) — when and how to show field errors
- [Multi-step wizard](../forms/wizard.md) — when one view is too long
- [Date picker](../forms/date-picker.md) — date fields within a form
- [File upload](../forms/file-upload.md) — attachment fields
- [Settings](../flows/settings.md) — instant-apply vs. explicit save
- [Checkout](../flows/checkout.md) — address and payment forms

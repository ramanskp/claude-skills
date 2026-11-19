# Inline Validation

> Users need to learn about input errors at the moment they can act on them, without being nagged while they are still typing.

## When to use
- Any form field with format, range, or required constraints (email, password rules, quantities).
- Server-checked values where early feedback saves a round trip (username availability, coupon code).
- Fields with complex requirements where a live checklist helps (new password strength rules).

## When NOT to use
- Free-text fields with no constraints (comments, notes) → no validation UI needed
- System or page-wide failures (network down, session expired) → use a banner; see [Toasts](../data-feedback/toasts.md) for the toast vs. inline vs. banner guide
- Confirming a successful save → use [Toasts](../data-feedback/toasts.md) instead
- Sign-in credential errors → use [Authentication](../flows/auth.md) instead (never reveal which field was wrong)

## Anatomy
1. **Field label** — visible, unchanged by error state. Required.
2. **Hint text** — states the rule before the error happens ("8+ characters, including a number"). Recommended.
3. **Error message** — directly below the input (above hint is acceptable if consistent), `text-sm`, `color-danger`, prefixed with an error icon. Required on error.
4. **Invalid input border** — `color-danger` border plus a second cue (icon), never color alone.
5. **Success indicator** — optional check icon in `color-success` for fields whose validity isn't obvious (username available).
6. **Error summary** — box at form top: heading "There are N problems with this form" + list of links to fields. Required on submit when > 1 error or > 3 fields.
7. **Requirement checklist** — optional live list for passwords; each rule flips from neutral to met.

## Required states
| State | Behavior / appearance |
|-------|------------------------|
| Default | No error shown before the user interacts; hint visible |
| Hover | n/a — validation has no hover behavior; inputs follow [Form layout](../forms/form-layout.md) hover |
| Focus-visible | `color-focus` ring shown on top of the `color-danger` border; both remain distinguishable |
| Active / selected | Field being corrected keeps its existing error until it becomes valid, then clears immediately |
| Disabled | n/a — disabled fields are not validated; don't show errors on fields the user can't change |
| Loading | Async check: small spinner + "Checking availability…" (polite), after 500ms debounce; no error until result |
| Empty | Required-but-empty error only on blur after the user typed and cleared, or on submit — not on first focus-out of an untouched field |
| Error | `color-danger` border + icon + specific message; `aria-invalid="true"`; listed in summary after submit |

## Behavior & responsive
- **Timing ("reward early, punish late"):**
  - Show an error on **blur** (leaving the field) or on **submit** — never on each keystroke while typing.
  - Once a field is in error, re-validate on input (debounced ~300ms) and **clear the error as soon as it's fixed**.
  - Don't flag a field the user tabbed through without typing; catch it on submit.
  - Async/server checks: debounce 400–600ms after typing stops, cancel stale requests, show result inline.
- **Submit always validates everything**, both client and server side; server errors map back onto the right fields.
- **Message copy:** say what's wrong and how to fix it, in plain words. "Enter an email address like name@example.com" — not "Invalid input". Max ~1 line; no codes; don't blame ("You entered…").
- **Be lenient in parsing:** trim spaces, accept phone numbers with spaces/dashes, card numbers with spaces; normalize instead of rejecting.
- **Cross-field rules** (end date after start date): attach the error to the field the user should change, reference the other by name.
- **Layout stability:** reserve no permanent space, but avoid jumps that move the button under the cursor — show errors below fields, not by shifting labels.
- **Never clear the user's value** because it is invalid.
- **Mobile (< 640px):** error text wraps under the field at full width; on submit scroll the error summary into view with the on-screen keyboard dismissed.

## Accessibility
- **Role / semantics:** error element linked with `aria-describedby` (keep hint id too: `aria-describedby="hint-id error-id"`); set `aria-invalid="true"` only while invalid. Native `required` for required fields.
- **Keyboard:** no traps — users can leave an invalid field; summary links are Tab-reachable and activating one focuses the field.
- **Announcements:** on blur errors, the describedby text is read on refocus; avoid assertive live regions per field (too noisy). Async status ("Username available") uses a single `aria-live="polite"` region. Summary is announced by moving focus to it.
- **Focus management:** on failed submit focus the error summary (`tabindex="-1"`, `role="alert"` optional); with only one field, focus that field directly. Never auto-move focus on blur errors.
- **WCAG:** 3.3.1 Error identification (text, not just color); 3.3.3 Error suggestion; 1.4.1 Use of color; 1.4.11 icon/border ≥ 3:1; 3.3.7 keep entered values after errors.
- Prefix the page `<title>` with "Error: " after a failed submit on a full-page form.

## Do & Don't
- ✅ Do: show the rule as a hint before the user fails it.
- ✅ Do: clear an error the instant the value becomes valid.
- ✅ Do: keep client messages identical to server messages for the same rule.
- ❌ Don't: show "This field is required" on every field the moment the page loads or on first focus.
- ❌ Don't: validate on each keystroke from the first character ("Invalid email" after typing "j").
- ❌ Don't: rely on red alone, or on a tooltip that appears only on hover.

## Anti-patterns
- **Premature punishment** — errors fire while typing; users feel scolded and lose focus.
- **Disabled submit as validation** — gives no reason why; keyboard and screen-reader users are stuck.
- **Toast-only errors** — disappear before they are read and aren't tied to a field.
- **Generic messages** ("Invalid value") — no path to recovery.
- **Errors only at the top** — users must memorize the list and hunt for fields; always pair summary with inline messages.

## Related patterns
- [Form layout](../forms/form-layout.md) — field structure and error summary placement
- [Multi-step wizard](../forms/wizard.md) — validating per step before advancing
- [Search with autocomplete](../forms/search-autocomplete.md) — debounce timing for live queries
- [Authentication](../flows/auth.md) — credential error handling
- [Toasts](../data-feedback/toasts.md) — why errors don't belong in toasts

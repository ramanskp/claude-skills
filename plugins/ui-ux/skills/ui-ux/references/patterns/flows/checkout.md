# Checkout

> Buyers move from cart to confirmed order with no surprises, no lost input, and no accidental double charges.

## When to use
- Purchasing physical or digital goods from a cart
- Subscription sign-up with payment
- Booking or reservation flows that end in payment
- Upgrading a plan inside a product

## When NOT to use
- Free sign-up with no payment → use [Authentication](auth.md) and [Onboarding](onboarding.md)
- Collecting non-payment information over several steps → use a [multi-step wizard](../forms/wizard.md)
- One-click repurchase for a signed-in user with saved details → a single [confirmation dialog](../data-feedback/confirm-dialog.md) can be enough

## Anatomy
1. **Cart** — line items with quantity, price, remove/undo; subtotal; estimated shipping and tax; primary "Check out".
2. **Account choice** — "Continue as guest" as a first-class option beside "Sign in"; offer account creation after purchase.
3. **Contact & shipping** — email, address with autocomplete and manual entry fallback, delivery options with price and date.
4. **Payment** — card fields with inline validation, saved methods, wallets; billing address defaults to "Same as shipping".
5. **Review** — everything editable in place or with a link back to its step; final total with all costs itemized.
6. **Place order** — one primary button naming the amount ("Pay $48.20"); legal text and terms beside it.
7. **Confirmation** — order number, items, total, delivery estimate, where the receipt was sent, and next steps.
- **Progress indicator** spans steps 3–5 ("Shipping › Payment › Review"); **order summary** stays visible on every step.

## Required states
| State | Behavior / appearance |
|-------|------------------------|
| Default | One step in focus, summary pinned beside it; primary action uses `color-primary` |
| Hover | Editable summary lines and step links show hover tokens within `duration-fast` |
| Focus-visible | `color-focus` ring on all fields, step links, quantity controls, and pay button |
| Active / selected | Current step marked in progress indicator with text, not color alone; chosen shipping/payment option is checked |
| Disabled | Pay button disables only while a submission is in flight; otherwise validate and explain on click |
| Loading | "Processing payment…" with spinner; button locked; warn against leaving the page; no second request sent |
| Empty | Empty cart shows a short message, a route back to shopping, and saved or recent items if available |
| Error | Card or address errors inline next to the field; declined payment explains next step and keeps all other input |

## Behavior & responsive
- No surprise costs: show shipping, tax, and fees as early as possible; never add a new charge on the review step.
- Guest checkout by default; never force account creation to pay.
- Address autocomplete with a "Enter address manually" option; validate postal codes per country.
- Card validation inline: detect card brand, format as the user types, validate number, expiry, and CVC on blur.
- Idempotent submit: lock the button on first click, send an idempotency key, and show one result even if the user retries or reloads.
- Persist checkout input across reloads, back navigation, and failed payments; never clear the form.
- Third-party redirects (3-D Secure, wallets) return the user to the same step with state intact.
- Confirmation is a page with a stable URL, plus an emailed receipt; it never relies on a toast alone.
- **Mobile (< 640px):** single column; order summary collapses into an expandable bar showing the total; sticky pay button at Touch density; correct keyboards for card, postal code, and phone fields.

## Accessibility
- **Role / semantics:** each step is a `form` with an `h1`/`h2`; progress indicator is an ordered list with the current step marked `aria-current="step"`.
- **Keyboard:** Tab order follows visual order; radio groups for shipping and payment use arrow keys; Enter submits the current step.
- **Announcements:** total changes (shipping, coupon) announced via polite live region; payment result announced on arrival.
- **Focus management:** on step change, focus moves to the new step heading; on error, focus the error summary or first invalid field.
- Support autofill with correct `autocomplete` values (`shipping street-address`, `cc-number`, `cc-exp`, `cc-csc`) and allow paste.
- Give users enough time; warn before a reserved cart or session expires (WCAG 2.2.1).
- Don't ask for data already entered (WCAG 3.3.7 redundant entry); prefill billing from shipping.

## Do & Don't
- ✅ Do: show the full total on the pay button and in the summary.
- ✅ Do: let users edit quantity and remove items with undo, without leaving the flow.
- ✅ Do: show trust signals (secure payment, return policy) near the payment fields.
- ❌ Don't: show site navigation, promotions, or upsell modals that pull users out mid-checkout.
- ❌ Don't: pre-tick add-ons, insurance, or newsletter boxes.
- ❌ Don't: make an empty coupon field so prominent that users leave to hunt for codes; use a "Have a code?" link.

## Anti-patterns
- **Drip pricing** — fees revealed at the last step; a leading cause of cart abandonment.
- **Forced registration** — requiring an account before payment.
- **Double charge** — re-enabled button or unguarded retry submits the order twice.
- **Form amnesia** — a declined card clears the entire form.
- **Toast-only confirmation** — no persistent record of the order number.

## Related patterns
- [Multi-step wizard](../forms/wizard.md) — step mechanics and progress indicator
- [Inline validation](../forms/inline-validation.md) — card and address field validation timing
- [Form layout](../forms/form-layout.md) — field grouping and widths
- [Authentication](auth.md) — optional sign-in step
- [Empty states](../data-feedback/empty-states.md) — empty cart

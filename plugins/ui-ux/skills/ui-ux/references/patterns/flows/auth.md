# Authentication

> Users sign up, sign in, recover access, and verify identity quickly and securely, without memory tests or puzzles.

## When to use
- Sign-up and sign-in for any account-based product
- Password reset and account recovery
- Multi-factor authentication (MFA) and step-up verification before sensitive actions
- Passwordless sign-in with passkeys or magic links

## When NOT to use
- Content that can be used without an account → let users act first, ask to sign up when saving (see [Onboarding](onboarding.md))
- Guest purchases → offer guest checkout (see [Checkout](checkout.md))
- Re-confirming a destructive action for an already signed-in user → use a [confirmation dialog](../data-feedback/confirm-dialog.md), not a full re-login

## Anatomy
1. **Identifier step** — one email or username field (`autocomplete="username"` or `"email"`), plus "Continue with passkey" and any SSO options.
2. **Credential step** — password (`autocomplete="current-password"`), show-password toggle, "Forgot password?" link; or "Email me a sign-in link".
3. **Sign-up variant** — email, new password (`autocomplete="new-password"`) with visible requirements shown up front, optional name; offer to create a passkey after.
4. **MFA step** — single code field with `autocomplete="one-time-code"` and numeric input mode, "Resend code" with countdown, "Use another method" link, "Trust this device" option.
5. **Recovery** — request reset by email; reset page sets a new password; confirm and sign the user in.
6. **Magic link sent** — "Check your inbox at name@example.com", resend action, and "Use a different email".
7. **Signed in** — redirect to the page the user originally requested, not a generic home.

## Required states
| State | Behavior / appearance |
|-------|------------------------|
| Default | Single-column form, one primary action ("Sign in"), labels always visible above fields |
| Hover | Buttons and links show hover tokens within `duration-fast` |
| Focus-visible | `color-focus` ring on fields, toggle, links, and SSO buttons; first field focused on load |
| Active / selected | Show-password toggle reflects state with label change ("Show" / "Hide") and pressed state |
| Disabled | Primary action stays enabled; validate on submit and explain what is missing instead of disabling |
| Loading | Primary button shows spinner and "Signing in…"; repeat submits are ignored |
| Empty | n/a — fields start blank by design; browser and password-manager autofill must still work |
| Error | Wrong credentials: one generic message ("Email or password is incorrect"); rate limit: say when to retry; field errors inline with `color-danger` plus icon |

## Behavior & responsive
- Allow paste in every field, including password and code fields; never block password managers.
- Use correct `autocomplete`, `type="email"`, and `name` attributes so managers and passkey autofill work.
- Do not reveal whether an account exists on sign-in or reset ("If an account exists, we sent a link").
- Rate limiting: show a clear message with retry time ("Too many attempts. Try again in 5 minutes.") and offer recovery.
- No cognitive tests (puzzles, image grids, transcription) without an alternative (WCAG 3.3.8 accessible authentication); prefer invisible bot checks, passkeys, or email links.
- Passkeys first where supported; keep password as a fallback, never the only option for recovery.
- Magic links and codes expire; expired-link pages explain this and offer to send a new one.
- Keep sessions long on trusted devices; ask for step-up auth only for sensitive actions.
- Password rules: favor length over composition rules; show requirements before typing, not only after failure.
- **Mobile (< 640px):** full-width fields and buttons at Touch density; numeric keypad for codes; SMS/email code autofill supported via `one-time-code`.

## Accessibility
- **Role / semantics:** native `form`, `label`, `input`, and `button`; one `h1` naming the task ("Sign in to Acme").
- **Keyboard:** Enter submits; Tab order follows visual order; the show-password toggle is a real button reachable by keyboard.
- **Announcements:** form-level errors go in a summary announced on submit; MFA resend confirmations use a polite live region.
- **Focus management:** on error, focus the error summary or first invalid field; on step change, focus the new step heading or field.
- Do not split codes into multiple single-character inputs unless they behave as one field for paste and screen readers.
- Session timeouts warn in advance and let users extend (WCAG 2.2.1).

## Do & Don't
- ✅ Do: link sign-in and sign-up to each other and keep entered email when switching.
- ✅ Do: say where a code or link was sent, partially masked.
- ❌ Don't: ask users to confirm their email or password by typing it twice; use the show toggle instead.
- ❌ Don't: clear the password field silently or reset the form after an error, except the password itself.
- ❌ Don't: use security questions as a recovery method.

## Anti-patterns
- **Paste blocking** — breaks password managers and pushes users to weak passwords.
- **Account enumeration** — "No account with that email" tells attackers which emails are registered.
- **CAPTCHA wall** — puzzles with no alternative exclude users with cognitive or visual disabilities.
- **Mystery lockout** — blocking without saying why or for how long.
- **Home redirect** — losing the user's intended destination after sign-in.

## Related patterns
- [Form layout](../forms/form-layout.md) — field structure and labels
- [Inline validation](../forms/inline-validation.md) — when and how to show field errors
- [Onboarding](onboarding.md) — what happens right after sign-up
- [Settings](settings.md) — managing passwords, passkeys, and MFA later

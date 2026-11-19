# Onboarding

> New users reach their first meaningful outcome quickly, learning the product by using it rather than reading about it.

## When to use
- First run of a product where value depends on setup (connect data, invite team, create first item)
- A new major feature that changes how users work and needs a short introduction
- Accounts that start empty and would otherwise show a blank, confusing screen
- Re-engaging users who signed up but never activated

## When NOT to use
- Self-explanatory products where the first screen already delivers value → just ship a good [empty state](../data-feedback/empty-states.md)
- Collecting a long, required profile before use → use a [multi-step wizard](../forms/wizard.md) and only ask what is truly needed
- Announcing minor UI changes → use an inline hint or a [toast](../data-feedback/toasts.md)
- Account creation itself → see [Authentication](auth.md)

## Anatomy
1. **Welcome (optional)** — one screen, one sentence of value, one primary action ("Create your first project"). Skip link always visible.
2. **Minimal setup** — at most 1–3 questions that change what the user sees next (role, goal). Each has a sensible default; every step is skippable.
3. **First action in the real UI** — drop users into the actual product, guided by an empty state with one primary action, not a tour of screenshots.
4. **Setup checklist** — persistent, dismissible panel: 3–5 tasks, each with a verb label, completion check, and progress ("2 of 4 done").
5. **Contextual hints** — single, just-in-time tips anchored to the element they explain; shown once, dismissible.
6. **Success moment** — confirm the first outcome ("Your dashboard is live") and suggest the next most valuable step.
7. **Re-entry point** — "Getting started" link in help or account menu to reopen the checklist later.

## Required states
| State | Behavior / appearance |
|-------|------------------------|
| Default | Checklist shows tasks in recommended order; next task visually emphasized with `color-primary` action |
| Hover | Checklist items and hint actions show hover background `color-surface-raised` within `duration-fast` |
| Focus-visible | `color-focus` ring on every task, skip link, and hint close button |
| Active / selected | Current step marked in the step indicator; completed tasks show a check icon plus "Done" text |
| Disabled | Tasks blocked by a prerequisite show why ("Connect a data source first") instead of silently greying out |
| Loading | Setup actions that call a backend (import, connect) show progress and let the user keep exploring meanwhile |
| Empty | Each primary screen has a first-use empty state with one action and an optional sample-data option |
| Error | Failed setup step explains the cause and offers retry or skip; progress so far is never lost |

## Behavior & responsive
- Optimize time-to-value: measure and minimize steps from sign-up to first meaningful outcome.
- Progressive disclosure: teach advanced features when the user first needs them, not on day one.
- Every step is skippable and resumable; skipping never blocks access to the product.
- Persist progress server-side so it survives reloads and device switches.
- Offer sample data or a template so users can explore before committing their own data.
- Show one hint at a time; never stack coachmarks or open a tour automatically on every visit.
- Hide the checklist once complete, with a short success message; allow manual dismissal earlier.
- **Mobile (< 640px):** checklist collapses into a compact progress chip that expands to a sheet; hints become inline banners instead of anchored popovers; actions use Touch density.

## Accessibility
- **Role / semantics:** checklist is a list with headed region ("Getting started"); progress uses text ("2 of 4 complete") alongside any visual bar.
- **Keyboard:** Tab reaches every task, skip, and dismiss control; Escape closes a hint and returns focus to its anchor.
- **Announcements:** task completion is announced via a polite live region; hints are not announced unexpectedly while the user is typing.
- **Focus management:** after skipping or finishing a step, focus moves to the heading of the next screen; closing the checklist returns focus to its toggle.
- Hints never trap focus and never obscure the element they describe (WCAG 2.4.11 focus not obscured).
- Respect `prefers-reduced-motion` for celebration animations and spotlights.

## Do & Don't
- ✅ Do: let users do the real task in the real UI with guidance alongside.
- ✅ Do: personalize the next step from setup answers, and explain why you ask each question.
- ✅ Do: keep copy action-led ("Invite a teammate"), in sentence case.
- ❌ Don't: require email verification or payment before the user sees any value, unless legally required.
- ❌ Don't: show a multi-slide carousel of feature screenshots before the product.
- ❌ Don't: reset or re-show onboarding after the user dismissed it.

## Anti-patterns
- **Forced product tour** — a long, unskippable coachmark sequence; users click through without reading and retain nothing.
- **Interrogation sign-up** — ten profile questions before use; drop-off rises with every field.
- **Blank slate** — empty screens with no explanation or action; users assume the product is broken.
- **Confetti without value** — celebrating account creation instead of a real outcome.
- **Checklist that never ends** — tasks that serve the business (rate us, share) rather than the user's activation.

## Related patterns
- [Empty states](../data-feedback/empty-states.md) — the primary teaching surface for first use
- [Multi-step wizard](../forms/wizard.md) — when setup truly needs several ordered steps
- [Authentication](auth.md) — the step immediately before onboarding
- [Toasts](../data-feedback/toasts.md) — confirming completed setup tasks
- [Settings](settings.md) — where onboarding choices can be changed later

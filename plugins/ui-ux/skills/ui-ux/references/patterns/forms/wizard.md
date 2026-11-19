# Multi-step Wizard

> Users facing a long or branching task need it broken into manageable steps so they always know where they are, what's left, and that their work is safe.

## When to use
- More than ~15 fields, or input that splits naturally into 3–7 distinct topics (account → company → plan → review).
- Later questions depend on earlier answers (branching), so showing everything at once would confuse.
- Infrequent, high-stakes tasks where guidance matters more than speed (applications, setup, claims).

## When NOT to use
- Fewer than ~10 fields that fit one screen → use [Form layout](../forms/form-layout.md) instead
- Experts editing an existing record often → use [Form layout](../forms/form-layout.md) with sections, or [Tabs](../navigation/tabs.md) instead
- Purchase flows → use [Checkout](../flows/checkout.md) (a specialized wizard) instead
- Product tours and first-run guidance → use [Onboarding](../flows/onboarding.md) instead

## Anatomy
1. **Wizard title** — the overall goal ("Set up your workspace"). Required.
2. **Step indicator** — "Step 2 of 4" text plus a stepper with step names; completed steps show a check. Required.
3. **Step heading** — `text-xl`, names this step ("Company details"). Required.
4. **Step content** — one topic, ideally 3–7 fields, max ~10.
5. **Navigation actions** — "Back" (secondary, left) and "Continue"/named next action (primary, right); final step uses the outcome verb ("Create workspace"). Required.
6. **Save & exit** — tertiary link for long wizards; returns to a resumable draft. Recommended for > 3 steps.
7. **Review step** — summary of all answers with "Change" links per section. Required before irreversible submit.
8. **Confirmation** — success page with what happens next and a link to the created object.

## Required states
| State | Behavior / appearance |
|-------|------------------------|
| Default | Current step highlighted in indicator, previous steps marked done, future steps muted (`color-text-muted`) |
| Hover | Completed step names in the indicator are links and underline on hover; future steps show no hover |
| Focus-visible | `color-focus` ring on step links, fields and buttons |
| Active / selected | Current step: `color-primary` marker + bold label + `aria-current="step"` |
| Disabled | Future steps are not clickable (plain text, not disabled buttons); "Continue" is never disabled — validate on click |
| Loading | "Continue" shows spinner + "Saving…" while the step persists; keep the button width; block double-submit |
| Empty | Step fields prefilled from earlier steps or the account where known (3.3.7); otherwise blank with hints |
| Error | Errors shown inline on the current step with an error summary; step indicator marks that step with an error icon + text |

## Behavior & responsive
- **3–7 steps.** Fewer than 3: use one page. More than 7: merge steps or rethink scope.
- **One topic per step; ~3–7 fields per step.** Put easy, low-commitment questions first to build momentum.
- **Validate on Continue**, only for the current step; don't block "Back" on invalid input.
- **Persist every step** on Continue (server draft or local) so refresh, timeout, or Back never loses data. Resume where the user left off.
- **Back** returns to the previous step with values intact. Browser Back must behave the same (each step has its own URL or history entry).
- **Branching:** recompute total steps when an answer changes the path; update "Step X of Y" and tell users ("1 step added").
- **Jumping:** allow returning to any completed step from the indicator or review page; after editing, offer "Return to review".
- **Review step** groups answers under step headings; nothing is submitted until the final action.
- **Leaving mid-flow:** warn only if unsaved changes exist; otherwise the draft is saved automatically.
- **Transitions:** step change uses a ≤ `duration-base` fade/slide with `ease-standard`; none under `prefers-reduced-motion`.
- **Mobile (< 640px):** replace the full stepper with "Step 2 of 4: Company details" + a progress bar; actions full-width stacked (primary on top) or a sticky bottom bar; scroll to top on step change.

## Accessibility
- **Role / semantics:** stepper is an ordered list (`ol`) inside `nav` with `aria-label="Progress"`; current item `aria-current="step"`; completed items include visually hidden "completed". Each step is a `form` or `fieldset`.
- **Keyboard:** Tab through fields then Back/Continue; Enter in a single-line field triggers Continue; completed step links reachable by Tab.
- **Announcements:** on step change update the document `<title>` ("Company details – Step 2 of 4 – Set up workspace"); added/removed steps announced via a polite live region.
- **Focus management:** after Continue/Back move focus to the new step heading (`tabindex="-1"`); on validation failure focus the error summary; after final submit focus the confirmation heading.
- **Time limits (2.2.1):** if the session can expire, warn ≥ 20s before and allow extension; saved drafts survive expiry.
- **WCAG 2.2:** 3.3.7 Redundant entry — never re-ask information from earlier steps; offer "Same as above". 3.3.4 Review step for legal/financial submissions. 2.5.8 targets ≥ 24px (aim 44px).

## Do & Don't
- ✅ Do: tell users the number of steps and what's needed before they start ("Takes about 5 minutes. Have your tax ID ready.").
- ✅ Do: name steps by content ("Payment"), not number only.
- ✅ Do: keep Back and Continue in the same position on every step.
- ❌ Don't: put a single field per step for a 20-field task — it feels endless.
- ❌ Don't: reset later steps silently when an earlier answer changes; tell the user what changed.
- ❌ Don't: run a wizard inside a small modal; use a full page for anything beyond 2 short steps.

## Anti-patterns
- **Progress that lies** — "Step 3 of 4" that turns into 9 steps destroys trust.
- **Lost-on-back** — Browser Back exits the flow or wipes answers.
- **Clickable future steps** — users skip required input and hit a wall at submit.
- **Hidden total effort** — no step count or time estimate leads to abandonment.
- **Submit without review** — irreversible actions with no chance to check answers.

## Related patterns
- [Form layout](../forms/form-layout.md) — layout of fields within each step
- [Inline validation](../forms/inline-validation.md) — per-step validation timing
- [Checkout](../flows/checkout.md) — purchase-specific multi-step flow
- [Onboarding](../flows/onboarding.md) — first-run guidance vs. data collection
- [Confirmation dialog](../data-feedback/confirm-dialog.md) — leaving with unsaved changes
- [Breadcrumbs](../navigation/breadcrumbs.md) — not a substitute for a step indicator

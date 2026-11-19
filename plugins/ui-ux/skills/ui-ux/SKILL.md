---
name: ui-ux
description: Team UI/UX standard for building and reviewing user interfaces. Use when creating or changing pages, screens, or components (forms, tables, navigation, modals, dashboards, onboarding, auth, checkout, settings); choosing a UI pattern; applying design tokens (spacing, type, color, radius, motion); adding empty/loading/error states; making UI accessible (WCAG 2.2 AA, keyboard, ARIA, contrast) or responsive; or auditing existing UI for usability. Stack-agnostic (web, mobile, any framework). Not for backend, API, database, or infra work.
---

# Diligent Squad UI Standard

Lean, opinionated rules for interfaces that are clear, consistent and accessible.
All detail lives in `references/`. Load only the files you need for the task.

## Step 0: project context
If the project root has a `DESIGN.md`, read it first. Its token overrides, stack notes and project rules **win over** the defaults in `references/principles.md`. If it's missing and the work is substantial, suggest `/ux-init` once. Don't block on it.

## Pick a mode

**Build mode** is for creating or changing UI. Follow this order:
1. **Pattern.** Read `references/patterns/INDEX.md`, then open only the 1–3 pattern files that match. Reuse a pattern before inventing one.
2. **Tokens.** Use the names in `references/principles.md` (`space-*`, `text-*`, `color-*`, `radius-*`, `duration-*`). If the project already has a design system, map to it rather than introducing new values.
3. **Layout.** Mobile-first. See `references/layout-responsive.md`.
4. **States.** Implement every row of the pattern's *Required states* table. See `references/states-and-feedback.md`.
5. **Accessibility pass.** Check against `references/accessibility.md` before calling the work done.
5b. **Anti-pattern pass.** Answer the self-check at the end of `references/anti-patterns.md`, and replace any generic default you didn't actually choose.
6. **Stack details.** Only if needed, read `references/stacks/<stack>.md`.

**Review mode** is for auditing existing UI (code, screenshot or URL):
- Follow `references/review-checklist.md` and output its severity-ranked report.
- For each pattern used, compare against that pattern file's *Required states* and *Anti-patterns*.
- Report findings with a location (`file:line`, a selector or a screen region) and a concrete fix.

## Non-negotiable rules
1. **One primary action per view**, visually dominant. Secondary actions are visually quieter.
2. **Visible labels** on every input. Placeholders are not labels.
3. **Contrast:** text ≥ 4.5:1, large text and UI parts ≥ 3:1. Never use color as the only signal.
4. **Keyboard:** everything reachable and operable, logical tab order, and a **visible focus ring** (never `outline: none` without a replacement).
5. **Targets** ≥ 24×24px (WCAG 2.5.8), and 44×44px on touch.
6. **Every async action** shows pending, success and failure states. Disable double-submit.
7. **Errors** say what went wrong and how to fix it, next to the cause. Never lose user input.
8. **Empty states** explain why it's empty and offer the next action.
9. **Motion** is ≤ 300ms, has a purpose, and respects `prefers-reduced-motion`.
10. **Semantic tokens only.** No raw hex or ad-hoc px in components.

## Reference map
| Load this | When |
|-----------|------|
| `references/patterns/INDEX.md` | Choosing or implementing any UI pattern, and for the "X vs Y" decision guides |
| `references/principles.md` | Spacing, typography, color, radius, motion, density, UI copy voice |
| `references/accessibility.md` | Any interactive element, custom widget, or a11y review |
| `references/states-and-feedback.md` | Loading, empty, error, success, validation, notifications |
| `references/layout-responsive.md` | Page structure, grids, breakpoints, touch vs pointer |
| `references/review-checklist.md` | Auditing UI / `/ux-review` |
| `references/anti-patterns.md` | Finishing any build, polishing, or when UI "looks generic / templated" |
| `references/DESIGN.template.md` | Creating a project `DESIGN.md` (`/ux-init`) |
| `references/patterns/styles/*.md` | The user asks for a look (minimal, bento, dark mode) |
| `references/stacks/*.md` | Translating rules to web CSS, React, or native mobile |

## Output expectations
- When you build: name the pattern(s) you used and list any required states you deliberately left out, with the reason.
- When you review: use the report format in `review-checklist.md`, with Blockers first.
- If the project has its own design system or tokens, **those win**. Point out conflicts with these rules; don't silently override them.

## Commands (plugin install only)
| Command | Does |
|---------|------|
| `/ux-init` | Writes a project `DESIGN.md` (context + token overrides) |
| `/ux-review` | Audit only. Produces a severity-ranked report, no edits |
| `/ux-polish` | Visual refinement and anti-pattern removal, behavior unchanged |
| `/ux-harden` | Adds missing states, edge cases, accessibility and responsive behavior |

## Team customization
- Brand values: edit the token tables in `references/principles.md`. Keep the token names.
- New pattern: copy `references/patterns/_TEMPLATE.md`, then add a row to `INDEX.md`.
- Review severity: edit the rubric in `references/review-checklist.md`.

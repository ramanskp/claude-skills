# UX Review Checklist

Use this to audit existing UI (source code, screenshot, or running URL).
Work through the categories in order. Record each finding with a **location**, the **rule** it breaks, a **severity**, and a **fix**.

## Process
1. **Identify scope.** List the screens or components under review and the patterns they use (map each to `patterns/INDEX.md`).
2. **Walk the primary task** as a user would. Note friction before reading any code.
3. **Run the categories below.** For each pattern used, also check its *Required states* and *Anti-patterns*.
4. **Score and report** using the rubric and template at the bottom.

## Categories
### 1. Accessibility (see `accessibility.md`)
- [ ] Contrast, color-only signals, alt text
- [ ] Keyboard reachability, focus visibility and order, traps
- [ ] Labels, error association, live announcements
- [ ] Target sizes, reduced motion

### 2. Clarity & hierarchy
- [ ] One obvious primary action per view
- [ ] Headings describe content. Visual hierarchy matches importance
- [ ] Labels and copy are plain, specific, consistent

### 3. States & feedback (see `states-and-feedback.md`)
- [ ] Loading, empty, error, success, and disabled are all designed
- [ ] Async actions give feedback and block double-submit
- [ ] Errors are actionable and preserve input

### 4. Patterns & consistency
- [ ] Each pattern is the right choice (check the INDEX decision guides)
- [ ] No anti-patterns from the pattern files
- [ ] Same thing looks and behaves the same everywhere

### 5. Layout & responsive (see `layout-responsive.md`)
- [ ] Works at 320px and at 200% zoom, with no horizontal page scroll
- [ ] Touch targets and hover-free alternatives on touch devices
- [ ] No layout shift on load

### 6. Visual system (see `principles.md`)
- [ ] Spacing, type, color, radius come from tokens (no one-off values)
- [ ] Alignment to grid, consistent density
- [ ] No generic-AI defaults from `anti-patterns.md` (nested cards, decorative icon tiles, gradient text, default purple gradient, filler copy)
- [ ] Respects the project `DESIGN.md` overrides, if present

## Severity rubric
Classify by **impact on the user**, not by how hard the fix is. When unsure between two levels, choose the higher one and say why.

| Severity | Definition | Examples |
|----------|------------|----------|
| **Blocker** | Some users **cannot complete** the primary task, data or input is lost, or WCAG 2.2 Level A/AA fails on the primary flow | Keyboard trap in checkout · submit button has no accessible name · form clears on a validation error · text contrast 2.8:1 on body copy · horizontal page scroll at 320px |
| **Major** | Users **can** finish, but with errors, confusion or significant friction, **or** WCAG AA fails outside the primary flow | No loading state on save (double-submits) · errors only shown in a toast · missing empty state · two equally loud primary buttons · hover-only actions on touch |
| **Minor** | Polish and consistency. The task is unaffected, but quality and trust suffer | Off-scale spacing · inconsistent radius or icon sizes · vague button label ("OK") · generic-AI anti-pattern · a missing `tabular-nums` in a table |

**Escalation rules**
- An accessibility failure on the **primary flow** is always a Blocker. The same failure elsewhere is Major.
- The same Minor issue repeated across **5+ places** counts as one Major (it's a system problem, not a one-off).
- Anything that breaks a `DESIGN.md` project rule is at least Major.

**Score:** `100 − (25 × Blockers + 8 × Majors + 2 × Minors)`, floor 0. Count each distinct finding once, even if it appears in many places.

| Score | Verdict |
|-------|---------|
| Any Blocker | **Not shippable**, whatever the score |
| 85–100 | Ship |
| 70–84 | Ship after fixing the Majors |
| < 70 | Rework before shipping |

## Report template
```markdown
# UX Review — <scope>
**Score:** <n>/100 · **Verdict:** <Not shippable | Ship | Ship after fixing Majors | Rework> · **Blockers:** <n> · **Major:** <n> · **Minor:** <n>
**Patterns in scope:** <pattern names>

## Blockers
1. **<Short title>** — `<file:line | selector | screen region>`
   - Rule: <category / pattern file + section>
   - Impact: <who is affected and how>
   - Fix: <concrete change>

## Major
...

## Minor
...

## What works well
- <2–4 strengths worth keeping>

## Suggested next steps
1. <Highest-leverage fix first>
```

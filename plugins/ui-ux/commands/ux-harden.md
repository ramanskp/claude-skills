---
description: Make existing UI robust: add missing states, edge cases, accessibility, and responsive behavior
argument-hint: <path | component | "current changes">
---

Harden the UI in: **$ARGUMENTS** (if no target is given, use the UI files in the current git diff).

Follow the `ui-ux` skill:
1. If the project root has a `DESIGN.md`, read it first.
2. Identify the patterns used via `${CLAUDE_PLUGIN_ROOT}/skills/ui-ux/references/patterns/INDEX.md` and open only those pattern files.
3. For each component, add whatever is missing:
   - **States**: every row of the pattern's *Required states* table (loading, empty, error, disabled, success). Follow the timing and channel rules in `states-and-feedback.md`.
   - **Edge cases**: long or unbroken strings, missing optional data, 0 / 1 / 10k items, slow and failed network, double-submit, offline, RTL-safe layout where relevant.
   - **Accessibility**: work through `accessibility.md`, covering labels, focus visibility and return, keyboard map, live announcements, contrast, target sizes, and reduced motion.
   - **Responsive**: check at 320px, 768px, 1280px and at 200% zoom, plus touch alternatives to hover (`layout-responsive.md`).
4. Keep the visual design unchanged unless a fix requires it (for example, a contrast failure).
5. **If you can run a browser, verify with real input.** Use real clicks, typing and Tab presses (e.g. Playwright `page.click()` / `keyboard`), not `element.click()`, `dispatchEvent` or setting `.value`, which skip focus and blur. Cover each field's blur, each in-form link and button by mouse and by keyboard, and each error and success path (stub the network responses).
6. Finish with a checklist of what you added per component (`file:line`), what you verified in a browser and how, and anything you couldn't verify (e.g. screen-reader output).

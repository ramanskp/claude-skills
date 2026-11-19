---
description: Refine the visual quality of existing UI (hierarchy, spacing, type, color, generic-AI anti-patterns) without changing behavior
argument-hint: <path | component | "current changes">
---

Polish the UI in: **$ARGUMENTS** (if no target is given, use the UI files in the current git diff).

Follow the `ui-ux` skill:
1. If the project root has a `DESIGN.md`, read it first. Its values override the defaults.
2. Read `${CLAUDE_PLUGIN_ROOT}/skills/ui-ux/references/anti-patterns.md` and `principles.md`.
3. Find and fix, in this order:
   - **Hierarchy**: one dominant primary action, a clear heading scale, and secondary items visually quieter.
   - **Spacing**: off-scale values mapped to `space-*`, proximity grouping, consistent section rhythm.
   - **Typography**: type-scale steps, line length, weights, alignment, tabular numerals in data.
   - **Color**: semantic tokens only, accent reserved for primary and current state, contrast still passing.
   - **Anti-patterns**: remove every item from `anti-patterns.md` that's present (nested cards, decorative icon tiles, gradient text, uniform shadows, filler copy).
   - **Details**: alignment to the grid, consistent radius and elevation, icon sizing, truncation.
4. **Don't** change behavior, data flow, copy meaning, or the public API of components. If a fix needs that, list it as a suggestion instead.
5. Finish with a short list of changes grouped by category (`file:line`), plus any suggestions you deliberately didn't apply.

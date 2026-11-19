---
description: Audit UI (files, a folder, a screenshot, or a URL) against the team UI/UX standard and produce a severity-ranked report
argument-hint: <path | glob | URL | "current changes">
---

Run a UX review of: **$ARGUMENTS**

If no target is given, review the UI files changed in the current git diff.

Follow the `ui-ux` skill in **Review mode**:

0. If the project root has a `DESIGN.md`, read it first. Its overrides are the standard to review against.
1. Read `${CLAUDE_PLUGIN_ROOT}/skills/ui-ux/references/review-checklist.md` and follow its Process.
2. Read `${CLAUDE_PLUGIN_ROOT}/skills/ui-ux/references/patterns/INDEX.md`, identify which patterns the target uses, and open only those pattern files. Check the target against each one's **Required states** and **Anti-patterns**.
3. Load `accessibility.md`, `states-and-feedback.md`, `layout-responsive.md`, or `principles.md` from the same `references/` folder only when a category needs them.
4. Getting at the target:
   - **Code**: read the files. Cite findings as `file:line`.
   - **URL**: if a browser tool is available, open it, take a snapshot, tab through it with the keyboard, and check at 320px width. Cite by selector or screen region.
   - **Screenshot**: review visually. Mark keyboard and screen-reader checks as "not verifiable from image".
5. Output **only** the report, using the template at the bottom of `review-checklist.md`: Blockers first, each finding with location, rule, impact and a concrete fix. Classify and score with the severity rubric in `review-checklist.md`, including its escalation rules and verdict table.

Do not change any files during a review. At the end, offer to fix the Blockers.

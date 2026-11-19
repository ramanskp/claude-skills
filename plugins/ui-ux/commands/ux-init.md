---
description: Create a project DESIGN.md (product context + token overrides) that the ui-ux skill reads before every build or review
argument-hint: "[optional notes about the product or brand]"
---

Create `DESIGN.md` at the project root. Extra context from the user: **$ARGUMENTS**

1. If `DESIGN.md` already exists, show a summary of it and ask whether to update or replace it. Don't overwrite it silently.
2. Start from `${CLAUDE_PLUGIN_ROOT}/skills/ui-ux/references/DESIGN.template.md`.
3. Infer as much as possible from the codebase, read-only:
   - Stack and UI library: package manifests, imports.
   - Existing tokens: CSS variables, Tailwind or theme config, design-token files. Record the **file path** and the values that differ from `principles.md`.
   - Fonts, icon set, dark-mode support, platforms.
   - Product purpose and users: README, app name, routes.
4. Ask the user **at most 3 short questions**, only for what can't be inferred (typically tone, brand personality, and what to avoid).
5. Write `DESIGN.md`. Keep only the sections that have content, and mark inferred values with `(inferred)` so the team can confirm them.
6. Finish by listing what was inferred vs. answered, and suggest committing the file so the whole team shares it.

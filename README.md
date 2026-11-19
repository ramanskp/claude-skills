# ui-ux — Team UI/UX Skill for Claude Code

A lean, stack-agnostic UI/UX standard packaged as a Claude Code plugin. It contains:

- **`ui-ux` skill**: triggers automatically when Claude builds or reviews UI. It has two modes, *Build* (pattern → tokens → layout → states → a11y) and *Review*.
- **Design-pattern library**: 26 patterns plus 3 style presets, one Markdown file each, all following the same template.
- **Commands**:
  - `/ux-init`: writes a project `DESIGN.md`.
  - `/ux-review`: audit report only, no edits.
  - `/ux-polish`: visual refinement and anti-pattern removal.
  - `/ux-harden`: adds missing states, edge cases and accessibility.
- **Anti-patterns guide**: catches the generic "AI template" look (default gradients, nested cards, filler copy).

Everything is plain Markdown. Edit it like documentation.

## For teammates

### 1. Install (about 1 minute, once)
In Claude Code:
```text
/plugin marketplace add ramanskp/claude-skills
/plugin install ui-ux@ui-ux-marketplace
```
Restart Claude Code. Check that it's installed with `/plugin`: `ui-ux` should appear as enabled.

### 2. Set up your project (once per repo)
```text
/ux-init
```
This writes a `DESIGN.md` at the project root with your stack, tokens and brand notes. Commit it so everyone on the project shares it.

### 3. Day to day
| You want to… | Do this |
|--------------|---------|
| Build or change UI | Just ask, e.g. *"Add a filterable orders table"*. The skill applies automatically |
| Check UI before a PR | `/ux-review src/components/Checkout/` (or `/ux-review` with no target for the current diff) |
| Make it look less generic | `/ux-polish <file>` |
| Add missing states, edge cases and accessibility | `/ux-harden <file>` |

`/ux-review` returns a score and a verdict. **Any Blocker means not shippable**, whatever the score.

### 4. Stay up to date
```text
/plugin marketplace update ui-ux-marketplace
```
Then restart Claude Code. See [CHANGELOG.md](CHANGELOG.md) for what changed.

### Troubleshooting
- **The `/ux-*` commands don't show up:** restart Claude Code after installing or updating.
- **The skill doesn't kick in:** mention the UI work explicitly (page, component, form, layout, accessibility). It deliberately stays out of backend-only tasks.
- **It conflicts with your project's design system:** put the overrides in `DESIGN.md`. Project rules win over the team defaults.
- **Found a gap or a wrong rule?** Open an issue or PR. See [Contributing a pattern](#contributing-a-pattern).

## Install

### Option A — Marketplace (recommended, gets updates)
```text
/plugin marketplace add ramanskp/claude-skills
/plugin install ui-ux@ui-ux-marketplace
```
Restart Claude Code. Update later with `/plugin marketplace update ui-ux-marketplace`.

To roll it out to a whole project, commit this to the project's `.claude/settings.json`:
```json
{
  "extraKnownMarketplaces": {
    "ui-ux-marketplace": { "source": { "source": "git", "url": "https://github.com/ramanskp/claude-skills.git" } }
  },
  "enabledPlugins": { "ui-ux@ui-ux-marketplace": true }
}
```

### Option B — Local clone (for contributors)
```text
/plugin marketplace add ./path/to/ui-ux-skill
/plugin install ui-ux@ui-ux-marketplace
```

### Option C — Skill folder only (no plugin, no command)
```bash
cp -r plugins/ui-ux/skills/ui-ux ~/.claude/skills/ui-ux          # personal
cp -r plugins/ui-ux/skills/ui-ux <project>/.claude/skills/ui-ux  # per project
```

## Use
- Just ask: *"Build a settings page with a danger zone"* or *"Add a filterable orders table"*. The skill picks the matching patterns.
- Per project, run `/ux-init` once and commit the generated `DESIGN.md`. Its token overrides and rules then apply to every build and review in that repo.
- Refine: `/ux-polish src/pages/Pricing.tsx` for look and feel, `/ux-harden src/components/OrdersTable/` for robustness.
- Audit: `/ux-review src/components/Checkout/`, `/ux-review https://staging.example.com/signup`, or `/ux-review` with no argument to review the current diff.

## Layout
```
plugins/ui-ux/
├── .claude-plugin/plugin.json
├── commands/               # ux-init, ux-review, ux-polish, ux-harden
└── skills/ui-ux/
    ├── SKILL.md                  # entry point, kept short
    └── references/
        ├── principles.md         # ← brand tokens: edit these
        ├── accessibility.md      # WCAG 2.2 AA checklist
        ├── states-and-feedback.md
        ├── layout-responsive.md
        ├── review-checklist.md   # ← severity rubric: edit this
        ├── anti-patterns.md      # generic-AI look to avoid
        ├── DESIGN.template.md    # per-project overrides (via /ux-init)
        ├── stacks/               # web-css, react, mobile adapters
        └── patterns/
            ├── INDEX.md          # problem → pattern routing + decision guides
            ├── _TEMPLATE.md
            ├── navigation/  forms/  data-feedback/  flows/  styles/
```

## Customize for your team
1. **Per project**: use a root `DESIGN.md` (via `/ux-init`). No need to fork the plugin.
2. **Team-wide brand**: change the values (not the names) in `references/principles.md`.
3. **Review severity**: fill in the rubric in `references/review-checklist.md`.
4. **Stack**: add `references/stacks/<your-stack>.md` and a row to the reference map in `SKILL.md`.

## Contributing a pattern
1. Copy `patterns/_TEMPLATE.md` to `patterns/<group>/<name>.md` and keep every heading.
2. Add a row to `patterns/INDEX.md`.
3. Run `./scripts/check-patterns.sh`.
4. Bump `version` in **both** `plugins/ui-ux/.claude-plugin/plugin.json` and `.claude-plugin/marketplace.json` (minor for new patterns, patch for fixes) and add a line to `CHANGELOG.md`.

## Relationship to other UI skills
This is a short, opinionated team standard. If you also use a large reference skill (for example `ui-ux-pro-max` for style and palette search), the two complement each other. When guidance conflicts, this skill wins on team rules.

## Acknowledgements
The anti-patterns guide, refinement commands and `DESIGN.md` convention were inspired by [Impeccable](https://github.com/pbakaus/impeccable) (Apache-2.0). The content here is written independently.

## License
MIT. See [LICENSE](LICENSE).

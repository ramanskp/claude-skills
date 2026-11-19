# Changelog

All notable changes to this plugin. Format: [Keep a Changelog](https://keepachangelog.com), versioning: [SemVer](https://semver.org).

## [0.2.0] — 2026-11-17
### Added
- `references/anti-patterns.md`: generic-AI visual anti-patterns and a pre-finish self-check.
- Project `DESIGN.md` convention (`references/DESIGN.template.md`), read first and overriding the defaults.
- Commands: `/ux-init` (writes DESIGN.md), `/ux-polish` (visual refinement), `/ux-harden` (states, edge cases, a11y).
### Changed
- SKILL.md: Step 0 project context, plus an anti-pattern pass in Build mode.
- Review checklist and `/ux-review` check the anti-patterns and DESIGN.md overrides.

## [0.1.0] — 2026-11-17
### Added
- `ui-ux` skill with Build and Review modes.
- Core references: principles & tokens, WCAG 2.2 AA checklist, states & feedback, layout & responsive, review checklist.
- Pattern library: 8 navigation, 7 forms, 7 data & feedback, 4 flows, 3 style presets.
- Stack adapters: web-css, react, mobile.
- `/ux-review` command.
- `scripts/check-patterns.sh` library validator.

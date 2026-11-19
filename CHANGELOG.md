# Changelog

All notable changes to this plugin. Format: [Keep a Changelog](https://keepachangelog.com), versioning: [SemVer](https://semver.org).

## [0.2.2] — 2026-11-19
### Changed
- Accessibility "How to test": new step 5. Automated browser tests must use real pointer and keyboard input, not `element.click()`, `dispatchEvent` or `.value`, and cover every in-form link by mouse and by keyboard.
- `/ux-harden`: when a browser is available, verify with real input, and report what was verified and how.
- Review checklist: "Blur vs. click" trace check. Server-set errors must survive blur.
- Added after a blur bug removed a "Sign in instead" link before it could be clicked. The script-triggered test missed it; a real-input test caught it.

## [0.2.1] — 2026-11-19
### Changed
- Review checklist: new step 3, "Trace every interaction path". Covers focus no-ops on already-focused fields, silent `aria-describedby` changes, re-announcing identical messages, DOM vs. visual order, and repeat/race conditions. Added after a review pass missed a silent-error bug that a browser test later confirmed.
- Accessibility checklist: matching rules for announcing errors on focused elements and for DOM order matching visual order.

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

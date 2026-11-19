# DESIGN.md

<!--
Project-level design context for the ui-ux skill.
Put this file at the project root. The skill reads it first, and its values OVERRIDE
the defaults in references/principles.md. Delete any section you don't need:
missing sections fall back to the team defaults.
Generate a first draft with /ux-init.
-->

## Product
- **What it is:** <one sentence>
- **Primary users:** <who, context of use, expertise>
- **Platforms:** <web desktop / mobile web / iOS / Android>
- **Tone:** <e.g. calm & precise | friendly & playful | dense & technical>

## Brand direction
- **Personality (3 words):** <...>
- **Avoid:** <looks or competitors to stay away from>
- **Style preset:** <none | minimal | bento | dark-mode>

## Token overrides
<!-- Only list tokens that differ from principles.md. Use the same token names. -->
| Token | Value | Note |
|-------|-------|------|
| `font-sans` | | |
| `color-primary` | | |
| `radius-md` | | |
| `density` | comfortable / compact / touch | |

## Components & stack
- **Design system / library:** <e.g. in-house, shadcn/ui, MUI, none>. Its components win over hand-built ones
- **Where tokens live in code:** <path, e.g. src/styles/tokens.css>
- **Icon set:** <...>

## Project rules
<!-- Extra rules or exceptions specific to this product. -->
- <e.g. All tables are compact density>
- <e.g. No modals on mobile. Use full pages>

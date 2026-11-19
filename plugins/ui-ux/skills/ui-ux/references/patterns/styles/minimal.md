# Minimal style preset

> Calm, content-first screens with less chrome, where whitespace and type do the structuring and every control still looks usable.

## Intent
- Reduce visual noise: fewer borders, shadows, and fills; let content carry the page.
- Build hierarchy through size, weight, and space (principle 2), not decoration.
- Keep every affordance visible: buttons look like buttons, inputs look like inputs, links look like links.
- Suits reading-heavy products, portfolios, documentation, and focused tools.

## Token overrides
| Token | Default | Override | Why |
|-------|---------|----------|-----|
| `space-6` (card padding, field gap) | `space-6` | `space-8` | More breathing room replaces borders as a separator |
| `space-8` (section gap) | `space-8` | `space-12` | Sections separate by space, not rules or boxes |
| `space-12` (page sections) | `space-12` | `space-16` | Generous page rhythm |
| `color-border` | default divider | lighter neutral, used sparingly | Fewer, quieter dividers on decorative boundaries only |
| `color-border-strong` | default input border | unchanged | Input and control borders must keep ≥ 3:1 contrast |
| `color-surface` | distinct card fill | same as `color-bg` | Cards become open groups instead of filled boxes |
| `shadow-1` | low elevation | none | Cards no longer float; grouping comes from space |
| `shadow-2` / `shadow-3` | dropdown / modal | unchanged | Overlays still need separation from the page |
| `radius-md` | 8px | `radius-sm` | Quieter shapes; fewer rounded containers |
| `text-base` | 16 / 24 | same size, line-height of `text-lg` | Easier long-form reading with more air |
| `duration-base` | 200ms | `duration-fast` | Subtle, quick transitions fit a calm UI |

## Component adjustments
- **Buttons:** primary keeps a solid `color-primary` fill; secondary keeps a visible `color-border-strong` outline. No text-only "ghost" buttons for primary actions.
- **Inputs:** keep a full border (or a bottom border with ≥ 3:1 contrast) plus visible label; never placeholder-only.
- **Cards:** drop fill and shadow; separate with `space-8` and a heading. Keep a border only when cards are clickable.
- **Links:** underline in body text; color alone is not enough.
- **Tables:** remove vertical rules; keep light horizontal row dividers or zebra striping for scanability.
- **Icons:** pair icon-only controls with a tooltip and accessible name; prefer icon + label for primary actions.
- **Navigation:** reduce background fills; mark the current item with weight plus an indicator bar, not color only.

## Accessibility guardrails
- Contrast floors stay: body text ≥ 4.5:1, large text and UI components ≥ 3:1 (including input borders and toggles).
- `color-focus` ring is never removed or thinned; minimal styles make focus the most visible element on the page.
- Target sizes follow the active density mode; removing chrome must not shrink the clickable area.
- Muted text (`color-text-muted`) still passes 4.5:1; don't lighten it further for "airiness".
- Every state (hover, focus, disabled, error) remains visually distinct even with fewer borders.

## Do & Don't
- ✅ Do: remove a border only when space or alignment already communicates the grouping.
- ✅ Do: keep one obvious primary action per screen.
- ✅ Do: test with real, long content; whitespace hides problems with short sample text.
- ❌ Don't: turn buttons into plain text or hide actions until hover.
- ❌ Don't: use light grey text on white to look "clean".
- ❌ Don't: remove error styling or field borders to keep forms visually quiet.

## Pairs well with
- [Form layout](../forms/form-layout.md) — single-column forms benefit most from extra spacing
- [Top navigation](../navigation/top-nav.md) — low-chrome marketing and content sites
- [Cards & lists](../data-feedback/cards-lists.md) — open lists instead of boxed cards
- [Dark mode](dark-mode.md) — combine for a minimal low-light theme; dark mode rules on surfaces win

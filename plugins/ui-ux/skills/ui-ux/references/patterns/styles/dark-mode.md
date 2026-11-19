# Dark mode style preset

> A low-light theme that reduces glare while keeping hierarchy, brand recognition, and every contrast requirement intact.

## Intent
- Comfortable use in dark environments and for users who prefer it, without losing legibility.
- Express elevation with lighter surfaces instead of shadows, which barely show on dark backgrounds.
- Keep brand colors recognizable but desaturated so they don't vibrate against dark surfaces.
- Same components, same states, same tokens: only values change.

## Token overrides
| Token | Default | Override | Why |
|-------|---------|----------|-----|
| `color-bg` | light page | very dark neutral, e.g. #121212 (never #000) | Pure black causes harsh contrast and smearing on OLED scroll |
| `color-surface` | card fill | one step lighter than `color-bg`, e.g. #1E1E1E | Elevation through lightness |
| `color-surface-raised` | popover fill | two steps lighter, e.g. #2A2A2A | Higher layers are lighter |
| `color-text` | near-black | off-white, e.g. #E6E6E6 (not #FFF) | Reduces halation while staying ≥ 4.5:1 |
| `color-text-muted` | muted grey | mid-light grey, re-checked ≥ 4.5:1 on all surfaces | Muted text fails most often in dark themes |
| `color-border` / `color-border-strong` | light-theme greys | lighter-than-surface greys; strong ≥ 3:1 | Dividers and input borders stay visible |
| `color-primary` | brand | desaturated, lighter tint of brand | Saturated hues vibrate on dark backgrounds |
| `color-on-primary` | usually white | re-pick for ≥ 4.5:1 on the new primary (often dark text) | Lighter primary may need dark label text |
| `color-success` / `color-warning` / `color-danger` / `color-info` | light-theme status | lighter, desaturated variants | Keep ≥ 3:1 for icons, ≥ 4.5:1 for text |
| `color-focus` | focus color | bright, high-luminance variant | Must reach 3:1 against every dark surface |
| `shadow-1` / `shadow-2` / `shadow-3` | low → high | minimal or none; pair with lighter surface | Shadows are invisible on dark; lightness carries elevation |

## Component adjustments
- **Elevation:** each layer (page → card → dropdown → modal) uses the next lighter surface; modal scrim darkens rather than greys.
- **Images & photos:** slightly reduce brightness or add a subtle dark overlay for large bright images; never invert photos.
- **Illustrations & logos:** provide dark-variant assets; add a light backing plate for logos with dark ink or transparent backgrounds.
- **Charts:** re-validate categorical palettes against dark surfaces; gridlines use `color-border`.
- **Inputs:** fills one step lighter than their container so fields stay discoverable.
- **Code and tables:** zebra stripes and code blocks use surface steps, not pure black.
- **Theme switch:** default to `prefers-color-scheme`; offer a user override (Light / Dark / System) in [settings](../flows/settings.md), persisted per user.
- **No flash:** apply the chosen theme before first paint so pages don't flash light.
- Set the platform color-scheme hint so native controls, scrollbars, and form widgets match.

## Accessibility guardrails
- Re-check every text and UI pair in dark: body ≥ 4.5:1, large text and components ≥ 3:1. Light-theme passes don't carry over.
- Focus ring stays fully visible on every surface level; never rely on a shadow-based focus style.
- Status meaning is never color-only; icons and text labels remain.
- Avoid maximum contrast (pure white on pure black); it causes halation for users with astigmatism.
- Target sizes, motion rules, and all states are unchanged from the default theme.
- Respect forced-colors / high-contrast modes; don't override system colors there.

## Do & Don't
- ✅ Do: design dark as a full theme with its own tested token values, not an automatic inversion.
- ✅ Do: test with real images, charts, and user-generated content.
- ✅ Do: remember the user's explicit choice over the system setting.
- ❌ Don't: use pure black backgrounds or pure white body text.
- ❌ Don't: reuse light-theme brand colors unchanged.
- ❌ Don't: indicate elevation with shadows alone.

## Pairs well with
- [Settings](../flows/settings.md) — the theme override control lives in appearance settings
- [Dashboard grid](../navigation/dashboard-grid.md) — dense data UIs often used in dark environments
- [Minimal](minimal.md) and [Bento](bento.md) — layer either preset; dark mode color rules take precedence

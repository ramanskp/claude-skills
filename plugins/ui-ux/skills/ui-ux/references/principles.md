# Design Principles & Tokens

These are the team's source of truth for visual decisions. **Edit the token values in this file to match your brand.**
Keep the token *names* stable, because patterns and reviews refer to them.

## Core principles
1. **Clarity over cleverness.** Every screen has one primary action, and it is visually obvious.
2. **Hierarchy through size, weight, and space.** Use color last.
3. **Consistency beats novelty.** Reuse an existing pattern before inventing one (see `patterns/INDEX.md`).
4. **Every state is designed.** Default, hover, focus, active, disabled, loading, empty, error, success.
5. **Accessible by default.** WCAG 2.2 AA is the floor, not a stretch goal.
6. **Content first.** Design with real or realistic content and lengths, including long names, zero items and 10k items.
7. **Forgiving.** Prefer undo over confirmation. Never lose user input.

## Spacing scale (4px base)
| Token | Value | Typical use |
|-------|-------|-------------|
| `space-1` | 4px | Icon-to-label gap |
| `space-2` | 8px | Tight groups, chip padding |
| `space-3` | 12px | Input padding |
| `space-4` | 16px | Default gap, card padding (mobile) |
| `space-6` | 24px | Card padding (desktop), form field gap |
| `space-8` | 32px | Section gap |
| `space-12` | 48px | Page section separation |
| `space-16` | 64px | Hero / landing separation |

Rule: related items are closer together than unrelated items (proximity). Don't use off-scale values.

## Typography
| Token | Size / line-height | Weight | Use |
|-------|--------------------|--------|-----|
| `text-xs` | 12 / 16 | 400 | Captions, metadata (never body) |
| `text-sm` | 14 / 20 | 400 | Secondary text, dense tables |
| `text-base` | 16 / 24 | 400 | Body (minimum for long-form) |
| `text-lg` | 18 / 28 | 500 | Lead paragraph, card titles |
| `text-xl` | 20 / 28 | 600 | Section headings |
| `text-2xl` | 24 / 32 | 600 | Page headings |
| `text-3xl` | 30 / 36 | 700 | Hero / display |

- Font families: `font-sans` = system UI stack (or the brand font) and `font-mono` = code and tabular data.
- Line length 45–75 characters for reading text.
- At most 2 font families and 3–4 weights per product.
- Use tabular numerals for numbers that are compared (tables, prices).

## Color (semantic tokens)
Components use **semantic** tokens only, never raw palette values.

| Token | Purpose |
|-------|---------|
| `color-bg` / `color-surface` / `color-surface-raised` | Page, card, popover backgrounds |
| `color-text` / `color-text-muted` / `color-text-inverse` | Text levels |
| `color-border` / `color-border-strong` | Dividers, input borders |
| `color-primary` / `color-primary-hover` / `color-on-primary` | Main brand action |
| `color-focus` | Focus ring (must reach 3:1 against adjacent colors) |
| `color-success` / `color-warning` / `color-danger` / `color-info` | Status. Always pair with an icon or text, never color alone |

Contrast: body text ≥ 4.5:1, large text (≥ 24px, or ≥ 18.66px bold) and UI components ≥ 3:1.

## Shape, elevation & motion
| Token | Value | Use |
|-------|-------|-----|
| `radius-sm` / `radius-md` / `radius-lg` / `radius-full` | 4 / 8 / 12 / 9999px | Inputs / cards / modals / pills |
| `shadow-1` / `shadow-2` / `shadow-3` | low → high | Card / dropdown / modal |
| `duration-fast` / `duration-base` / `duration-slow` | 120 / 200 / 300ms | Hover / enter / large surfaces |
| `ease-standard` | cubic-bezier(0.2, 0, 0, 1) | Default easing |

- Motion explains change (where something came from or went to) and is never only decorative.
- Respect `prefers-reduced-motion`: replace movement with an opacity change or nothing.

## Surface widths
| Token | Value | Use |
|-------|-------|-----|
| `size-toast` | ~40ch (max 420px) | Toasts |
| `size-dialog-sm` / `-md` / `-lg` | ~40ch / ~60ch / ~80ch | Confirm / standard / complex dialogs |
| `size-drawer` | 25–40% of viewport (min 320px) | Side drawers |
| `size-content` | 1280px | Max app content width |
| `size-prose` | 70ch | Max reading width |

All surfaces become full-width below 640px.

## Density
| Mode | Control height | Use |
|------|----------------|-----|
| Comfortable (default) | 40px | Most UIs |
| Compact | 32px | Data-heavy desktop tools (keep the 24px minimum target) |
| Touch | 44–48px | Mobile / touch-first |

## Voice in UI copy
- Buttons are verbs that name the outcome ("Save changes", "Delete project"), not "OK" or "Submit".
- Errors say what happened and how to fix it. Don't blame the user.
- Use sentence case everywhere. No ALL CAPS except short labels/overlines.

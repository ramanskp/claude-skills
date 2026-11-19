# Bento style preset

> A modular grid of varied tile sizes that gives an at-a-glance overview, with one clear focal tile and a reading order that matches the DOM.

## Intent
- Present several related pieces of content (metrics, features, highlights) as distinct, scannable tiles.
- Use a small, fixed tile size scale so the grid feels deliberate, not random.
- One focal tile carries the most important message or metric; everything else supports it.
- Suits dashboards, feature overviews on marketing pages, and profile or summary screens.

## Token overrides
| Token | Default | Override | Why |
|-------|---------|----------|-----|
| `space-4` (grid gap, mobile) | `space-4` | unchanged | Tight enough to read as one composition on small screens |
| `space-6` (grid gap, desktop) | `space-6` | `space-4` for gaps, `space-6` for tile padding | Consistent narrow gutters make tiles read as one system |
| `radius-md` (card) | 8px | `radius-lg` | Larger, uniform rounding is the signature of the style |
| `radius-lg` (modal) | 12px | unchanged | Overlays keep their own radius |
| `color-surface` | card fill | distinct from `color-bg` | Tiles need a visible fill since gaps, not borders, separate them |
| `color-surface-raised` | popover fill | focal tile fill (or `color-primary` with `color-on-primary`) | Marks the single focal tile |
| `shadow-1` | low elevation | none, or kept only for interactive tiles | Flat tiles; elevation signals clickability |
| `text-3xl` | hero / display | focal tile headline or key metric | One large number or headline anchors the grid |
| `text-sm` | secondary text | tile captions and labels | Keeps supporting tiles quiet |

## Component adjustments
- **Tile size scale:** pick 3–4 sizes on a 12- or 4-column grid, e.g. small (1×1), wide (2×1), tall (1×2), large (2×2). No arbitrary spans.
- **Focal tile:** exactly one large tile per grid, placed first in the DOM and top-left (or top) visually.
- **Reading order:** DOM order matches visual order left-to-right, top-to-bottom; never reorder with grid placement or dense auto-flow.
- **Tile content:** one idea per tile: a heading, one metric or visual, and at most one action.
- **Interactive tiles:** the whole tile is one link or button with a clear accessible name; no nested competing actions.
- **Equal heights per row:** tiles in a row align; content overflow truncates with access to full text.
- **Empty or loading tiles:** keep their grid footprint with a skeleton or empty message so the layout doesn't jump.

## Accessibility guardrails
- Visual order equals DOM and focus order (WCAG 1.3.2 meaningful sequence, 2.4.3 focus order).
- Tile text and the focal tile on `color-primary` keep ≥ 4.5:1 for body and ≥ 3:1 for large text and icons.
- Interactive tiles show the `color-focus` ring outside the tile edge, visible against both tile and page backgrounds.
- Tile fills that separate content from the page reach 3:1 against `color-bg` when the tile boundary conveys meaning, or add a `color-border`.
- Targets follow the active density mode even inside small tiles.
- Each tile with a heading uses a real heading level so screen-reader users can navigate between tiles.

## Do & Don't
- ✅ Do: rank content first, then assign tile sizes by importance.
- ✅ Do: collapse to a single column on mobile (< 640px), in DOM order, with the focal tile first.
- ✅ Do: keep gaps uniform across the whole grid.
- ❌ Don't: make every tile a different size; the grid becomes noise.
- ❌ Don't: use more than one focal tile or more than one accent fill.
- ❌ Don't: rely on autoplaying video or motion in tiles; respect `prefers-reduced-motion`.

## Pairs well with
- [Dashboard grid](../navigation/dashboard-grid.md) — the layout pattern bento styling applies to
- [Cards & lists](../data-feedback/cards-lists.md) — tile content and interactive card rules
- [Skeleton loading](../data-feedback/skeleton-loading.md) — loading tiles that hold their size
- [Dark mode](dark-mode.md) — tile fills become lighter surfaces instead of shadows

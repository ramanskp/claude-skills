# Stack adapter: Web (HTML + CSS)

These map the skill's tokens and rules to plain web code. Use them only when the project has no design system.

## Tokens as CSS custom properties
```css
:root {
  --space-1: 4px;  --space-2: 8px;  --space-3: 12px; --space-4: 16px;
  --space-6: 24px; --space-8: 32px; --space-12: 48px; --space-16: 64px;
  --radius-sm: 4px; --radius-md: 8px; --radius-lg: 12px; --radius-full: 9999px;
  --duration-fast: 120ms; --duration-base: 200ms; --duration-slow: 300ms;
  --ease-standard: cubic-bezier(0.2, 0, 0, 1);
  /* Semantic colors: set per theme */
  --color-bg: #fff; --color-surface: #fff; --color-text: #111827; --color-text-muted: #4b5563;
  --color-border: #d1d5db; --color-primary: #2563eb; --color-on-primary: #fff;
  --color-focus: #2563eb; --color-danger: #b91c1c; --color-success: #15803d;
}
@media (prefers-color-scheme: dark) {
  :root:not([data-theme="light"]) { --color-bg: #0f1115; --color-surface: #171a21; --color-text: #e5e7eb; }
}
:root[data-theme="dark"] { --color-bg: #0f1115; --color-surface: #171a21; --color-text: #e5e7eb; }
```

## Focus ring (never remove without replacing)
```css
:focus-visible { outline: 2px solid var(--color-focus); outline-offset: 2px; }
```

## Reduced motion
```css
@media (prefers-reduced-motion: reduce) {
  *, *::before, *::after { animation-duration: 0.01ms !important; transition-duration: 0.01ms !important; scroll-behavior: auto !important; }
}
```

## Useful primitives
- Use `<dialog>` with `showModal()` for modals. It gives you focus trapping, Esc to close, and the `::backdrop` element.
- `inert` on background content for custom overlays.
- `scroll-padding-top` equal to the sticky header height, so focused elements don't end up hidden behind it (WCAG 2.4.11).
- `min-height: 100dvh` instead of `100vh` on mobile.
- `font-variant-numeric: tabular-nums` for tables and prices.
- `@container` queries for components placed in containers of varying width.
- Pointer capability: `@media (hover: hover) and (pointer: fine) { … }`.

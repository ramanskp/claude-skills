# Stack adapter: React (any styling approach)

## Principles to code
- **Tokens**: expose the tokens as CSS variables (see `web-css.md`) or your theme object, and never hardcode them in components. With Tailwind, map tokens in the theme config so classes like `p-4` mean `space-4`.
- **Prefer headless, accessible primitives** (Radix, React Aria, Headless UI, or the project's own) for dialogs, menus, comboboxes, tabs and popovers. Don't hand-roll focus management.
- **States as props/variants**: model `loading`, `disabled`, `invalid`, `empty` explicitly, rather than as ad-hoc booleans scattered through the JSX.

## Snippets
```tsx
// Accessible field: label, hint, error wired together
function Field({ id, label, hint, error, ...props }: FieldProps) {
  const hintId = hint ? `${id}-hint` : undefined;
  const errId = error ? `${id}-error` : undefined;
  return (
    <div className="field">
      <label htmlFor={id}>{label}</label>
      {hint && <p id={hintId} className="hint">{hint}</p>}
      <input id={id} aria-invalid={!!error} aria-describedby={[hintId, errId].filter(Boolean).join(" ") || undefined} {...props} />
      {error && <p id={errId} className="error">{error}</p>}
    </div>
  );
}
```

```tsx
// Pending button: keeps width, blocks double submit, announces busy
<button type="submit" disabled={pending} aria-busy={pending}>
  {pending ? <><Spinner aria-hidden /> Saving…</> : "Save changes"}
</button>
```

```tsx
// Polite status region for toasts / async results (mount once at the root)
<div role="status" aria-live="polite" className="sr-only">{statusMessage}</div>
```

## Gotchas
- Return focus to the trigger after closing a dialog or drawer.
- Moving focus on route change: focus the page `<h1>` or a skip target so screen readers announce the new page.
- Don't use `onClick` on a `div`. Use `<button>`, or a link for navigation.
- Avoid layout shift: reserve space for async content (skeletons at the same dimensions as the content).
- `useId()` for stable label and description IDs.

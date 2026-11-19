# Accessibility Checklist (WCAG 2.2 AA)

Use this list for every interactive element and every review. Each item names its WCAG success criterion (SC).

## Perceivable
- [ ] Text contrast ≥ 4.5:1; large text ≥ 3:1 (1.4.3).
- [ ] UI components, focus indicators and meaningful graphics ≥ 3:1 against adjacent colors (1.4.11).
- [ ] Information is not conveyed by color alone. Add an icon, text or pattern (1.4.1).
- [ ] Meaningful images have `alt` text; decorative images have `alt=""` / `aria-hidden` (1.1.1).
- [ ] Content reflows at 320px CSS width without horizontal scroll, except data tables and maps (1.4.10).
- [ ] Text resizes to 200% without loss. Text spacing can be overridden without breaking (1.4.4, 1.4.12).
- [ ] Video has captions; audio-only content has a transcript (1.2.x).

## Operable
- [ ] Everything works with the keyboard alone, with no keyboard traps (2.1.1, 2.1.2).
- [ ] Focus order follows reading order (2.4.3). Focus is always **visible** (2.4.7) and **not obscured** by sticky headers or footers (2.4.11).
- [ ] A skip link to the main content exists, along with landmarks (`header`, `nav`, `main`, `footer`) (2.4.1).
- [ ] Pages have unique, descriptive `<title>`s (2.4.2). Link text makes sense out of context (2.4.4).
- [ ] Target size ≥ 24×24px, or enough spacing around it (2.5.8).
- [ ] Drag actions have a single-pointer alternative (2.5.7).
- [ ] No content flashes more than 3 times per second (2.3.1). Auto-moving content can be paused (2.2.2).
- [ ] Time limits can be extended or turned off (2.2.1).

## Understandable
- [ ] `lang` is set on the page (3.1.1).
- [ ] Inputs have visible labels and instructions (3.3.2). Errors are identified in text and tied to the field (3.3.1).
- [ ] Error messages suggest a fix (3.3.3). Legal or financial submissions are reversible, checked, or confirmed (3.3.4).
- [ ] Previously entered info is auto-filled or selectable, not re-asked (3.3.7, Redundant Entry).
- [ ] Authentication needs no cognitive test (puzzle, memorization) unless an alternative exists. Allow paste and password managers (3.3.8).
- [ ] Navigation and help are consistent across pages (3.2.3, 3.2.6). Focus or input never triggers an unexpected context change (3.2.1, 3.2.2).

## Robust
- [ ] Use native elements first (`button`, `a`, `input`, `select`, `dialog`). Add ARIA only when native semantics fall short.
- [ ] Custom widgets follow the WAI-ARIA Authoring Practices for role, state and keyboard behavior (4.1.2).
- [ ] Status messages are announced without moving focus (`role="status"` / `aria-live`) (4.1.3).
- [ ] Errors raised on an element that **already has focus** (e.g. Enter pressed inside the invalid field) are announced via a live region. `focus()` on the focused element and `aria-describedby` changes are silent. To re-announce an identical message, clear the region first, then set it on the next frame (4.1.3).
- [ ] DOM and tab order match the visual order. A control comes after the thing it acts on (1.3.2, 2.4.3).

## Quick rules for common widgets
| Widget | Must have |
|--------|-----------|
| Button | `<button>`. Activates with Enter and Space. Icon-only buttons need `aria-label` |
| Link | `<a href>` for navigation. Don't use a button to navigate or a link to perform an action |
| Dialog | `role="dialog"` + `aria-modal="true"` + label. Focus moves in and is trapped, Esc closes, focus returns to the trigger |
| Tabs | `tablist` / `tab` / `tabpanel`, arrow keys between tabs, `aria-selected` |
| Combobox | `aria-expanded`, `aria-controls`, `aria-activedescendant`, arrow keys + Enter + Esc |
| Toggle | `aria-pressed` (button) or `role="switch"` + `aria-checked` |
| Current page | `aria-current="page"` on the active nav item |

## Motion
- Honor `prefers-reduced-motion: reduce`. Remove parallax, autoplay and large transforms.
- Animation never blocks interaction or hides content changes.

## How to test (minimum)
1. Tab through the whole view. Can you reach and operate everything, and is focus always visible?
2. Zoom to 200% and resize to 320px wide.
3. Run an automated checker (axe, Lighthouse, or a platform equivalent). It catches about 30–40% of issues; the manual checks above cover the rest.
4. Do a screen-reader smoke test of the primary flow (VoiceOver, NVDA, or TalkBack).

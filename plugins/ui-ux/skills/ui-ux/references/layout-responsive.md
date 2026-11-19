# Layout & Responsive

## Breakpoints (mobile-first, min-width)
| Name | Min width | Typical layout |
|------|-----------|----------------|
| `sm` | 640px | Single column → wider single column |
| `md` | 768px | Two columns, or side panel becomes possible |
| `lg` | 1024px | Persistent sidebar, multi-column |
| `xl` | 1280px | Max content width reached |
| `2xl` | 1536px | Extra whitespace only, don't stretch content |

- Design the smallest layout first and add complexity upward.
- Prefer breakpoints based on content (where the layout breaks) over device names.
- Use container or component queries for components that live in containers of different widths.

## Page structure
- Max readable content width is about 65–75ch for prose. App content max is about 1280–1440px, centered.
- Page gutters: `space-4` on mobile, `space-6` on tablet, `space-8` or more on desktop.
- Use a 4px spacing grid (see `principles.md`). Align to a 12-column grid on desktop, 4 columns on mobile.
- Build vertical rhythm from consistent section gaps (`space-8` / `space-12`).

## Hierarchy & scanning
- F-pattern for text-heavy pages, Z-pattern for sparse landing pages.
- The primary action sits where the eye lands at the end of the reading path (usually bottom-right of a form, or top-right of a page header).
- Group related controls and separate groups with space before reaching for borders.

## Touch vs. pointer
| Concern | Pointer (fine) | Touch (coarse) |
|---------|----------------|----------------|
| Target size | ≥ 24×24px | ≥ 44×44px, 8px between targets |
| Hover | Optional enhancement | Doesn't exist. Never hide actions behind hover |
| Primary nav | Top nav / sidebar | Bottom nav (3–5 items) within thumb reach |
| Dense tables | OK | Switch to stacked cards or allow horizontal scroll inside the table only |

Detect capability with `(hover: hover)` / `(pointer: coarse)`, not with screen width alone.

## Responsive behaviors
- **Navigation**: sidebar → collapsible drawer below `lg`. Top nav → menu button below `md`.
- **Tables**: keep the key column sticky, allow horizontal scroll inside the table container, or switch to card rows below `md`.
- **Forms**: one column on mobile, and at most two columns on desktop, only for related short fields (City / ZIP).
- **Modals**: full-screen sheets on mobile, centered dialogs on desktop.
- **Images**: responsive sources, reserved aspect ratio (no layout shift), lazy-load below the fold.

## Never
- Horizontal page scroll at 320px+.
- Disabled zoom (`user-scalable=no`, `maximum-scale=1`).
- Fixed-px widths on containers that hold text.
- Viewport-height (`100vh`) traps on mobile. Use dynamic viewport units or min-height instead.
- Content hidden on mobile that is required to complete a task.

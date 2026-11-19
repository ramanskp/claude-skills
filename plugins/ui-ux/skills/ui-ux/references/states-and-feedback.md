# States & Feedback

Every piece of UI exists in more than its "happy" state. Design all of them.

## The state set
| State | Rule |
|-------|------|
| **Default** | Realistic content: long strings, missing optional fields, large numbers |
| **Hover** | Pointer devices only. Never the only way to reveal an action |
| **Focus-visible** | Ring at ≥ 3:1 contrast using `color-focus`. Shown for keyboard users |
| **Active / selected** | Distinct from hover. Selected state shown with more than color (weight, check mark, indicator bar) |
| **Disabled** | Explain why (helper text or tooltip on a focusable wrapper). Prefer hiding actions that are impossible, and enabling-then-validating actions that are possible |
| **Loading** | See timing below. Keep layout stable (no shifts) |
| **Empty** | Explain why, and give the next action. See `patterns/data-feedback/empty-states.md` |
| **Error** | Say what happened, why, and how to recover. Keep the user's input |
| **Success** | Confirm briefly, then get out of the way |
| **Partial / offline** | Show what's stale. Queue actions or explain what's unavailable |

## Loading timing
| Expected wait | Feedback |
|---------------|----------|
| < 300ms | None (avoids a flash of loader) |
| 300ms – 2s | Skeleton for content, inline spinner for actions |
| 2s – 10s | Skeleton/progress plus label ("Loading invoices…") |
| > 10s | Determinate progress, the option to continue in the background, and cancel |

- Use optimistic UI for low-risk, high-success actions (like, rename). Roll back with a message on failure.
- Buttons in a pending state keep their width, show a spinner, set `aria-busy="true"`, and block repeat submission.

## Errors
- **Field errors**: inline, below the field, tied with `aria-describedby`, plus `aria-invalid="true"`.
- **Form submit errors**: an error summary at the top listing the problems as links to the fields. Move focus to the summary.
- **System errors**: plain language, no codes as the primary message (put codes in details), a retry action, and a support path.
- **Timing**: validate on blur or on submit, not on every keystroke. Clear the error as soon as the input is valid.
- **Copy formula**: *What happened* + *How to fix*. "Card number is too short. Enter all 16 digits."

## Choosing a feedback channel
| Situation | Channel |
|-----------|---------|
| Action completed, low stakes | Toast (`role="status"`) |
| Action completed with undo | Toast with Undo, no auto-dismiss under 10s, pauses on hover/focus |
| Field-level problem | Inline message |
| Page- or system-wide status | Banner (persistent, dismissible) |
| Destructive or irreversible decision | Confirmation dialog (or better, make it undoable) |
| Blocking failure of the whole view | Full-area error state with retry |

## Microcopy
- Buttons use verb + object: "Create invoice", "Send 3 messages".
- Name the outcome in confirmations: "Delete project 'Atlas'?" not "Are you sure?"
- Avoid blame ("You entered an invalid…"). Describe the requirement instead ("Use at least 8 characters").
- Be consistent with terms. Pick one word ("Remove" or "Delete") and use it everywhere for the same action.

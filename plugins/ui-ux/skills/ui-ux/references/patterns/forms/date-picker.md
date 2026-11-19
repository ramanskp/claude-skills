# Date Picker

> Users need to enter a date or date range quickly and correctly, whether they know it exactly or need to see it in calendar context.

## When to use
- Near-future or recent dates where weekday context matters (bookings, due dates, scheduling).
- Date ranges (check-in/out, report period) where seeing both ends on a calendar prevents mistakes.
- Constrained dates (only weekdays, no past dates) that a calendar can communicate visually.

## When NOT to use
- Well-known dates far from today (date of birth, passport expiry) → three labelled fields (Day / Month / Year) or one text input with format hint; no calendar
- Relative periods ("Last 7 days", "This quarter") → preset options (radio or select) with "Custom range" as fallback
- Time-only input → a time field, not a calendar
- Filtering a list by date → use the date range inside [Filters / faceted search](../forms/filters.md)

## Anatomy
1. **Label** — visible ("Start date"). Required.
2. **Format hint** — "For example, 27/03/2026" or "DD/MM/YYYY", matching locale. Required.
3. **Text input** — accepts typed dates; width ~ 12 characters. Required.
4. **Calendar button** — icon button inside/next to input, accessible name "Choose date", ≥ 24px target (44px on touch).
5. **Calendar popup** — `color-surface-raised`, `shadow-2`, `radius-md`: month/year heading, prev/next month buttons, weekday header, 7-column grid.
6. **Day cell** — today (outline), selected (`color-primary` fill + `color-on-primary`), in-range (tinted), unavailable (muted + strikethrough or pattern).
7. **Presets** — for ranges: "Today", "Last 7 days", "Last 30 days". Optional.
8. **Footer actions** — "Clear" / "Done" for ranges or when selection isn't committed on click. Optional.

## Required states
| State | Behavior / appearance |
|-------|------------------------|
| Default | Input empty with format hint, or shows the formatted value; calendar closed |
| Hover | Day cell background tint; in range mode, hovered end previews the range from the start date |
| Focus-visible | `color-focus` ring on input, button, and the focused day cell (distinct from selected fill) |
| Active / selected | Selected day filled `color-primary`; range start/end filled, days between tinted; `aria-selected="true"` |
| Disabled | Unavailable dates muted and not selectable (`aria-disabled="true"`), still focusable so the grid is navigable; reason given ("Fully booked") |
| Loading | When availability is remote, show skeleton days or "Loading availability…" in the popup; typing stays enabled |
| Empty | No value: calendar opens on today's month (or the min allowed date if later), today outlined |
| Error | Inline error under input: "Enter a date after 1 Jan 2026" / "Enter a real date, like 27/03/2026"; `aria-invalid="true"` |

## Behavior & responsive
- **Typing is always allowed.** The calendar is an aid, never the only input method.
- **Parse leniently:** accept 1/3/26, 01-03-2026, "1 Mar 2026"; reformat to the canonical display on blur. Never silently guess ambiguous day/month — follow the locale and show the parsed result.
- **Validate on blur** (real date, within min/max, range end ≥ start); clear the error as soon as fixed. See [Inline validation](../forms/inline-validation.md).
- **Locale:** first day of week, date order, and month names come from locale; store ISO 8601 (YYYY-MM-DD) internally; be explicit about time zone when date + time matters.
- **Open** on button click (and optionally on input focus for range pickers only); **close** on selection (single date), Escape, or outside click; return focus to the input.
- **Range selection:** first click sets start, second sets end; clicking before start resets start; show nights/days count ("4 nights"). Two months side by side on desktop.
- **Month/year jump:** heading opens a month/year view or select for dates > 12 months away.
- **Min/max:** disable prev/next when beyond limits; never let the calendar open on an all-disabled month.
- **Motion:** popup ≤ `duration-fast` opacity; month change without sliding under `prefers-reduced-motion`.
- **Mobile (< 640px):** prefer the native date input (`type="date"`) when no custom range/availability is needed; otherwise a full-width bottom sheet with one month and vertical scroll, day cells ≥ 44px.

## Accessibility
- **Role / semantics:** text input with visible label and `aria-describedby` → format hint + error. Calendar per WAI-ARIA APG "Date Picker Dialog": button opens a `role="dialog"` with `aria-modal="true"` and `aria-label="Choose date"`; month heading is a live region (`aria-live="polite"`); grid uses `role="grid"` (or a `table`) with column headers for weekdays (abbreviated visually, full name as accessible name).
- **Day cells:** buttons/gridcells with full accessible name ("Friday, 27 March 2026"); today gets `aria-current="date"`; selected `aria-selected="true"`.
- **Keyboard (grid):** Arrows move by day/week; Home/End start/end of week; PageUp/PageDown previous/next month; Shift+PageUp/PageDown previous/next year; Enter/Space selects; Escape closes without changing the value; Tab cycles through dialog controls (prev, next, grid, footer).
- **Focus management:** on open, focus the selected date, else today (or the nearest available date); on close, return focus to the calendar button or input. Roving `tabindex` so the grid is one Tab stop.
- **Announcements:** month change announced via heading live region; selected value announced when focus returns to the input.
- **WCAG 2.2:** 2.5.8 day cells ≥ 24×24px; 1.4.1 today/selected/disabled distinguishable without color; 3.3.7 prefill known dates (e.g. range end defaults relative to start).

## Do & Don't
- ✅ Do: show the expected format as visible hint text and accept many formats.
- ✅ Do: provide presets for common ranges in reporting tools.
- ✅ Do: explain why a date is unavailable.
- ❌ Don't: make the input read-only so users must click through months to reach 1985.
- ❌ Don't: use a placeholder as the only format hint.
- ❌ Don't: auto-correct an impossible date (31 Feb → 3 Mar) without telling the user.

## Anti-patterns
- **Calendar for birthdays** — dozens of clicks to reach the right year.
- **Ambiguous display** (03/04/2026) without locale-appropriate hint — wrong dates booked.
- **Calendar-only input** — fails keyboard, screen-reader, and fast typists.
- **Hover-only range preview** — touch users can't see what they're selecting.
- **Silent time-zone shift** — date changes by a day when saved.

## Related patterns
- [Form layout](../forms/form-layout.md) — date fields in a form
- [Inline validation](../forms/inline-validation.md) — date error timing and copy
- [Filters / faceted search](../forms/filters.md) — date range filters and presets
- [Modal vs. drawer](../data-feedback/modal-vs-drawer.md) — mobile sheet presentation
- [Checkout](../flows/checkout.md) — delivery date selection

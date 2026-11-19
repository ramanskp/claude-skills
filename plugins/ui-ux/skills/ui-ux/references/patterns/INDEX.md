# Pattern Index

Read this file first. Then open **only the 1–3 pattern files** that match the task.
All paths are relative to this folder.

## Navigation & layout
| Problem | Pattern | File |
|---------|---------|------|
| 3–7 top-level sections on a marketing site or simple app | Top navigation | `navigation/top-nav.md` |
| Many sections or deep hierarchy in a productivity app | Sidebar navigation | `navigation/sidebar.md` |
| Switching between peer views of the same object | Tabs | `navigation/tabs.md` |
| Showing where the user is in a deep hierarchy | Breadcrumbs | `navigation/breadcrumbs.md` |
| 3–5 primary destinations on mobile | Bottom navigation | `navigation/bottom-nav.md` |
| Persistent frame (header, nav, content) for an app | App shell | `navigation/app-shell.md` |
| Overview of metrics and widgets | Dashboard grid | `navigation/dashboard-grid.md` |
| Browsing a list and inspecting one item | Master–detail | `navigation/master-detail.md` |

## Input & forms
| Problem | Pattern | File |
|---------|---------|------|
| Collecting structured data in one view | Form layout | `forms/form-layout.md` |
| Telling users about input errors at the right moment | Inline validation | `forms/inline-validation.md` |
| Long or branching input split into steps | Multi-step wizard | `forms/wizard.md` |
| Finding an item by typing | Search with autocomplete | `forms/search-autocomplete.md` |
| Narrowing a large result set | Filters / faceted search | `forms/filters.md` |
| Entering a date or date range | Date picker | `forms/date-picker.md` |
| Attaching files | File upload | `forms/file-upload.md` |

## Data display & feedback
| Problem | Pattern | File |
|---------|---------|------|
| Comparing many records across attributes | Data table | `data-feedback/data-table.md` |
| Browsing visual or heterogeneous items | Cards & lists | `data-feedback/cards-lists.md` |
| Nothing to show yet (first use, no results, cleared) | Empty states | `data-feedback/empty-states.md` |
| Content is loading | Skeleton loading | `data-feedback/skeleton-loading.md` |
| Confirming a completed action without interrupting | Toasts | `data-feedback/toasts.md` |
| Focused sub-task layered over the page | Modal vs. drawer | `data-feedback/modal-vs-drawer.md` |
| Guarding a destructive or irreversible action | Confirmation dialog | `data-feedback/confirm-dialog.md` |

## Flows
| Problem | Pattern | File |
|---------|---------|------|
| First-run experience and activation | Onboarding | `flows/onboarding.md` |
| Sign in, sign up, password reset, MFA | Authentication | `flows/auth.md` |
| Cart → payment → confirmation | Checkout | `flows/checkout.md` |
| User and account preferences | Settings | `flows/settings.md` |

## Visual style presets (token overrides only)
| Intent | Preset | File |
|--------|--------|------|
| Calm, content-first, low chrome | Minimal | `styles/minimal.md` |
| Modular overview, varied tile sizes | Bento | `styles/bento.md` |
| Low-light theme | Dark mode | `styles/dark-mode.md` |

Style presets change token **values** only. They never relax accessibility or state rules.

---

## Choosing between commonly confused patterns

**Modal vs. drawer vs. full page**
- **Modal**: short, blocking decision or input (≤ ~5 fields). The user must finish or cancel before going on.
- **Drawer**: the user needs the page context visible, or is editing or inspecting one item from a list.
- **Full page**: long or complex task, deep-linkable, or something users return to.

**Tabs vs. segmented control vs. sidebar**
- **Segmented control**: 2–4 options that filter or switch the *same* content in place (e.g. Day / Week / Month).
- **Tabs**: 2–7 peer views of one object, each with distinct content.
- **Sidebar**: app-level destinations, more than 7 items, or nested hierarchy.

**Toast vs. inline message vs. banner**
- **Toast**: transient confirmation of a user-initiated action. Never the only place an error appears.
- **Inline message**: an error or hint tied to a specific field or section. Stays until resolved.
- **Banner**: system- or page-wide status (outage, trial ending, unsaved changes). Persistent and dismissible.

**Pagination vs. infinite scroll vs. "Load more"**
- **Pagination**: goal-oriented lookup, users need position or sharable pages, data tables.
- **Load more**: feeds where a footer must stay reachable. Gives the user control.
- **Infinite scroll**: open-ended browsing only (social or media feeds). Preserve scroll position on back.

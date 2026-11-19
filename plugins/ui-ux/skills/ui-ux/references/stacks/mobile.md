# Stack adapter: Native mobile (iOS, Android, React Native, Flutter)

## Platform conventions
| Concern | iOS (HIG) | Android (Material) |
|---------|-----------|--------------------|
| Min target | 44×44pt | 48×48dp |
| Primary nav | Tab bar (bottom, 3–5) | Navigation bar (bottom, 3–5) |
| Back | Edge swipe + top-left back | System back gesture/button |
| Modal | Sheet (detents) | Bottom sheet / full-screen dialog |
| Type scaling | Dynamic Type | Font scale (sp units) |

Follow the platform's conventions over web habits, but keep the team's tokens for color, spacing and voice.

## Accessibility mapping
| Concept | iOS | Android | React Native | Flutter |
|---------|-----|---------|--------------|---------|
| Label | `accessibilityLabel` | `contentDescription` | `accessibilityLabel` | `Semantics(label:)` |
| Role | `accessibilityTraits` | `role` / class | `accessibilityRole` | `Semantics(button: true)` |
| State | `accessibilityValue` / traits | `stateDescription` | `accessibilityState` | `Semantics(checked:)` |
| Announce | `UIAccessibility.post(.announcement)` | `announceForAccessibility` | `AccessibilityInfo.announceForAccessibility` | `SemanticsService.announce` |
| Reduce motion | `isReduceMotionEnabled` | `ANIMATOR_DURATION_SCALE` | `AccessibilityInfo.isReduceMotionEnabled` | `MediaQuery.disableAnimations` |

## Rules
- Support the largest text sizes without truncating critical content. Let layouts wrap or scroll.
- Respect safe areas (notches, home indicator). Keep primary actions in the thumb zone (bottom third).
- Haptics confirm, they don't inform. Always pair them with a visual change.
- Offline: show cached content and mark it stale, queue writes, and show sync state.
- Test with VoiceOver and TalkBack, with large text, and in dark mode.

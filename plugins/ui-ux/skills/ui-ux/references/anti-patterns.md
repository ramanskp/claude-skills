# Visual Anti-patterns ("generic AI UI")

These are the defaults that make an interface look auto-generated and interchangeable.
Check every build against this list before finishing. Each one is usually a *default* that nobody decided on, so make a deliberate choice instead.

## Typography
| Anti-pattern | Why it hurts | Instead |
|--------------|--------------|---------|
| One neutral sans for everything, all weights 400/600 | No voice, flat hierarchy | Pair a characterful display face with a readable text face (max 2 families). Use real contrast between weights |
| Every heading the same size step | The eye has nowhere to land | Use the type scale in `principles.md`, and jump 2 steps for the page title |
| Centered body paragraphs | Hard to read past 2 lines | Left-align text longer than ~2 lines |
| Gradient-filled headline text | Decoration instead of hierarchy, often low contrast | A solid `color-text`. Express emphasis with weight and size |
| ALL-CAPS overlines on every section | Visual noise | Use only where it marks a category, and sparingly |

## Color
| Anti-pattern | Why it hurts | Instead |
|--------------|--------------|---------|
| Purple-to-blue (or indigo) gradient hero by default | The best-known "template" signal | Derive color from the brand and product domain. One accent color is enough |
| Accent color on everything (links, icons, borders, badges) | Nothing stands out | Reserve `color-primary` for the primary action and current state |
| Pure black text on pure white, or pure `#000` dark mode | Harsh and dated | Use the off-black and off-white surfaces from the tokens |
| Gray text on a colored or gray background | Fails contrast | Re-check 4.5:1. Use `color-text-muted` only on neutral surfaces |
| Rainbow status badges without meaning | Color used as decoration | Status colors only for status, always with a label |

## Layout & composition
| Anti-pattern | Why it hurts | Instead |
|--------------|--------------|---------|
| Hero → 3 feature cards → testimonial → CTA, every time | Template look, nothing specific | Start from the content and the primary task. Vary rhythm and density |
| Cards nested inside cards | Box noise, wasted padding | One container level. Group with space and headings |
| A rounded icon tile above every heading | Filler that adds no meaning | An icon only where it aids scanning or recognition |
| Everything centered, everything the same width | No reading path | Use a grid with left alignment, and vary column spans to show priority |
| Uniform `radius-lg` + `shadow-2` on every surface | Soft, generic, no hierarchy | Use elevation only for things that float (menus, dialogs). Keep resting cards flat or bordered |
| Even spacing everywhere | Groups are unclear | Related items closer, sections farther apart (proximity) |

## Content & copy
| Anti-pattern | Why it hurts | Instead |
|--------------|--------------|---------|
| "Unlock the power of…", "Seamless", "Revolutionize" | Empty marketing filler | Say concretely what it does, with real nouns and numbers |
| Lorem ipsum or perfect-length placeholder data | Hides overflow and edge cases | Realistic data: long names, zero items, 4-digit counts |
| Emoji as icons or bullets | Inconsistent rendering, unprofessional tone | A consistent SVG icon set |
| Stock 3D blobs or abstract gradient illustrations | Communicates nothing | Product screenshots, real photos, or no image |

## Motion & interaction
| Anti-pattern | Why it hurts | Instead |
|--------------|--------------|---------|
| Fade-up-on-scroll on every section | Slows reading, feels templated | Animate only the changes the user caused |
| Hover scale or glow on every card | Implies everything is clickable | Hover effects only on interactive elements, and subtle |
| Spinners for content loads | Layout jump, feels slower | Skeletons with the same dimensions as the content |
| Glassmorphism blur over busy backgrounds | Contrast and performance problems | Solid surfaces. Use blur sparingly, with a contrast check |

## Quick self-check (answer before finishing a build)
1. Could this screen belong to any other product? If yes, what makes it *this* product?
2. Is there exactly one obvious primary action?
3. Did I *choose* the font, accent color and radius, or accept the defaults?
4. Does every icon, gradient, shadow and animation have a job?
5. Does it still work with ugly real data?

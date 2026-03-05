# Color Palette & Brand Style

**This is the single source of truth for all colors and brand-specific styles.** To customize diagrams for your own brand, edit this file — everything else in the skill is universal.

---

## Primary Colors

| Name | Hex | Use |
|------|-----|-----|
| Blue 7 | `#0070F2` | Primary accent, interactive elements, CTA |
| White | `#FFFFFF` | Backgrounds, text on dark fills |

---

## Secondary Colors (Category Accents)

| Category | Hex | Use |
|----------|-----|-----|
| Teal 7 | `#049F9A` | Secondary processes, data flows |
| Green 7 | `#30914C` | Success, completion, positive states |
| Mango 7 | `#E76500` | Warnings, attention |
| Red 7 | `#E31C1C` | Errors, critical, negative states |
| Raspberry 7 | `#D81B60` | Highlights, special emphasis |
| Pink 7 | `#FF4081` | Alternative highlights |
| Indigo 7 | `#5B738B` | Neutral emphasis, metadata |
| Grey 7 | `#6B6B6B` | Secondary titles, supporting lines |

---

## Color Scales (Monochromatic Combinations)

Use these fill/stroke combinations. Darker values (10, 11) for strokes, lighter values (2, 4, 6) for fills.

### Blue Scale
| Level | Hex | Use |
|-------|-----|-----|
| Blue 11 | `#002A86` | Darkest stroke |
| Blue 10 | `#0040B0` | Dark stroke |
| Blue 7 | `#0070F2` | Primary accent |
| Blue 6 | `#1B90FF` | Medium fill |
| Blue 4 | `#89D1FF` | Light fill |
| Blue 2 | `#D1EFFF` | Lightest fill, backgrounds |

### Teal Scale
| Level | Hex | Use |
|-------|-----|-----|
| Teal 11 | `#004D4A` | Darkest stroke |
| Teal 10 | `#007370` | Dark stroke |
| Teal 7 | `#049F9A` | Primary teal |
| Teal 6 | `#12B5AE` | Medium fill |
| Teal 4 | `#64E8E0` | Light fill |
| Teal 2 | `#C3F5F2` | Lightest fill |

### Green Scale
| Level | Hex | Use |
|-------|-----|-----|
| Green 11 | `#1A4D2E` | Darkest stroke |
| Green 10 | `#256F3A` | Dark stroke |
| Green 7 | `#30914C` | Primary green |
| Green 6 | `#3CA95E` | Medium fill |
| Green 4 | `#87D9A4` | Light fill |
| Green 2 | `#D4F0DF` | Lightest fill |

### Mango Scale
| Level | Hex | Use |
|-------|-----|-----|
| Mango 11 | `#8A3800` | Darkest stroke |
| Mango 10 | `#B54E00` | Dark stroke |
| Mango 7 | `#E76500` | Primary mango |
| Mango 6 | `#F58B00` | Medium fill |
| Mango 4 | `#FFCC80` | Light fill |
| Mango 2 | `#FFF0D9` | Lightest fill |

### Grey Scale
| Level | Hex | Use |
|-------|-----|-----|
| Grey 11 | `#1D1D1D` | Black, darkest |
| Grey 10 | `#32363A` | Dark text |
| Grey 7 | `#6B6B6B` | Secondary titles, supporting lines |
| Grey 6 | `#8C8C8C` | Muted elements |
| Grey 4 | `#C2C2C2` | Light dividers |
| Grey 2 | `#EDEDED` | Backgrounds |

---

## Recommended Color Combinations

Use stroke + fill pairs from the same color family:

| Combination | Stroke | Fill | Use |
|-------------|--------|------|-----|
| Blue 11+6 | `#002A86` | `#1B90FF` | High contrast primary |
| Blue 10+7 | `#0040B0` | `#0070F2` | Medium contrast primary |
| Blue 7+4 | `#0070F2` | `#89D1FF` | Standard primary |
| Blue 6+4 | `#1B90FF` | `#89D1FF` | Subtle primary |
| Blue 4+2 | `#89D1FF` | `#D1EFFF` | Light background layers |

Apply same pattern to Teal, Green, Mango, Red, Raspberry, Pink, Indigo, Grey.

---

## Shape Colors (Semantic)

| Semantic Purpose | Fill | Stroke |
|------------------|------|--------|
| Primary/Neutral | `#89D1FF` (Blue 4) | `#0070F2` (Blue 7) |
| Secondary | `#64E8E0` (Teal 4) | `#049F9A` (Teal 7) |
| Tertiary | `#D1EFFF` (Blue 2) | `#1B90FF` (Blue 6) |
| Start/Trigger | `#FFCC80` (Mango 4) | `#E76500` (Mango 7) |
| End/Success | `#87D9A4` (Green 4) | `#30914C` (Green 7) |
| Warning/Attention | `#FFF0D9` (Mango 2) | `#E76500` (Mango 7) |
| Error/Critical | `#FFCDD2` | `#E31C1C` (Red 7) |
| Decision | `#FFF0D9` (Mango 2) | `#B54E00` (Mango 10) |
| AI/LLM | `#E8EAF6` | `#5B738B` (Indigo 7) |
| Inactive/Disabled | `#EDEDED` (Grey 2) | `#6B6B6B` (Grey 7) |

---

## Text Colors (Hierarchy)

| Level | Color | Use For |
|-------|-------|---------|
| Title | `#002A86` (Blue 11) | Section headings, major labels |
| Subtitle | `#6B6B6B` (Grey 7) | Secondary titles |
| Body/Detail | `#8C8C8C` (Grey 6) | Descriptions, annotations |
| On light fills | `#32363A` (Grey 10) | Text inside light-colored shapes |
| On dark fills | `#FFFFFF` | Text inside dark-colored shapes |

---

## Default Stroke & Line Colors

| Element | Color |
|---------|-------|
| Solid arrows | `#0070F2` (Blue 7) |
| Dashed arrows | `#6B6B6B` (Grey 7) |
| Supporting/connecting lines | `#6B6B6B` (Grey 7) |
| Structural dividers | `#C2C2C2` (Grey 4) |
| Marker dots | `#0070F2` (Blue 7) fill + stroke |

---

## Background

| Property | Value |
|----------|-------|
| Canvas background | `#FFFFFF` |
| Layer background | `#D1EFFF` (Blue 2) - for grouping areas |

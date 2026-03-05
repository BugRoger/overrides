# Element Templates

Copy-paste JSON templates for each Excalidraw element type. The `strokeColor` and `backgroundColor` values are placeholders — always pull actual colors from `color-palette.md` based on the element's semantic purpose.

---

## Font Strategy

| Font | `fontFamily` | Use |
|------|-------------|-----|
| **Helvetica** (sans-serif) | `2` | Default for all text — titles, labels, descriptions, shape text |
| **Cascadia** (monospace) | `3` | Technical details only — file paths, code, commands, config keys |

**Rule**: Use `fontFamily: 2` unless the text is a file path, code snippet, or technical identifier. When in doubt, use `2`.

---

## Design Specifications

| Property | Value | Use |
|----------|-------|-----|
| Solid Line Width | `2.5` | Direct connections, primary flows |
| Dashed Line Width | `2.5` | Indirect connections, optional flows |
| Dash Array | `[6, 6]` | 6px dash, 6px gap |
| Rounded Corner Radius | `10` | All rounded rectangles |
| Supporting Line Color | Grey 7 (`#6B6B6B`) | Secondary titles, connecting lines |

---

## Free-Floating Text (no container)
```json
{
  "type": "text",
  "id": "label1",
  "x": 100, "y": 100,
  "width": 200, "height": 25,
  "text": "Section Title",
  "originalText": "Section Title",
  "fontSize": 20,
  "fontFamily": 2,
  "textAlign": "left",
  "verticalAlign": "top",
  "strokeColor": "#002A86",
  "backgroundColor": "transparent",
  "fillStyle": "solid",
  "strokeWidth": 1,
  "strokeStyle": "solid",
  "roughness": 0,
  "opacity": 100,
  "angle": 0,
  "seed": 11111,
  "version": 1,
  "versionNonce": 22222,
  "isDeleted": false,
  "groupIds": [],
  "boundElements": null,
  "link": null,
  "locked": false,
  "containerId": null,
  "lineHeight": 1.25
}
```

## Secondary Title Text
```json
{
  "type": "text",
  "id": "subtitle1",
  "x": 100, "y": 130,
  "width": 200, "height": 20,
  "text": "Supporting text",
  "originalText": "Supporting text",
  "fontSize": 14,
  "fontFamily": 2,
  "textAlign": "left",
  "verticalAlign": "top",
  "strokeColor": "#6B6B6B",
  "backgroundColor": "transparent",
  "fillStyle": "solid",
  "strokeWidth": 1,
  "strokeStyle": "solid",
  "roughness": 0,
  "opacity": 100,
  "angle": 0,
  "seed": 11112,
  "version": 1,
  "versionNonce": 22223,
  "isDeleted": false,
  "groupIds": [],
  "boundElements": null,
  "link": null,
  "locked": false,
  "containerId": null,
  "lineHeight": 1.25
}
```

## Technical Detail Text (file paths, code, config)
```json
{
  "type": "text",
  "id": "techLabel1",
  "x": 100, "y": 160,
  "width": 200, "height": 20,
  "text": "state/{phase}/artifact.md",
  "originalText": "state/{phase}/artifact.md",
  "fontSize": 14,
  "fontFamily": 3,
  "textAlign": "left",
  "verticalAlign": "top",
  "strokeColor": "#6B6B6B",
  "backgroundColor": "transparent",
  "fillStyle": "solid",
  "strokeWidth": 1,
  "strokeStyle": "solid",
  "roughness": 0,
  "opacity": 100,
  "angle": 0,
  "seed": 11114,
  "version": 1,
  "versionNonce": 22225,
  "isDeleted": false,
  "groupIds": [],
  "boundElements": null,
  "link": null,
  "locked": false,
  "containerId": null,
  "lineHeight": 1.25
}
```

## Solid Line (direct connection)
```json
{
  "type": "line",
  "id": "line1",
  "x": 100, "y": 100,
  "width": 0, "height": 200,
  "strokeColor": "#0070F2",
  "backgroundColor": "transparent",
  "fillStyle": "solid",
  "strokeWidth": 2.5,
  "strokeStyle": "solid",
  "roughness": 0,
  "opacity": 100,
  "angle": 0,
  "seed": 44444,
  "version": 1,
  "versionNonce": 55555,
  "isDeleted": false,
  "groupIds": [],
  "boundElements": null,
  "link": null,
  "locked": false,
  "points": [[0, 0], [0, 200]]
}
```

## Dashed Line (indirect connection)
```json
{
  "type": "line",
  "id": "line2",
  "x": 100, "y": 100,
  "width": 0, "height": 200,
  "strokeColor": "#6B6B6B",
  "backgroundColor": "transparent",
  "fillStyle": "solid",
  "strokeWidth": 2.5,
  "strokeStyle": "dashed",
  "roughness": 0,
  "opacity": 100,
  "angle": 0,
  "seed": 44445,
  "version": 1,
  "versionNonce": 55556,
  "isDeleted": false,
  "groupIds": [],
  "boundElements": null,
  "link": null,
  "locked": false,
  "points": [[0, 0], [0, 200]]
}
```

## Supporting Line (grey, structural)
```json
{
  "type": "line",
  "id": "supportLine1",
  "x": 100, "y": 100,
  "width": 200, "height": 0,
  "strokeColor": "#6B6B6B",
  "backgroundColor": "transparent",
  "fillStyle": "solid",
  "strokeWidth": 2.5,
  "strokeStyle": "solid",
  "roughness": 0,
  "opacity": 100,
  "angle": 0,
  "seed": 44446,
  "version": 1,
  "versionNonce": 55557,
  "isDeleted": false,
  "groupIds": [],
  "boundElements": null,
  "link": null,
  "locked": false,
  "points": [[0, 0], [200, 0]]
}
```

## Small Marker Dot
```json
{
  "type": "ellipse",
  "id": "dot1",
  "x": 94, "y": 94,
  "width": 12, "height": 12,
  "strokeColor": "#0070F2",
  "backgroundColor": "#0070F2",
  "fillStyle": "solid",
  "strokeWidth": 1,
  "strokeStyle": "solid",
  "roughness": 0,
  "opacity": 100,
  "angle": 0,
  "seed": 66666,
  "version": 1,
  "versionNonce": 77777,
  "isDeleted": false,
  "groupIds": [],
  "boundElements": null,
  "link": null,
  "locked": false
}
```

## Numbered Step Circle
```json
{
  "type": "ellipse",
  "id": "stepCircle1",
  "x": 100, "y": 100,
  "width": 32, "height": 32,
  "strokeColor": "#0070F2",
  "backgroundColor": "#0070F2",
  "fillStyle": "solid",
  "strokeWidth": 2,
  "strokeStyle": "solid",
  "roughness": 0,
  "opacity": 100,
  "angle": 0,
  "seed": 66667,
  "version": 1,
  "versionNonce": 77778,
  "isDeleted": false,
  "groupIds": [],
  "boundElements": [{"id": "stepNum1", "type": "text"}],
  "link": null,
  "locked": false
}
```

## Step Number Text (inside circle)
```json
{
  "type": "text",
  "id": "stepNum1",
  "x": 110, "y": 108,
  "width": 12, "height": 16,
  "text": "1",
  "originalText": "1",
  "fontSize": 14,
  "fontFamily": 2,
  "textAlign": "center",
  "verticalAlign": "middle",
  "strokeColor": "#FFFFFF",
  "backgroundColor": "transparent",
  "fillStyle": "solid",
  "strokeWidth": 1,
  "strokeStyle": "solid",
  "roughness": 0,
  "opacity": 100,
  "angle": 0,
  "seed": 11113,
  "version": 1,
  "versionNonce": 22224,
  "isDeleted": false,
  "groupIds": [],
  "boundElements": null,
  "link": null,
  "locked": false,
  "containerId": "stepCircle1",
  "lineHeight": 1.25
}
```

## Rectangle (rounded corners)
```json
{
  "type": "rectangle",
  "id": "elem1",
  "x": 100, "y": 100, "width": 180, "height": 90,
  "strokeColor": "#0070F2",
  "backgroundColor": "#89D1FF",
  "fillStyle": "solid",
  "strokeWidth": 2.5,
  "strokeStyle": "solid",
  "roughness": 0,
  "opacity": 100,
  "angle": 0,
  "seed": 12345,
  "version": 1,
  "versionNonce": 67890,
  "isDeleted": false,
  "groupIds": [],
  "boundElements": [{"id": "text1", "type": "text"}],
  "link": null,
  "locked": false,
  "roundness": {"type": 3, "value": 10}
}
```

## Text (centered in shape)
```json
{
  "type": "text",
  "id": "text1",
  "x": 130, "y": 132,
  "width": 120, "height": 25,
  "text": "Process",
  "originalText": "Process",
  "fontSize": 16,
  "fontFamily": 2,
  "textAlign": "center",
  "verticalAlign": "middle",
  "strokeColor": "#32363A",
  "backgroundColor": "transparent",
  "fillStyle": "solid",
  "strokeWidth": 1,
  "strokeStyle": "solid",
  "roughness": 0,
  "opacity": 100,
  "angle": 0,
  "seed": 11111,
  "version": 1,
  "versionNonce": 22222,
  "isDeleted": false,
  "groupIds": [],
  "boundElements": null,
  "link": null,
  "locked": false,
  "containerId": "elem1",
  "lineHeight": 1.25
}
```

## Solid Arrow (movement/progression)
```json
{
  "type": "arrow",
  "id": "arrow1",
  "x": 282, "y": 145, "width": 118, "height": 0,
  "strokeColor": "#0070F2",
  "backgroundColor": "transparent",
  "fillStyle": "solid",
  "strokeWidth": 2.5,
  "strokeStyle": "solid",
  "roughness": 0,
  "opacity": 100,
  "angle": 0,
  "seed": 33333,
  "version": 1,
  "versionNonce": 44444,
  "isDeleted": false,
  "groupIds": [],
  "boundElements": null,
  "link": null,
  "locked": false,
  "points": [[0, 0], [118, 0]],
  "startBinding": {"elementId": "elem1", "focus": 0, "gap": 2},
  "endBinding": {"elementId": "elem2", "focus": 0, "gap": 2},
  "startArrowhead": null,
  "endArrowhead": "arrow"
}
```

## Dashed Arrow (indirect/optional flow)
```json
{
  "type": "arrow",
  "id": "arrow2",
  "x": 282, "y": 145, "width": 118, "height": 0,
  "strokeColor": "#6B6B6B",
  "backgroundColor": "transparent",
  "fillStyle": "solid",
  "strokeWidth": 2.5,
  "strokeStyle": "dashed",
  "roughness": 0,
  "opacity": 100,
  "angle": 0,
  "seed": 33334,
  "version": 1,
  "versionNonce": 44445,
  "isDeleted": false,
  "groupIds": [],
  "boundElements": null,
  "link": null,
  "locked": false,
  "points": [[0, 0], [118, 0]],
  "startBinding": null,
  "endBinding": null,
  "startArrowhead": null,
  "endArrowhead": "arrow"
}
```

## Layer Background (grouping area)
```json
{
  "type": "rectangle",
  "id": "layer1",
  "x": 50, "y": 50, "width": 400, "height": 300,
  "strokeColor": "transparent",
  "backgroundColor": "#D1EFFF",
  "fillStyle": "solid",
  "strokeWidth": 0,
  "strokeStyle": "solid",
  "roughness": 0,
  "opacity": 100,
  "angle": 0,
  "seed": 12346,
  "version": 1,
  "versionNonce": 67891,
  "isDeleted": false,
  "groupIds": [],
  "boundElements": null,
  "link": null,
  "locked": false,
  "roundness": {"type": 3, "value": 10}
}
```

---

## Design Rules Summary

1. **Font**: `fontFamily: 2` (Helvetica) for all general text; `fontFamily: 3` (Cascadia) only for file paths, code, commands
2. **Line Width**: Always use `2.5` for lines and arrows
3. **Dashed Style**: Use `strokeStyle: "dashed"` with 6px dash/gap pattern
4. **Rounded Corners**: Use `roundness: {"type": 3, "value": 10}` for 10px radius
5. **Arrows**: Use for movement/progression/flow direction
6. **Grey 7 (`#6B6B6B`)**: Secondary titles and supporting/connecting lines
7. **Blue 7 (`#0070F2`)**: Primary accent, interactive elements
8. **Layer fills**: Use Blue 2 (`#D1EFFF`) for background grouping areas

For curves: use 3+ points in `points` array.

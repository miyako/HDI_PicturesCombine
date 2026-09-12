![version](https://img.shields.io/badge/version-20%2B-E23089)
![platform](https://img.shields.io/static/v1?label=platform&message=mac-intel%20|%20mac-arm%20|%20win-64&color=blue)

# HDI_PicturesCombine

Superimposing one picture over another with an adjustable offset and transparency using the 4D picture operators. Originally published by 4D as a **HDI** (*How Do I*) example for **4D v12**; restored so it runs on current 4D releases.

## What it demonstrates

- Combining two pictures into a third with `COMBINE PICTURES` in `Superimposition` mode.
- Loading images from disk into picture variables with `READ PICTURE FILE`, resolving the platform path of a `File` object under the project `/RESOURCES` folder.
- Driving the composition interactively: two ruler (slider) objects feed a horizontal offset and a vertical value that is inverted (`100-<>SliderV`) to act as a transparency percentage.
- Recomputing the result live -- each ruler's object method re-runs the same `COMBINE PICTURES` call, so the output updates as the user drags.
- Using interprocess variables (`<>Pict1`, `<>Pict2`, `<>Pict3`, `<>SliderH`, `<>SliderV`) to share state between the form and its object methods.

## Key commands

| Command | Used for |
|---|---|
| `COMBINE PICTURES` | Superimpose `<>Pict2` over `<>Pict1` into `<>Pict3` with offset and transparency |
| `READ PICTURE FILE` | Load the background and overlay images from `/RESOURCES/Images/library` |
| `Open form window` | Open the demo dialog window |
| `DIALOG` | Display the `Demo` form |
| `CALL WORKER` | Re-enter `Demo_Start` on a dedicated worker to open the dialog |

## How it works

`Demo_Start` (invoked from the `On Startup` database method) opens the `Demo` form in a dialog. On the first pass it re-enters itself through `CALL WORKER` so the `DIALOG` runs on a worker process.

The form method (`Forms/Demo/method.4dm`) runs on `On Load`: it reads `Caledonie.jpg` into `<>Pict1` and `Flêche.png` into `<>Pict2`, seeds `<>SliderH:=20` and `<>SliderV:=80`, then calls `COMBINE PICTURES(<>Pict3; <>Pict1; Superimposition; <>Pict2; <>SliderH; 100-<>SliderV)`. The two trailing arguments are the overlay's offset and its transparency.

The single most interesting piece is that both ruler object methods (`ObjectMethods/Ruler1.4dm`, `Ruler2.4dm`) contain the *same* `COMBINE PICTURES` line as the form's `On Load`. Moving either slider simply recomputes `<>Pict3` from the current slider values, giving a live preview with no other plumbing.

## Points of interest

- The transparency argument is derived, not raw: the vertical slider value is inverted with `100-<>SliderV`, so a higher slider position yields a more opaque overlay.
- Image paths use `File(...).platformPath`, so the same source resolves correctly on macOS and Windows.
- Resource file names are non-ASCII (`Flêche.png`); the demo relies on the project being stored with a matching filesystem encoding.

## References

- [4D documentation: COMBINE PICTURES](https://developer.4d.com/docs/commands/combine-pictures)
- [4D documentation: READ PICTURE FILE](https://developer.4d.com/docs/commands/read-picture-file)
- Index of v16/v17 HDIs: [miyako/4d-hdi](https://github.com/miyako/4d-hdi)

## Screenshots

<img width="500" height="auto" alt="" src="https://github.com/user-attachments/assets/d5c80f1b-52b2-44bf-8eb1-7ff4e681132d" />

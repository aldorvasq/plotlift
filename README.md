# Plotlift

Extract numbers from images of plots. Plotlift is a browser-based plot digitizer in the spirit of [g3data](https://github.com/pn2200/g3data): open a picture of a graph, tell it where the axes are, click on the data, and export the values as text.

**Use it here: https://aldorvasq.github.io/plotlift/**

It runs entirely in your browser. Nothing is installed, and your images and data never leave your computer.

## Features

- Opens PNG, JPEG, GIF, WebP, BMP and SVG images, pages from PDF files, and pasted screenshots. Several plots can be open at once in tabs.
- Calibrates axes from four reference points (X1, X2 on the X axis, Y1, Y2 on the Y axis). Each axis can be linear or logarithmic. Rotated or skewed scans are handled.
- Magnifier with a live X/Y readout for precise clicking. Optional snapping to marker centres, crosshair guides, and a calibrated grid overlay to check the calibration against the plot's own gridlines.
- Several data series per plot, each with its own colour. Points can be dragged, nudged with the arrow keys, deleted, undone and redone.
- Exports points in click order or sorted by X or Y, as space-, tab- or comma-separated text, with optional error columns (dx, dy). Copy to the clipboard or save as .txt or .csv.
- Saves and reopens whole projects (images, axes and points) as a single .json file.

## How to use it

1. **Upload a plot.** Plotlift opens on an upload screen: drop an image or PDF onto it, click **Choose a file…**, or paste a screenshot. To see a finished example first, click **Open the sample plot**.
2. **Calibrate.** Follow the prompts: click a known point on the X axis and type its value, then a second one, then two on the Y axis. Choose Linear or Log for each axis.
3. **Mark points.** Click on the data. Use the magnifier on the right for precision, and drag points to adjust them.
4. **Export.** Pick the order, separator and columns, then copy or save.

Press **?** inside the app for the full list of mouse and keyboard shortcuts.

## Running it locally

Download [`Plotlift.html`](Plotlift.html) and open it in any modern browser (Chrome, Edge, Firefox or Safari from 2023 or later) on Windows, macOS or Linux. It works offline, except that opening a PDF needs an internet connection the first time, to load [pdf.js](https://mozilla.github.io/pdf.js/).

## Making changes

The app is a single file of HTML, CSS and plain JavaScript with no frameworks or build tools.

- Edit `src/plotlift.html`.
- Run `./build.sh`. It wraps the source into the standalone pages `index.html` (served by GitHub Pages) and `Plotlift.html` (for downloading).
- Open `Plotlift.html` in a browser to check your change, then commit and push. The website updates within a minute or two.

The `test/` folder holds plots generated with matplotlib whose true values are recorded in `test/fixtures.json`, for checking that extracted values are accurate.

## How the numbers are computed

The X value of a point is read along the line from X1 to X2, and the Y value along the line from Y1 to Y2, so the axes need not be level or perpendicular. On a log axis the interpolation runs in log₁₀ space. The optional dx and dy columns propagate a click uncertainty (half an image pixel by default) through the calibration.

## License

[MIT](LICENSE) © 2026 Aldo Vasquez-Briceno

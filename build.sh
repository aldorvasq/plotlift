#!/bin/sh
# Wraps the source page (src/plotlift.html, written without a document skeleton)
# into a standalone page. index.html is what GitHub Pages serves;
# Plotlift.html is the same file under a friendlier name for downloading.
set -e
cd "$(dirname "$0")"
{
  printf '<!doctype html>\n<html lang="en">\n<head>\n<meta charset="utf-8">\n<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">\n</head>\n<body>\n'
  cat src/plotlift.html
  printf '\n</body>\n</html>\n'
} > index.html
cp index.html Plotlift.html
echo "built index.html and Plotlift.html ($(wc -c < index.html | tr -d ' ') bytes)"

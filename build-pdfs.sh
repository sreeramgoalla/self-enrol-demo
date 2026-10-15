#!/bin/sh
# Regenerates the "Download PDF" file for each showcase page using headless Google Chrome.
# Run from the repo root after editing a page:  sh build-pdfs.sh
set -e
CHROME="${CHROME:-/Applications/Google Chrome.app/Contents/MacOS/Google Chrome}"
cd "$(dirname "$0")"
pdf() { # $1 = page folder, $2 = pdf file name
  "$CHROME" --headless=new --disable-gpu --no-pdf-header-footer --virtual-time-budget=10000 \
    --print-to-pdf="$1/$2" "file://$PWD/$1/index.html" 2>/dev/null
  echo "built $1/$2"
}
pdf . Sreeram-Goalla-Self-Enrolment-Demo.pdf

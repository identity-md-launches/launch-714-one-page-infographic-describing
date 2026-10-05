#!/usr/bin/env bash
# Render infographic/pool4.html to artifacts/image.png (2400x3600, 2x of the 1200x1800 layout).
set -euo pipefail
cd "$(dirname "$0")/.."
mkdir -p artifacts
CHROME="${CHROME:-google-chrome}"
"$CHROME" --headless=new --no-sandbox --disable-gpu --hide-scrollbars \
  --force-device-scale-factor=2 --window-size=1200,1800 \
  --screenshot="$PWD/artifacts/image.png" "file://$PWD/infographic/pool4.html"

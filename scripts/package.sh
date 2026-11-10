#!/usr/bin/env bash
# Builds one zip per skill in dist/ for uploading to Claude.ai.
set -euo pipefail
mkdir -p dist
for d in skills/*/; do
  n=$(basename "$d")
  (cd skills && zip -qr "../dist/$n.zip" "$n")
  echo "dist/$n.zip"
done

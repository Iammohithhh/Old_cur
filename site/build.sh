#!/usr/bin/env bash
# Builds the site. Quartz isn't stored in this repo: this script downloads the pinned
# version into .quartz-engine/ (git-ignored), adds our settings, and builds content/ into public/.
#   site/build.sh            build once
#   site/build.sh --serve    build and preview at http://localhost:8080
set -euo pipefail

QUARTZ_VERSION=2386362d5716503007c1fec1ea362204ee711f13   # Quartz v5; change this line to upgrade
EXTRA_PLUGINS="@quartz-community/obsidian-plugin-excalidraw@^1.1.1"

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
ENGINE="$ROOT/.quartz-engine"

if [ "$(git -C "$ENGINE" rev-parse HEAD 2>/dev/null || true)" != "$QUARTZ_VERSION" ]; then
  echo "Downloading Quartz $QUARTZ_VERSION ..."
  rm -rf "$ENGINE"
  git init --quiet "$ENGINE"
  git -C "$ENGINE" fetch --quiet --depth 1 https://github.com/jackyzha0/quartz.git "$QUARTZ_VERSION"
  git -C "$ENGINE" checkout --quiet FETCH_HEAD
  (cd "$ENGINE" && npm ci --no-audit --no-fund && npm install --no-save --no-audit --no-fund $EXTRA_PLUGINS)
fi

cp "$ROOT/site/quartz.config.yaml" "$ENGINE/quartz.config.yaml"
cd "$ENGINE"
npx quartz build --directory "$ROOT/content" --output "$ROOT/public" "$@"

#!/usr/bin/env bash
# Launch jupyter lab on a throwaway copy of the notebooks.
# Edits in the browser never touch the originals. Scratch dir wiped on exit.
set -e

SRC="$(dirname "$(realpath "$0")")"
SCRATCH="${XDG_RUNTIME_DIR:-/tmp}/ijava-scratch-$$"

mkdir -p "$SCRATCH"
cp "$SRC"/*.ipynb "$SCRATCH"/
trap 'rm -rf "$SCRATCH"' EXIT

echo "Scratch: $SCRATCH"
cd "$SCRATCH"
uv run --project "$SRC" jupyter lab

#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TMP_DIR="$ROOT_DIR/.flutter-tmp"

mkdir -p "$TMP_DIR"

cd "$ROOT_DIR"

TMPDIR="$TMP_DIR" LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8 flutter run -d macos

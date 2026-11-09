#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
export CARGO_BUILD_JOBS="${CARGO_BUILD_JOBS:-2}"
cd "$ROOT/vello_gpu/examples/wgpu_webgl"
wasm-pack test --headless --chrome

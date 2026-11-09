#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
export CARGO_BUILD_JOBS="${CARGO_BUILD_JOBS:-2}"
cd "$ROOT"
rustup target add wasm32-unknown-unknown
cargo run_wasm -p wgpu_webgl --release --locked --build-only
test -s "$ROOT/target/wasm-examples/wgpu_webgl/index.html"
test -s "$ROOT/target/wasm-examples/wgpu_webgl/wgpu_webgl_bg.wasm"

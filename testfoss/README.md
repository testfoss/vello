# Testfoss Vello WebGL2 demo

This additive check builds and tests upstream's official `wgpu_webgl` example, then drives its WebGL2 scene controls in Chromium. It does not use or claim WebGPU support. Headless Chromium uses ANGLE SwiftShader for the WebGL2 browser check; this is software-rendered WebGL2, not WebGPU on SwiftShader.

Prerequisites are Bash, Rust with `rustup`, `wasm-pack` 0.15.1, Chrome and ChromeDriver for the official Wasm test, Python 3, and Node.js 24. Then run:

```sh
npm install -g @lmctl-ai/lmctl@0.2.469
npm ci --prefix testfoss
testfoss/node_modules/.bin/playwright install chromium
./testfoss/build.sh
./testfoss/test.sh
./testfoss/browser.sh
```

`build.sh` runs `cargo run_wasm -p wgpu_webgl --release --locked --build-only`. `test.sh` runs upstream's `wasm-pack test --headless --chrome`, including its blue-triangle render test. `browser.sh` serves only the generated official demo on loopback and uses `lmwebtest playwright` to verify the WebGL2 context, canvas, Next scene button, ArrowRight navigation, scene status, console backend evidence, and clean page/network logs. Evidence is written under `testfoss/results/`.

The workflow at `.github/workflows/testfoss.yml` runs all three steps. Generated Wasm, Cargo output, dependencies, and browser results are not committed.

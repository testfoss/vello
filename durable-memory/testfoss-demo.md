# Testfoss demo provenance

- Source: upstream `linebender/vello` commit `7dbfb199c8eed178360f2bb58bf2cebd5d17a9e7`.
- Prior evidence: the isolated source-build lab recorded successful WebGL2 compilation, the official triangle test, and Playwright scene-navigation checks at the same source pin.
- Lab-proven build: `cargo run_wasm -p wgpu_webgl --release --locked --build-only`. Lab-proven official test: `wasm-pack test --headless --chrome` from `vello_gpu/examples/wgpu_webgl/`, passing `wasm::test_renders_triangle`.
- Browser coverage: the official `wgpu_webgl` demo, WebGL2 context and canvas, Next scene and ArrowRight navigation through page 3 of 22, scene status, WebGL 2.0 console evidence, and empty page-error/failed-request logs. Chromium runs through `.lms` and `lmwebtest playwright` with ANGLE SwiftShader enabled for software WebGL2.

Commands are in `testfoss/README.md`. The browser script uses port 8106 by default; set `TESTFOSS_PORT` and, if necessary, `TESTFOSS_URL` to override it. A favicon 404 from the official generated page is the only tolerated HTTP error. The lab's WebGPU attempts failed during rendering even with explicit Vulkan/SwiftShader flags; no WebGPU result is claimed here, and this content does not exercise `wgpu_webgpu`. GPU timing extension availability and software-rendering performance are environment-dependent and are not pass/fail criteria. The additive lmwebtest WebGL2 scenario passed against the previously built demo. Heavy Rust/Wasm builds and the official headless Chrome test were not repeated while adding this fork content.

## Remote verification

GitHub Actions run 42643974984 passed the clean WebGL2 build, official headless Chrome triangle test, and WebGL2 scene-navigation lmwebtest scenario.

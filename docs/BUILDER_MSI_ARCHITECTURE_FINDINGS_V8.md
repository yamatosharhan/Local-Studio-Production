# Builder Desktop MSI — Architecture Findings for Local Studio 8.0.0

The supplied Windows MSI was inspected as a binary artifact and used only as an architectural reference. No proprietary Builder source, branding, or packaged assets are copied into Local Studio.

## Observed desktop architecture

The installer identifies a WiX Toolset 4 MSI for Builder.io Desktop 0.6.0 and bundles an Electron/Chromium runtime plus an app.asar. The packaged application exposes a main process, IPC handler, preload/webview-preload layers, browser/tab surfaces, a local proxy, process tracking, updater handlers, and Chrome extension/native-messaging bridge modules.

## Architectural implications

1. Desktop shell is an orchestration layer, not only a window.
2. Preview is a managed runtime with process identity, ports, logs, readiness and cleanup.
3. Browser integration requires a stable node identity/runtime bridge.
4. IPC must expose narrow capabilities rather than arbitrary shell execution.
5. Network policy is explicit; dependency bootstrap is separate from normal preview runtime.
6. Lifecycle cleanup is mandatory on desktop close and runtime stop.

The Builder analysis is an independent engineering study and does not reproduce proprietary source code or private credentials.

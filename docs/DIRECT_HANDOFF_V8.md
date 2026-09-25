# Local Studio 8.0.0 — Direct Handoff

Use the repository as the implementation source of truth. Do not reintroduce floating dependencies, skipped quality gates, unrestricted preview networking, or success claims without evidence.

Autonomous path: checkpoint → visual baseline → agent build → strict quality gate → bounded repair → retest → pass or rollback.

Desktop target: Tauri supervisor + Python API sidecar on `127.0.0.1:4173`; preview runtime is separately managed.

V8 hardening:
- visual operations, undo and redo synchronize managed design state into React source;
- missing/blocked/skipped quality checks cannot pass;
- design-system compliance is an explicit production contract;
- Docker preview networking is internal/no-egress by default;
- ResourceGovernor enforces dynamic concurrency admission;
- Tauri sidecar uses a real Uvicorn launcher;
- CI validates backend, frontend, browser, Docker and Windows packaging paths.

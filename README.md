# Local Studio Production

Local-first AI application engineering studio. **v8.0.0 Production Candidate**.

## Included
- Visual Editor 2.0: visual design operations with source synchronization and undo/redo.
- Autonomous Agent: plan → execute → validate → diagnose → repair → retest with checkpoints.
- Project/design/AST/component/route/dependency intelligence.
- Resource Governor with CPU/RAM/VRAM-aware routing and concurrency controls.
- Docker-first runtime sandbox and production Quality Gate.
- Browser validation, Ollama adapter, MCP governance, Git/PR adapters.
- Arabic/RTL, recovery/snapshots, collaboration foundation, Tauri desktop packaging.
- React/Vite, Next.js, Vue/Vite, Svelte/Vite and Flutter adapters.

## Verification
Core verification: **37/37 backend tests passed**.

The release is intentionally marked **Production Candidate**, not Final: target-host gates still require Node dependencies, Docker Engine, Chromium/Playwright, Ollama and Windows/Rust for the MSI build. See `verification-report-v8-final.json` and `docs/PRODUCTION_READINESS.md`.

## Run
### Windows
```powershell
.\\scripts\\install.ps1
.\\scripts\\launch-production.ps1
```
### Linux/macOS
```bash
./scripts/install.sh
./scripts/launch-production.sh
```
### Development
```bash
python -m pip install -r backend/requirements.txt
uvicorn app.main:app --host 127.0.0.1 --port 4173
cd web && npm install && npm run build
```

## Release verification
```bash
python scripts/verify_release.py
```

## Documentation
- `docs/ARCHITECTURE.md` — system architecture
- `docs/DIRECT_HANDOFF_V8.md` — implementation handoff
- `docs/ENGINE_SPEC.md` — engine contracts
- `docs/FEATURE_MATRIX_V8.md` — feature matrix
- `docs/PRODUCTION_READINESS.md` — release gates
- `docs/SECURITY_MODEL.md` — security model
- `docs/BUILDER_MSI_ARCHITECTURE_FINDINGS_V8.md` — Builder Desktop MSI analysis

## Builder analysis
The Builder analysis is an independent engineering study of observable application architecture and behavior. It does **not** contain proprietary Builder source code, private credentials, or copied proprietary implementation.

## Security
Never commit secrets, tokens, credentials, private keys or real project data. Use `.env` only locally and the documented vault/security mechanisms.

## License
No open-source license has been assigned yet; default copyright applies until one is added.

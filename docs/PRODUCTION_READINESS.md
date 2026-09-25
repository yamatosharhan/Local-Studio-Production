# Production Readiness Checklist

## Source bundle
- Version: `8.0.0-production`
- Main API: FastAPI
- UI: React + Vite + Monaco
- Collaboration: Yjs + Hocuspocus
- AI: Ollama adapter + model router
- Runtime: Docker-first

## Required before final deployment
1. Install frontend dependencies from the pinned source environment.
2. Run the full frontend build and unit suite.
3. Install and validate Playwright Chromium.
4. Run browser E2E against a fresh project.
5. Run Docker runtime isolation tests.
6. Configure production local-auth token.
7. Configure Vault key management and backup policy.
8. Configure GitHub/GitLab/Figma credentials through Vault.
9. Configure collaboration authentication.
10. Configure signed Tauri updater metadata and code signing.
11. Run the complete quality matrix in CI.

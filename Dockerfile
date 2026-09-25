FROM node:22-bookworm-slim AS node-runtime
FROM python:3.13-slim
ENV PYTHONDONTWRITEBYTECODE=1 PYTHONUNBUFFERED=1 NODE_ENV=production
WORKDIR /app
COPY --from=node-runtime /usr/local/bin/node /usr/local/bin/node
COPY --from=node-runtime /usr/local/bin/npm /usr/local/bin/npm
COPY --from=node-runtime /usr/local/bin/npx /usr/local/bin/npx
COPY --from=node-runtime /usr/local/lib/node_modules /usr/local/lib/node_modules
ENV PATH=/usr/local/bin:$PATH
RUN apt-get update && apt-get install -y --no-install-recommends git ca-certificates && rm -rf /var/lib/apt/lists/*
COPY backend/requirements.txt /app/backend/requirements.txt
RUN pip install --no-cache-dir -r /app/backend/requirements.txt
COPY web/package.json /tmp/web/package.json
RUN cd /tmp/web && npm install --no-audit --no-fund
COPY backend /app/backend
COPY web /app/web
RUN rm -rf /app/web/node_modules && cp -a /tmp/web/node_modules /app/web/node_modules && cd /app/web && npm run build
COPY reference /app/reference
COPY scripts /app/scripts
COPY local-studio.manifest.json /app/
RUN mkdir -p /app/storage/projects /app/storage/backups
EXPOSE 4173
CMD ["python","-m","uvicorn","backend.app.main:app","--host","0.0.0.0","--port","4173"]

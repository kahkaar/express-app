FROM node:24-bookworm-slim AS deps

WORKDIR /usr/src/app

COPY package.json package-lock.json ./
RUN npm ci --omit=dev --no-audit --no-fund


FROM gcr.io/distroless/nodejs24-debian12:nonroot AS runtime

ENV NODE_ENV=production
WORKDIR /usr/src/app

COPY --from=deps /usr/src/app/node_modules ./node_modules
COPY --chown=65532:65532 package.json ./
COPY --chown=65532:65532 index.js ./

EXPOSE 8080
CMD ["index.js"]

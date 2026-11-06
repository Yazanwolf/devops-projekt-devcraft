
# Stage 1: Dependencies
FROM node:24-alpine3.24 AS dependencies

WORKDIR /app

COPY package*.json ./
RUN npm ci

# Stage 2: Prisma Client generieren
FROM dependencies AS builder

COPY . .

RUN npx prisma generate

# Stage 3: Production Image
FROM node:24-alpine3.24 AS production

WORKDIR /app

ENV NODE_ENV=production

COPY package*.json ./
RUN npm ci --omit=dev

COPY --from=builder /app/node_modules/.prisma ./node_modules/.prisma
COPY --from=builder /app/node_modules/@prisma ./node_modules/@prisma

COPY --from=builder /app/server.js ./server.js
COPY --from=builder /app/prisma ./prisma

EXPOSE 3000

CMD ["sh", "-c", "npx prisma migrate deploy && node server.js"]
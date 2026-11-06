# Stage 1: Dependencies
FROM node:24-alpine3.24 AS builder

WORKDIR /app

COPY package*.json ./
COPY prisma ./prisma
RUN npm ci

# Stage 2: Build
FROM node:24-alpine3.24

WORKDIR /app

COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/prisma ./prisma
COPY . .
EXPOSE 3000

CMD ["sh", "-c", "npx prisma migrate deploy && node server.js"]
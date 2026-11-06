
# Stage 1: Dependencies
FROM node:24-alpine3.24 AS builder

WORKDIR /app

COPY package*.json ./
RUN npm ci

# Stage 2: Prisma Client generieren

COPY . .

RUN npx prisma generate

# Stage 3: Production Image
FROM node:24-alpine3.24 AS production

WORKDIR /app

COPY --from=builder /app/node_modules ./node_modules
COPY . .
RUN npx prisma generate
EXPOSE 3000

CMD ["node", "server.js"]
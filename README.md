# Notes API – Starter Code

Eine einfache REST API für Notizen. Dieser Starter-Code ist die Basis für das DevOps-Projekt "From Code to Production".

## Quick Start mit Docker

```bash
cp .env.example .env
docker compose up --build
```

Compose wartet, bis PostgreSQL bereit ist, wendet die versionierten Prisma-Migrationen an und startet danach die API auf http://localhost:3000.

Zum Stoppen:

```bash
docker compose down
```

Die Datenbank wird im benannten Volume `postgres-data` gespeichert und bleibt beim Stoppen erhalten.

## Endpoints

| Method | Endpoint | Beschreibung |
|--------|----------|-------------|
| GET | /health | Health Check |
| GET | /notes | Alle Notizen auflisten |
| POST | /notes | Neue Notiz erstellen |
| GET | /notes/:id | Einzelne Notiz abrufen |
| PATCH | /notes/:id | Notiz aktualisieren |
| DELETE | /notes/:id | Notiz löschen |

## Tests

```bash
npm test
```

## Tech Stack

- **Runtime:** Node.js
- **Framework:** Express
- **ORM:** Prisma
- **Datenbank:** PostgreSQL
- **Tests:** Jest + Supertest

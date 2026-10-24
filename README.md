# Notes API – Starter Code

Eine einfache REST API für Notizen. Dieser Starter-Code ist die Basis für das DevOps-Projekt "From Code to Production".

## Quick Start mit Docker

Migration Ordner unter Prisma löschen, falls vorhanden.
Folgenden Befehl darunter ausführen, um die Volumes und gespeicherten Daten im Container zu entfernen.

```bash
docker compose down -v
```

.env erstellen:
DB_URL="postgresql://{DB_USER}:{DB_PASSWORD}@localhost:5432/notes"
DB_USER={username}
DB_PASSWORD={password}

```bash
docker compose up -d
npx prisma migrate dev --name init
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

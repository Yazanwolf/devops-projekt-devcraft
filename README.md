# Notes API – Starter Code

Eine einfache REST API für Notizen. Dieser Starter-Code ist die Basis für das DevOps-Projekt "From Code to Production".

## Architektur

**Docker (lokales Docker-Setup):**

- Express App + PostgreSQL via Docker Compose
- docker compose up startet alles

**Production (Hetzner VPS):**

- Docker Compose auf dem Server
- Images werden von ghcr.io gepullt
- Uptime Kuma überwacht den Health Check
- Automatisches Deployment via GitHub Actions

## Local Setup

**Installation needed:**
git
docker
npm

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

Compose wartet, bis PostgreSQL bereit ist, wendet die versionierten Prisma-Migrationen an und startet danach die API auf <http://localhost:3000>.

Zum Stoppen:

```bash
docker compose down
```

Die Datenbank wird im benannten Volume `postgres-data` gespeichert und bleibt beim Stoppen erhalten.

## Local Start

git clone <repo-url>
cd notes-api
npm i
docker compose up
npm start

## Deployment

ssh user@server-ip
**or**
ssh -i /path/to/private_key -o IdentitiesOnly=yes root@server-ip
cd /app
docker compose pull
docker compose up -d

## Monitoring

- **Health Check:** http://<server-ip>:3000/health
- **Uptime Kuma Dashboard:** http://<server-ip>:3001
- **Logs:** docker compose logs -f app

## Troublesshooting

**Kuma**

- bei Versions Problemen in der Docker-Compose.yml auf dem Server die Version bei :2 am Ende anpassen, z.b. in :3
- bei SSH Key Fehlern, neuen erstellen und verbinden
- **ACHTUNG KUMA UPTIME** Nutzername und Passwort für alle Berücksichtigen, es kann nur ein USER + PW angelegt werden


**Allgmein**

- bei Startproblemen die Variablen der .env Files prüfen
- bei Datenbankfehlern "docker compose ps"


## Endpoints

| Method | Endpoint | Beschreibung |
| -------- | ---------- | ------------- |
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
- **CI/CI:** GitHub Actions
- **Infrastructure:** Hetzner VPS, Terraform
- **Container Registry:** GitHub Container Registry ghcr.io
- **Monitoring:** Uptime Kuma

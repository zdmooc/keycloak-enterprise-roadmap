# Lab 01 — Démarrage rapide Docker Compose (Keycloak + PostgreSQL)

Objectif : lancer Keycloak localement, créer realm/client/user, tester login.

## Prérequis
- Docker Desktop
- curl

## Démarrage
```bash
docker compose up -d
docker compose logs -f keycloak
```

## Accès
- Keycloak : http://localhost:8080
- Admin : user/pass définis dans `docker-compose.yml`

## Tests rapides
- Créer realm `demo`
- Créer user `alice`
- Créer client `demo-app` (OIDC)
- Tester login via “Account Console” ou un client OIDC

## Nettoyage
```bash
docker compose down -v
```

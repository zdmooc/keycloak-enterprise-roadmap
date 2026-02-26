# Hostname & reverse proxy (point critique en prod)

Keycloak **impose** un hostname configuré (sécurité).  
Réf : https://www.keycloak.org/server/hostname

## Règles pratiques
- Toujours définir `hostname` (et `hostname-admin` si admin séparé)
- Configurer correctement les headers proxy (X-Forwarded / Forwarded)
- Ne pas exposer le port management 9000 via le proxy (health/metrics)
Réf : https://www.keycloak.org/server/reverseproxy

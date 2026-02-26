# Troubleshooting (runbook)

## Symptômes fréquents → causes probables

### 302 loop / redirections infinies
- Hostname/proxy mal configuré
- TLS/strict-https incohérent
- Cookies/sameSite/path en conflit (reverse proxy)

Actions :
- vérifier `hostname`, `proxy-headers`
- vérifier redirect URIs côté client
- vérifier date/clock skew

Docs :
- https://www.keycloak.org/server/hostname
- https://www.keycloak.org/server/reverseproxy

### 401/403 sur l’application après login
- Rôles/groupes non présents dans le token (mapper manquant)
- application attend un claim différent

Actions :
- inspecter token (JWT)
- ajouter mapper `groups` / roles par client
- aligner “role mapping” côté appli

### Latence / timeouts
- DB saturée (pool, CPU, locks)
- threads en attente
- cache/mémoire (GC, OOM)

Actions :
- regarder métriques Keycloak (pool DB, threads, erreurs)
- vérifier métriques DB
- ajuster pool DB (avec prudence)

Docs :
- https://www.keycloak.org/observability/metrics-for-troubleshooting
- https://www.keycloak.org/observability/metrics-for-troubleshooting-database

### Health/metrics non accessibles
- Management port 9000 non exposé en interne (Service manquant)
- tentative d’accès via ingress (à éviter)

Docs :
- https://www.keycloak.org/server/management-interface
- https://www.keycloak.org/server/reverseproxy

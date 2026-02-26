# Health checks & métriques

## Management port (9000)
Les endpoints `/health` et `/metrics` sont exposés sur le port management `9000` par défaut.  
Réfs :
- https://www.keycloak.org/server/management-interface
- https://www.keycloak.org/observability/health
- https://www.keycloak.org/observability/configuration-metrics

## Exploitation
- Liveness/Readiness sur `/health`
- Scrape Prometheus sur `/metrics` (port 9000)
- Dashboards : latence, erreurs, DB pool, threads, caches

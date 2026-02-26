# Lab 04 — Observabilité : health + metrics

Objectif : activer `/health` et `/metrics` sur port management 9000, et les collecter.

Réfs :
- https://www.keycloak.org/observability/health
- https://www.keycloak.org/observability/configuration-metrics
- https://www.keycloak.org/server/management-interface

## Kubernetes
- Créer Service séparé sur le port 9000 (ClusterIP)
- Prometheus scrape (ServiceMonitor si Operator Prometheus)
- Alertes : 5xx, saturations pool DB, latences token, restarts

Voir `manifests/observability/`.

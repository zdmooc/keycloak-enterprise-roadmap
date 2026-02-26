# Lab 02 — Déploiement via Operator (Kubernetes/OpenShift)

Objectif : déployer Keycloak en cluster avec DB externe et ressources.

- Manifests exemples : `manifests/operator/` et `manifests/keycloak/`
- Docs Operator : https://www.keycloak.org/operator/installation

## Étapes (résumé)
1. Installer l’Operator (OLM sur OpenShift, ou manifests sur Kubernetes)
2. Créer Secret DB + CR Keycloak
3. Vérifier pods, services, logs
4. Exposer via Ingress/Route (TLS)
5. Activer health/metrics (port 9000) et brancher Prometheus

> Adapter aux standards de ton cluster (namespaces, RBAC, network policies).

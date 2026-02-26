# Keycloak Enterprise Roadmap (débutant → expert)

Ce dépôt est un guide structuré et opérationnel pour :
- apprendre Keycloak (IAM/SSO) **de zéro à niveau expert**,
- comprendre l’**architecture interne** (Quarkus, caches Infinispan, sessions, SPI),
- cartographier les **dépôts GitHub Keycloak** et leurs rôles,
- déployer Keycloak en **production entreprise** : **HA multi-AZ** et **PRA multi-site**.

> Date de génération : 2026-02-26  
> Cible : cloud + Kubernetes/OpenShift (Operator), PostgreSQL, observabilité, GitOps

---

## Utilisation rapide

1. Suivre le parcours : [`docs/learning-path.md`](docs/learning-path.md)
2. Faire les labs : [`labs/`](labs/)
3. Lire les architectures de référence :
   - Multi-AZ : [`docs/06-reference-architectures/enterprise-multi-az.md`](docs/06-reference-architectures/enterprise-multi-az.md)
   - PRA multi-site : [`docs/06-reference-architectures/enterprise-multi-site-pra.md`](docs/06-reference-architectures/enterprise-multi-site-pra.md)
   - Checklist exploitable : [`docs/06-reference-architectures/checklists.md`](docs/06-reference-architectures/checklists.md)

---

## Structure

- `docs/` : cours & références (débutant → expert)
- `labs/` : exercices (Docker Compose, Operator K8s/OpenShift, realms “as code”, observabilité)
- `manifests/` : exemples de manifests Kubernetes/OpenShift (Operator, Keycloak CR, secrets, ServiceMonitor)
- `tools/` : scripts utilitaires (export/import realm, bootstrap admin, tests)
- `evidence/` : dossier pour déposer les preuves de tests (outputs, captures, métriques)

---

## Références officielles (lecture utile)
Ce dépôt s’appuie principalement sur la documentation officielle Keycloak :
- Operator : https://www.keycloak.org/operator/installation
- Caching/Infinispan : https://www.keycloak.org/server/caching
- Hostname & reverse proxy : https://www.keycloak.org/server/hostname , https://www.keycloak.org/server/reverseproxy
- Sessions (Keycloak 26) : https://www.keycloak.org/2024/12/storing-sessions-in-kc26
- Management interface (port 9000) : https://www.keycloak.org/server/management-interface
- Health checks : https://www.keycloak.org/observability/health
- Metrics : https://www.keycloak.org/observability/configuration-metrics
- Production guide : https://www.keycloak.org/server/configuration-production
- Benchmark (latence multi-AZ vs multi-région) : https://www.keycloak.org/2025/10/keycloak-benchmark

---

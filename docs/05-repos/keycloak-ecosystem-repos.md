# Écosystème Keycloak : dépôts GitHub et rôles

## 1) Serveur Keycloak (principal)
- Repo : https://github.com/keycloak/keycloak
- Contient : serveur Quarkus, providers, docs, tests, et aussi le code de l’Operator (module `operator/`).

## 2) Operator (Quarkus distribution)
- Code dans le repo principal :
  - https://github.com/keycloak/keycloak/tree/main/operator
- Doc Operator :
  - https://www.keycloak.org/operator/installation

## 3) Quickstarts (exemples)
- Repo : https://github.com/keycloak/keycloak-quickstarts
- Contient : exemples d’intégration et manifests (Kubernetes, apps).

## 4) Realm Operator (gestion realms as-code)
- Repo : https://github.com/keycloak/keycloak-realm-operator
- Objectif : gérer realms et sous-ressources (pas le déploiement serveur).

## 5) Ancien Operator (WildFly) — archivé
- Repo : https://github.com/keycloak/keycloak-operator
- Note : archivé, concerne l’ancienne distribution WildFly.

## 6) JS adapter (front)
- Repo : https://github.com/keycloak/keycloak-js

## 7) Community (proposals)
- Repo : https://github.com/keycloak/keycloak-community

## 8) Client libraries (Admin / Authz / Policy Enforcer)
- Points de repère : https://www.keycloak.org/downloads
- Note : certaines libs ont un cycle de release indépendant (voir blog Keycloak 26.0).

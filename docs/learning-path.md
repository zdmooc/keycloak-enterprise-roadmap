# Parcours de montée en compétence (débutant → expert)

## Niveau 0 — IAM/SSO fondamentaux (1–2 jours)
Objectif : savoir expliquer OIDC/OAuth2/SAML et les composants (IdP, SP, Client, RP, Tokens).

- Lire : `docs/00-fundamentals/`
- Résultat attendu : être capable de dessiner un flow “Authorization Code”.

## Niveau 1 — Keycloak débutant (2–3 jours)
Objectif : être autonome dans la console Keycloak.

- Lire : `docs/01-beginner/`
- Lab : `labs/01-docker-compose/`
- Résultat attendu : 1 realm, 1 client OIDC, 1 user, login OK.

## Niveau 2 — Intégration entreprise (1–2 semaines)
Objectif : SSO réel + mapping rôles/claims + fédération annuaire.

- Lire : `docs/02-intermediate/`
- Lab : `labs/03-realm-as-code/`
- Résultat attendu : SSO OIDC complet + groupes/roles propagés, LDAP/AD simulé (option).

## Niveau 3 — Production & Ops (1–2 semaines)
Objectif : déployer Keycloak en K8s/OpenShift, monitoring, sauvegarde, upgrade.

- Lire : `docs/03-ops/`
- Labs : `labs/02-kubernetes-operator/` + `labs/04-metrics/`
- Résultat attendu : Keycloak via Operator, DB externe, health/metrics, rollback plan.

## Niveau 4 — Expert (continu)
Objectif : architecture interne, caches/sessions, perf, SPI, HA multi-site.

- Lire : `docs/04-internals/` + `docs/06-reference-architectures/`
- Résultat attendu : design multi-AZ + PRA multi-site avec checklist exploitable.


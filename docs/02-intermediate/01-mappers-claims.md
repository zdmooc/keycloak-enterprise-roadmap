# Mappers (claims) : rendre Keycloak utile aux applications

## Objectif
Faire apparaître dans le token ce que l’app doit utiliser :
- `preferred_username` / email
- `groups` (groupes)
- `realm_access.roles` ou `resource_access.<client>.roles`

## Patterns
- **RBAC** simple : groupes -> rôles
- **Multi-app** : rôles “par client”
- **API gateway** : mapping en scopes/claims consommables par policy

## Anti-pattern
Tout mettre dans le token (tokens énormes, fuite d’infos).

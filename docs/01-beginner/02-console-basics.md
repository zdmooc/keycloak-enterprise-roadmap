# Prise en main console

## Parcours minimal
1. Créer un realm
2. Créer un user
3. Créer un client OIDC (confidential/public selon cas)
4. Définir Redirect URIs
5. Tester login et récupérer un token (Authorization Code)

## Erreurs classiques
- Redirect URI trop stricte (mauvaise URL / slash)
- Hostname mal configuré derrière proxy/ingress
- Claims groupes absents (mapper manquant)

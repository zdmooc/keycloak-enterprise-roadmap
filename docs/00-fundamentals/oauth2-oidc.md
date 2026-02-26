# OAuth2 / OIDC : l’essentiel

## Flow recommandé (web) : Authorization Code (+ PKCE)
1. L’utilisateur est redirigé vers Keycloak (authorize)
2. Authentification
3. Keycloak renvoie un **code**
4. L’application échange le code contre des tokens (token endpoint)
5. L’application consomme **ID Token** (identité) et **Access Token** (API)

## Tokens
- ID Token : identité (JWT OIDC)
- Access Token : droits/permissions pour APIs
- Refresh Token : renouvellement

## Points entreprise
- Durées des tokens (TTL) et rotation
- Audience (`aud`)
- Scope/claims minimales (least privilege)

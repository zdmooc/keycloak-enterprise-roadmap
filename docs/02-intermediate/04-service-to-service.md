# Service-to-service (APIs) : patterns d’entreprise

## 1) Client Credentials Flow (machine-to-machine)
- Un service (client) obtient un access token via `grant_type=client_credentials`.
- Utilisation typique : batch, intégration backend, gateway.

Bonnes pratiques :
- scopes minimaux
- audience (`aud`) cohérente
- rotation secrets (client secret) ou auth forte (mTLS si disponible)

## 2) Token Exchange (avancé)
- Pattern : un service échange un token “entrant” contre un token “sortant” adapté à l’API cible.
- Utilité : découpler identité utilisateur vs identité technique.

À utiliser avec gouvernance stricte (risque d’escalade de privilèges si mal cadré).

## 3) Validation côté API
- JWT validation via JWKS (clé publique) côté API/Gateway.
- Vérifier : signature, expiration, issuer, audience, scopes/roles.

## 4) Gateway / Service Mesh
- Gateways (NGINX/Kong/Apigee) : validation token + policies.
- Mesh : mTLS + authz (complémentaire à Keycloak, pas un remplacement).

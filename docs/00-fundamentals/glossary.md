# Glossaire (Keycloak/IAM)

- **IAM** : Identity & Access Management.
- **IdP** : Identity Provider (Keycloak, Entra ID, Ping, Okta…).
- **SP / RP** : Service Provider / Relying Party (application qui délègue l’auth).
- **OIDC** : OpenID Connect (authentification au-dessus d’OAuth2).
- **OAuth2** : délégation d’accès (authorization).
- **SAML2** : protocole SSO XML, souvent legacy/entreprise.
- **Realm** : tenant logique Keycloak (partition de config + users).
- **Client** : application déclarée dans un realm (OIDC/SAML).
- **Mapper** : transforme une info utilisateur en claim (JWT), attribut SAML, etc.
- **Claim** : champ dans un token (ex: `preferred_username`, `groups`, `realm_access.roles`).
- **Flow d’authent** : pipeline de login (username/password, OTP, WebAuthn…).
- **SPI** : Service Provider Interface (extension/plugin Java).
- **Infinispan** : data grid/cache (Keycloak l’utilise pour caches distribués).
- **JGroups** : transport/cluster membership (utilisé par Infinispan pour le cluster).
- **Multi-AZ** : haute dispo sur plusieurs zones dans une même région.
- **Multi-site** : haute dispo / PRA sur deux sites/régions distinctes.

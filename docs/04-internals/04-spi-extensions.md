# Extensions SPI (niveau expert)

## Ce qu’on étend
- Authenticator (étapes de login)
- Protocol mappers (claims OIDC/SAML)
- Event listeners (audit, SIEM)
- User storage provider (source externe)

## Packaging
- Un provider = un JAR (Java)
- Déploiement : image custom (copy jar) ou volume
- Risques : compatibilité version, tests upgrade

Réf dev guide :
- https://www.keycloak.org/docs/latest/server_development/

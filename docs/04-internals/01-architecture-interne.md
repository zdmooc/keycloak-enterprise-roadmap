# Architecture interne de Keycloak (Quarkus + Infinispan)

## 1) Runtime Quarkus
Keycloak est distribué sous forme d’une application “Quarkus-powered” (Keycloak.X).  
Réf migration : https://www.keycloak.org/migration/migrating-to-quarkus

Implications :
- démarrage/CLI `kc.sh`
- options de build pour images “optimisées” (container guide)
Réf : https://www.keycloak.org/server/containers

## 2) Caches Infinispan (embedded par défaut)
Keycloak utilise un fichier Infinispan (`conf/cache-ispn.xml`) et décrit les caches utilisés.  
Réf : https://www.keycloak.org/server/caching

Idée :
- réduire la charge DB
- partager des infos entre pods (selon cache)
- JGroups sert au transport/cluster membership (via Infinispan)

## 3) Sessions (Keycloak 26)
Keycloak 26 documente les stockages de sessions et recommande “persistent sessions” (sessions en DB + cache en mémoire).  
Réf : https://www.keycloak.org/2024/12/storing-sessions-in-kc26

## 4) Management interface (port 9000)
- `/health` et `/metrics` sont sur le port management `9000` (et à ne pas exposer via proxy).  
Réfs :
- https://www.keycloak.org/server/management-interface
- https://www.keycloak.org/server/reverseproxy

## 5) Extensibilité (SPI)
Keycloak propose des SPI (plugins Java) : authenticator, protocol mappers, event listeners, user storage…
Réf dev guide : https://www.keycloak.org/docs/latest/server_development/

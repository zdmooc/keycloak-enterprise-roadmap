# Base PostgreSQL & pool de connexions

Keycloak dépend fortement de la DB en production.

## Pool de connexions : règle de base
Pour la performance, fixer une taille de pool (initial=min=max) pour éviter la création à la volée.  
Réf : https://www.keycloak.org/high-availability/single-cluster/concepts-database-connections

## Conséquence “entreprise”
- Le sizing du pool = sizing DB
- Surprovisionner le pool peut **saturer la DB** (et dégrader)
- Mesurer (métriques) avant d’augmenter
Réf : https://www.keycloak.org/observability/metrics-for-troubleshooting-database

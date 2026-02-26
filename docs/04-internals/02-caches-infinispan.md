# Caches Keycloak : lecture utile

La doc officielle liste des caches (ex: realms, users, keys, authorization…), leur type, et leur rôle.
Réf : https://www.keycloak.org/server/caching

## Points d’attention (ops)
- caches + mémoire : attention aux limites mémoire (OOM)
- scaling horizontal : rebalancing et spikes CPU possibles (HPA à calibrer)
- garder des métriques sur caches et threads

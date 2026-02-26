# Scaling & tuning (pratique)

## 1) Scaling horizontal (HPA)
- Le scaling horizontal ajoute/retire des instances Keycloak.
- Attention : l’ajout d’un nœud peut provoquer des spikes CPU (rebalancing/certificats/cache).
  => calibrer seuils HPA prudemment.

Réf (discussion scaling) :
- https://github.com/keycloak/keycloak/discussions/42681

Réf doc Red Hat scaling :
- https://docs.redhat.com/en/documentation/red_hat_build_of_keycloak/26.2/html/getting_started_guide/getting-started-scaling-and-tuning-

## 2) Thread pools
Keycloak (Quarkus) utilise un executor pool pour les requêtes et certaines probes.
- option : `http-pool-max-threads`

Réf :
- https://www.keycloak.org/high-availability/multi-cluster/concepts-threads

## 3) Sizing CPU/Mémoire (concepts)
- Plus de pods = plus d’overhead
- Multi-cluster = overhead supplémentaire

Réf :
- https://www.keycloak.org/high-availability/multi-cluster/concepts-memory-and-cpu-sizing

## 4) DB connection pools
Fixer un pool constant (initial=min=max) et dimensionner DB en conséquence.

Réf :
- https://www.keycloak.org/high-availability/single-cluster/concepts-database-connections

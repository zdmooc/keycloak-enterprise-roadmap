# Architecture de référence “entreprise” : PRA multi‑site (multi-cluster, active/passive)

## Objectif
Survivre à la perte totale d’un site/région (PRA/PCA).

La doc Keycloak HA multi‑cluster traite les compromis et les risques de perte de requêtes
pendant la détection du site en panne.  
Réf : https://www.keycloak.org/high-availability/multi-cluster/concepts

Le benchmark Keycloak déconseille de “déployer Keycloak across different regions” pour un service actif (latence).
Donc, en multi‑site, on privilégie souvent **active/passive** (bascule).  
Réf : https://www.keycloak.org/2025/10/keycloak-benchmark

---

## Architecture (active/passive)

```mermaid
flowchart LR
  U[Users / Apps] --> DNS[DNS/GSLB failover]
  DNS -->|Site A (actif)| LBA[Ingress/Route/LB A]
  DNS -->|Site B (passif)| LBB[Ingress/Route/LB B]

  LBA --> KCA[Keycloak pods A]
  LBB --> KCB[Keycloak pods B]

  KCA --> PGA[(PostgreSQL A)]
  KCB --> PGB[(PostgreSQL B)]
  PGA <--replication--> PGB
```

---

## Points critiques (PRA)
- Réplication DB (RPO) : synchrone (faible distance) ou asynchrone (multi-région).
- Détection bascule DNS/LB : temps de TTL + health-checks.
- Procédures de resynchronisation après incident (retour arrière contrôlé).
- Tests PRA réguliers (table-top + failover réel).

---

## Variantes
1) **DB managée multi-région** (si disponible) + deux clusters Keycloak.
2) **Deux DB séparées** + réplication (PostgreSQL native, ou service managé).
3) Multi-cluster Keycloak avec Infinispan externe (scénarios avancés)  
   Réf : https://www.keycloak.org/high-availability/multi-cluster/deploy-infinispan-kubernetes-crossdc

---

## Règles pratiques
- Garder l’admin isolée (réseau / hostname admin)
- Ne pas exposer le port management 9000 via ingress
- Automatiser export/import realm (ou “realm as code”) pour reconstruction rapide
- Runbook : décision “bascule” + “retour” + “tests”

Checklist complète : `checklists.md`

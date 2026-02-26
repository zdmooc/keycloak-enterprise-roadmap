# Checklists exploitables (multi‑AZ + PRA multi‑site)

## 1) Sizing initial (baseline)
- [ ] 3 pods Keycloak (1/AZ) ou ≥2 (minimum absolu)
- [ ] Requests/Limits CPU/mem définis
- [ ] HPA : démarrer prudemment (risque de spikes CPU lors de scale-out)
- [ ] DB dimensionnée pour le pool total + pics (tests charge)

## 2) Base de données (PostgreSQL)
- [ ] DB externe (pas H2)
- [ ] Sauvegardes automatiques + tests de restauration
- [ ] Pool DB fixe (initial=min=max)  
      Réf : https://www.keycloak.org/high-availability/single-cluster/concepts-database-connections
- [ ] Paramètres DB : latence faible (même région/AZ proches)
- [ ] Observabilité DB (connections, locks, CPU, IO)

## 3) Ingress / Hostname / Reverse proxy
- [ ] `hostname` défini (issuer stable)  
      Réf : https://www.keycloak.org/server/hostname
- [ ] headers proxy configurés (Forwarded/X-Forwarded)
- [ ] TLS : certs valides, rotation (cert-manager/KMS)
- [ ] Port management 9000 non exposé via ingress  
      Réf : https://www.keycloak.org/server/reverseproxy

## 4) Secrets & configuration
- [ ] Secrets DB dans Secret (ou External Secrets/KMS)
- [ ] Rotation secrets planifiée
- [ ] Admin bootstrap sécurisé (pas “admin/admin”)
- [ ] Config “as-code” (realm export, scripts, GitOps)

## 5) Backups / Restore
- [ ] DB backups + restore test (RTO/RPO mesurés)
- [ ] Export realm régulier (option)
- [ ] Stockage backups chiffré, versionné, immuable si possible

## 6) Upgrade / Rollback
- [ ] Lire le guide upgrade avant version cible  
      Réf : https://www.keycloak.org/docs/latest/upgrading/index.html
- [ ] Rolling upgrade (Operator) en heures creuses
- [ ] Plan rollback : DB snapshot + version image précédente
- [ ] Tests post-upgrade : login, token, refresh, logout, admin, apps clés

## 7) Monitoring / Alerting
- [ ] Health checks activés (port 9000)  
      Réf : https://www.keycloak.org/observability/health
- [ ] Metrics activées (port 9000)  
      Réf : https://www.keycloak.org/observability/configuration-metrics
- [ ] Dashboards : erreurs, latence, threads, DB pool, GC, caches
- [ ] Alertes : 5xx, timeouts token, pool DB saturé, OOM, restarts

## 8) PRA multi-site (si applicable)
- [ ] Deux clusters indépendants (Site A/B)
- [ ] Réplication DB (synchro/async) + validation
- [ ] DNS failover / GSLB avec TTL adaptés
- [ ] Runbook bascule + retour (resync)
- [ ] Exercices PRA réguliers (au moins trimestriel)

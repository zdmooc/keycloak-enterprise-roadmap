# Lab 03 — Realm “as code” (export/import + scripts)

Objectif : versionner la config (realm, clients, mappers) dans Git.

## Approches
1) Export/import realm (JSON) via UI ou admin CLI
2) Admin CLI (kcadm.sh) : scripts idempotents
3) Terraform provider / operator “realm” (selon plateforme)

Ce dépôt fournit :
- `tools/kcadm/` : exemples de scripts
- `evidence/` : outputs attendus à capturer

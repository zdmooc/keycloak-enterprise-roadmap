# Fédération LDAP/AD

## Objectifs
- Authentifier via AD/LDAP
- Importer users, groupes
- Synchroniser (full sync / periodic)

## Points de vigilance
- Mapping des attributs
- Groupes AD -> groups Keycloak
- Gestion des comptes de service (bind)
- Stratégie de provisioning (source of truth)

## Tests minimum
- Login user AD
- Groupes récupérés et présents dans les claims

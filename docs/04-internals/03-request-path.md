# Keycloak : chemin de requête interne (vue “mentale”)

## Vue simplifiée
1. Requête HTTP arrive (Ingress/Route/LB)
2. Quarkus HTTP layer (handlers)
3. Endpoint Keycloak (OIDC/SAML/Admin)
4. Lecture/écriture :
   - cache Infinispan (lecture rapide)
   - DB via JPA/Hibernate (source de vérité)
5. Réponse + tokens signés (clé active)

## Où regarder en incident
- Logs : erreurs OIDC, DB timeouts, cache warnings
- Métriques : threads, DB pool, latence endpoints
- DB : connexions, locks, CPU, IO

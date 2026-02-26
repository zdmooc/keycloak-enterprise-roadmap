#!/usr/bin/env bash
set -euo pipefail

# Exemple : login admin + création realm idempotente
# Nécessite : kcadm.sh disponible (dans un conteneur keycloak ou local)

KC_URL="${KC_URL:-http://localhost:8080}"
ADMIN_USER="${ADMIN_USER:-admin}"
ADMIN_PASS="${ADMIN_PASS:-admin}"
REALM_NAME="${REALM_NAME:-demo}"

kcadm.sh config credentials --server "$KC_URL" --realm master --user "$ADMIN_USER" --password "$ADMIN_PASS"

# create realm if missing
if ! kcadm.sh get realms/"$REALM_NAME" >/dev/null 2>&1; then
  kcadm.sh create realms -s realm="$REALM_NAME" -s enabled=true
fi

echo "OK: realm $REALM_NAME"

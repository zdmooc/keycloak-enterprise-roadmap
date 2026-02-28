#!/usr/bin/env bash
set -u

rm -f kc_cookies.txt kc_login.html kc_headers.txt

# 1) PKCE
VERIFIER="$(openssl rand -base64 96 | tr '+/' '-_' | tr -d '=' | tr -d '\n' | cut -c 1-80)"
CHALLENGE="$(printf %s "$VERIFIER" | openssl dgst -binary -sha256 | openssl base64 | tr '+/' '-_' | tr -d '=' | tr -d '\n')"
CHK="$(printf %s "$VERIFIER" | openssl dgst -binary -sha256 | openssl base64 | tr '+/' '-_' | tr -d '=' | tr -d '\n')"
echo "PKCE_SELF_CHECK=$([ "$CHK" = "$CHALLENGE" ] && echo OK || echo FAIL)"
echo "VERIFIER=$VERIFIER"
echo "CHALLENGE=$CHALLENGE"

# 2) GET /auth (IMPORTANT: -L pour suivre redirects)
HTTP_CODE="$(curl -sS -L -D kc_headers.txt -o kc_login.html -w '%{http_code}' -G \
  -c kc_cookies.txt \
  "http://localhost:18080/realms/demo/protocol/openid-connect/auth" \
  --data-urlencode "client_id=demo-web" \
  --data-urlencode "response_type=code" \
  --data-urlencode "scope=openid" \
  --data-urlencode "redirect_uri=http://localhost:18080/callback" \
  --data-urlencode "code_challenge=$CHALLENGE" \
  --data-urlencode "code_challenge_method=S256")"

echo "AUTH_HTTP_CODE=$HTTP_CODE"
echo "LOGIN_HTML_SIZE=$(wc -c < kc_login.html 2>/dev/null || echo 0)"

if [ ! -s kc_login.html ]; then
  echo "ERROR: kc_login.html vide. Headers:"
  head -n 20 kc_headers.txt || true
  exit 1
fi

# 3) Extraire ACTION (form action)
ACTION="$(grep -oE 'action="[^"]*login-actions/authenticate[^"]*"' kc_login.html \
  | head -n 1 | cut -d'"' -f2 | sed 's/&amp;/\&/g')"
echo "ACTION=$ACTION"

if [ -z "${ACTION}" ]; then
  echo "ERROR: ACTION vide. Extrait HTML:"
  head -n 40 kc_login.html || true
  exit 1
fi

# 4) POST login -> FINAL_URL (contient code=...)
FINAL_URL="$(curl -sS -L -b kc_cookies.txt -c kc_cookies.txt -o /dev/null -w '%{url_effective}' \
  --data-urlencode "username=alice" \
  --data-urlencode "password=Passw0rd!" \
  --data-urlencode "credentialId=" \
  "$ACTION")"

echo "FINAL_URL=$FINAL_URL"

CODE="$(printf '%s' "$FINAL_URL" | sed -n 's/.*[?&]code=\([^&]*\).*/\1/p')"
echo "CODE=$CODE"

if [ -z "${CODE}" ]; then
  echo "ERROR: CODE vide (pas de code= dans FINAL_URL)."
  exit 1
fi

# 5) /token (PKCE)
curl -sS -X POST "http://localhost:18080/realms/demo/protocol/openid-connect/token" \
  -H "Content-Type: application/x-www-form-urlencoded" \
  --data-urlencode "grant_type=authorization_code" \
  --data-urlencode "client_id=demo-web" \
  --data-urlencode "code=$CODE" \
  --data-urlencode "code_verifier=$VERIFIER" \
  --data-urlencode "redirect_uri=http://localhost:18080/callback" | head -c 900; echo

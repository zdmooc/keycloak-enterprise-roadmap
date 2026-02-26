#!/usr/bin/env bash
set -euo pipefail

HOST="${1:-http://localhost:9000}"
curl -fsS "$HOST/health/ready" | jq .

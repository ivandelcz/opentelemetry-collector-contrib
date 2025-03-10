#!/bin/bash
set -eufCo pipefail
export SHELLOPTS
IFS=$'\t\n'

[ -z "${OTEL_CONFIG_YAML:-}" ] && echo "OTEL_CONFIG_YAML env var is required." && exit 1

mkdir -p /etc/otelcol-contrib

echo "${OTEL_CONFIG_YAML}" >/etc/otelcol-contrib/config.yaml

# This will exec the CMD from your Dockerfile, i.e. "npm start"
exec "$@"

#!/usr/bin/env bash

set -e

[[ -z "${DEBUG}" ]] || [[ "${DEBUG,,}" = "false" ]] || [[ "${DEBUG,,}" = "0" ]] || set -x

if [[ ! -d "${SERVER_VOLUME}" ]]; then
  mkdir -p "${SERVER_VOLUME}"
fi

chown "${STEAM_USER}": "${SERVER_VOLUME}" || echo "Failed setting rights on ${SERVER_VOLUME}, continuing startup..."

exec gosu "${STEAM_USER}" /steam-entrypoint.sh $*

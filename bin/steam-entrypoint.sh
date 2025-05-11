#!/usr/bin/env bash

set -e

[[ -z "${DEBUG}" ]] || [[ "${DEBUG,,}" = "false" ]] || [[ "${DEBUG,,}" = "0" ]] || set -x

if [[ "$(whoami)" != "${STEAM_USER}" ]]; then
  echo "run this script as steam-user"
  exit 1
fi

echo "_______________________________________"
echo ""
echo "# Colony Survival Server - $(date)"
echo "# RUNNING AS USER '${STEAM_USER}' - '$(id -u)'"
echo "# ARGS: ${args[*]}"
echo "_______________________________________"


# Check that Colony Survival exists in the first place
if [ ! -f "${SERVER_VOLUME}/colonyserver.x86_64" ]; then
	echo ""
	echo "Installing Colony Survival.."
	echo ""
	bash ${STEAMCMDDIR}/steamcmd.sh +force_install_dir ${SERVER_VOLUME} +login anonymous +app_update 748090 validate +quit
else
	echo ""
	echo "Updating Colony Survival.."
	echo ""
	bash ${STEAMCMDDIR}/steamcmd.sh +force_install_dir ${SERVER_VOLUME} +login anonymous +app_update 748090 validate +quit
fi


# Set the working directory
cd ${SERVER_VOLUME} || exit

# Run the server
echo ""
echo "Starting Colony Survival.."
echo ""
if [ ! -z "$SERVER_PASSWORD" ]; then
	exec ${SERVER_VOLUME}/colonyserver.x86_64 ${SERVER_STARTUP_ARGS} +server.world "${SERVER_NAME}" +server.name "${SERVER_NAME}" +server.password ${SERVER_PASSWORD} 2>&1
else
	exec ${SERVER_VOLUME}/colonyserver.x86_64 ${SERVER_STARTUP_ARGS} +server.world "${SERVER_NAME}" +server.name "${SERVER_NAME}" 2>&1
fi
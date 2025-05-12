FROM        cm2network/steamcmd:root

LABEL       MAINTAINER="https://github.com/Thielquis/"

ENV         SERVER_NAME="CS Docker Server" \
            SERVER_PASSWORD="" \
            SERVER_NETWORKTYPE="SteamOnline" \
            SERVER_GAMEPORT="27004" \
            SERVER_STEAMPORT="27005" \
            SERVER_VAC="true" \
            SERVER_VOLUME="/app" \
            STEAM_HOME="/home/${USER}" \
            STEAM_USER="${USER}" \
            STEAM_LOGIN="anonymous"

RUN         apt-get update && \
            apt-get install -y  net-tools \
                                curl \
                                libc6-i386 \
                                lib32gcc-s1 \
                                gosu \
                                cron \

            && \
            su ${USER} -c "bash -x ${STEAMCMDDIR}/steamcmd.sh +login ${STEAM_LOGIN} +quit" && \
            apt-get -qq autoclean && apt-get -qq autoremove && apt-get -qq clean
			
COPY        bin/    /

EXPOSE      ${SERVER_GAMEPORT}/udp ${SERVER_GAMEPORT}/tcp ${SERVER_STEAMPORT}/tcp ${SERVER_STEAMPORT}/udp

VOLUME      ["${SERVER_VOLUME}"]
WORKDIR     ${SERVER_VOLUME}

ENTRYPOINT  ["/docker-entrypoint.sh"]
CMD         []
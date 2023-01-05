#!/bin/bash -ue

# https://github.com/StunlockStudios/vrising-dedicated-server-instructions

# Start display server
Xvfb :99 -screen 0 800x600x16 &
sleep 1s
export DISPLAY=:99.0

cd /opt/game
wine start /wait VRisingServer.exe \
    -serverName "${GAME_NAME:-V Rising}" \
    -description "${GAME_DESCRIPTION:-}" \
    -maxUsers ${GAME_PLAYERS:-40} \
    -maxAdmins ${GAME_ADMINS:-4} \
    -password ${GAME_PASSWORD:-} \
    -preset ${GAME_MODE:-StandardPVE} \
    -gamePort ${PORT:-9876} \
    -queryPort ${PORT_QUERY:-9877} \
    -disableRcon \

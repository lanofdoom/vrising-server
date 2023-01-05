# LAN of DOOM vrising Server

Docker image for a private vrising server as used by the LAN of DOOM.

# Installation

Run `docker pull ghcr.io/lanofdoom/vrising-server:latest`

# Environmental Variables

`GAME_NAME` The name of the server (default `V Rising Server`)

`GAME_DESCRIPTION` The name of the server (default `V Rising Server`)

`GAME_PLAYERS` (default `40`)

`GAME_ADMINS` (default `4`)

`GAME_PASSWORD` The password users must enter in order to join the server. (default ` `)

`GAME_MODE` Preset configuration for server (default `StandardPVE`)

`PORT` The port to use for the server. (default `9876`)

`PORT_QUERY` The port to use for the steam query service. (default `9877`)

# Resources

During a quick test with only one player connected, this V Rising dedicated server consumes about 3 GB memory and two whole i5-6200U cores.

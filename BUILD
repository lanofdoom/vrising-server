load("@io_bazel_rules_docker//container:container.bzl", "container_image", "container_layer")
load("@io_bazel_rules_docker//docker/package_managers:download_pkgs.bzl", "download_pkgs")
load("@io_bazel_rules_docker//docker/package_managers:install_pkgs.bzl", "install_pkgs")
load("@com_github_lanofdoom_steamcmd//:defs.bzl", "steam_depot_layer")

steam_depot_layer(
    name = "vrising_dedicated_windows",
    app = "1829350",
    directory = "/opt/game",
)

container_layer(
    name = "config",
    directory = "/opt/game/vrising/cfg/templates",
    files = [
        ":server.cfg",
    ],
)

download_pkgs(
    name = "server_deps",
    image_tar = "@base_image//image",
    packages = [
        "ca-certificates",
        "wine",
        "xvfb",
    ],
)

install_pkgs(
    name = "server_base",
    image_tar = "@base_image//image",
    installables_tar = ":server_deps.tar",
    installation_cleanup_commands = "rm -rf /var/lib/apt/lists/*",
    output_image_name = "server_base",
)

container_image(
    name = "vrising_dedicated_image",
    base = ":server_base",
    empty_dirs = ["/data"],
    entrypoint = ["/entrypoint.sh"],
    env = {
        "GAME_NAME": "V Rising Server",
        "GAME_DESCRIPTION": "V Rising Server!",
        "GAME_PLAYERS": "40",
        "GAME_ADMINS": "4",
        "GAME_PASSWORD": "",
        "GAME_MODE": "StandardPVE",
        "PORT": "9876",
        "PORT_QUERY": "9877",
    },
    files = [
        ":entrypoint.sh",
    ],
    layers = [
        ":vrising_dedicated_windows",
        ":config",
    ],
    symlinks = {
        "/root/.steam/sdk32/steamclient.so": "/opt/game/bin/steamclient.so",
        "/root/.wine/drive_c/users/root/AppData/LocalLow/Stunlock Studios/VRisingServer": "/data",
    },
)

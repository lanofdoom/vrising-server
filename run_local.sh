#!/bin/bash -ue

game_name="local"
game_root=$HOME/.local/share/vrising/${game_name}
mkdir -p ${game_root}

bazel run //:vrising_dedicated_image && docker run --rm -it \
    --name vrising-run-local \
    --cap-add=sys_nice \
    --stop-timeout 120 \
    -p 9876:9876/udp -p 9877:9877/udp \
    -v ${game_root}:/data \
    -e GAME_NAME=${game_name} \
    -e GAME_PASSWORD="test" $@ \
    bazel:vrising_dedicated_image 
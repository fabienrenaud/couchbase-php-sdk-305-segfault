#!/bin/bash
set -x

network=$(docker inspect -f '{{.HostConfig.NetworkMode}}' $(docker-compose ps -q cb))
docker build -t cb_segfault_repro_bug .
docker run -it -v $(pwd):/app -w /app --network=${network} cb_segfault_repro_bug sh

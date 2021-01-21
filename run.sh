#!/bin/bash

docker build -t cb_segfault_repro_bug .
docker run -it -v $(pwd):/app -w /app --network=cb_segfault_repro_default cb_segfault_repro_bug sh

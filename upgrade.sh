#!/bin/bash -e

container_name=openwebrxplus

# Download and build the latest version.
docker-compose build --no-cache

# Is the container running?
IS_RUNNING=$(docker container inspect -f '{{.State.Running}}' "$container_name" || echo "false")

if [ "$IS_RUNNING" = "true" ]; then
    echo "$container_name is running, so it will now be restarted."
    # Note that `docker-compose restart` won't have the same effect.
    docker-compose stop
    docker container rm "$container_name" || true
    docker-compose up -d
else
    echo "$container_name isn't running, so it won't be started automatically.  Please start it manually."
fi

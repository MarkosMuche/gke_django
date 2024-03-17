#!/bin/bash

export $(grep -v '^#' .env | xargs)
docker build -t djangoapp .
docker tag djangoapp "$DOCKER_TAG"

docker push "$DOCKER_TAG"
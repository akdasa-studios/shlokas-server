#!/bin/sh
if [[ -z "${GITHUB_TOKEN}" ]]; then
    echo "Error: GITHUB_TOKEN is not set"
    exit 1
fi

(cd ../shlokas-db && docker compose build) && \
(cd ../shlokas-db && docker compose -f ./docker-compose.aux.yml build) && \
(cd ../shlokas-auth && docker compose build --build-arg GITHUB_TOKEN=${GITHUB_TOKEN}) && \
(cd ../shlokas-landing && docker compose build) && \
(cd ../shlokas-content && docker compose build) && \
(cd ../shlokas-admin && docker compose build --build-arg GITHUB_TOKEN=${GITHUB_TOKEN}) && \
(cd ../shlokas-totp && docker compose build) && \
(cd ../shlokas-balancer && docker compose build) && \
(cd ../shlokas-e2e && docker compose build) && \
(cd ../shlokas && docker compose build)
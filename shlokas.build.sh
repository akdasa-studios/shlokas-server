export GITHUB_TOKEN=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

(cd ../shlokas-db && docker compose build) && \
(cd ../shlokas-db && docker compose -f ./docker-compose.aux.yml build) && \
(cd ../shlokas-auth && docker compose build) && \
(cd ../shlokas-landing && docker compose build) && \
(cd ../shlokas-content && docker compose build) && \
(cd ../shlokas-admin && docker compose build --build-arg GITHUB_TOKEN=${GITHUB_TOKEN}) && \
(cd ../shlokas-totp && docker compose build) && \
(cd ../shlokas-balancer && docker compose build)
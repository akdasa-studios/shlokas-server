export GITHUB_TOKEN=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

(cd ../shlokas-db && docker compose build)
(cd ../shlokas-auth && docker compose build)
(cd ../shlokas-landing && docker compose build)
(cd ../shlokas-content && docker compose build)
(cd ../shlokas-admin && docker compose build --build-arg GITHUB_TOKEN=${GITHUB_TOKEN})
(cd ../shlokas-totp && docker compose build)
(cd ../shlokas-balancer && docker compose build)
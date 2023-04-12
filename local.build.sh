export GITHUB_TOKEN=PUT_YOU_GITHUB_TOKEN_HERE

(cd ../shlokas-db && docker compose build)
(cd ../shlokas-auth && docker compose build)
(cd ../shlokas-landing && docker compose build)
(cd ../shlokas-content && docker compose build)
(cd ../shlokas-admin && docker compose build --build-arg GITHUB_TOKEN=${GITHUB_TOKEN})
(cd ../shlokas-totp && docker compose build)
(cd ../shlokas-balancer && docker compose build)
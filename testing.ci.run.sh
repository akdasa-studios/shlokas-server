[[ -f environment.local.env ]] || touch environment.local.env
docker-compose -f ./docker-compose.yml -f ./docker-compose.testing.yml -f ./docker-compose.testing.ci.yml up -d --wait

ENV=${1:-dev}


print_header() {
    if command -v figlet &> /dev/null
    then
        figlet $1
    else
        print_section $1
    fi
}


print_section() {
    echo "-----------------------"
    echo $1
    echo "-----------------------"
}

print_header "Shlokas"

print_section "Running shlokas for ${ENV}..."
[[ -f environment.local.env ]] || touch environment.local.env
docker compose -f ./shlokas/docker-compose.shlokas.yml -f ./shlokas/docker-compose.shlokas.${ENV}.yml up --wait && \
print_section "Running aux for ${ENV}..." && \
docker compose -f ./aux/docker-compose.aux.yml -f ./aux/docker-compose.aux.${ENV}.yml up --wait

if [[ $2 = "logs" ]]; then
    docker compose -f ./shlokas/docker-compose.shlokas.yml -f ./shlokas/docker-compose.shlokas.${ENV}.yml logs -f
fi

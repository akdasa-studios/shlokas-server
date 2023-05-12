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

print_section "Stoping shlokas for ${ENV}..."
docker compose -f ./shlokas/docker-compose.shlokas.yml -f ./shlokas/docker-compose.shlokas.${ENV}.yml down
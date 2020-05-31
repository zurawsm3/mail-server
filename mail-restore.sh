tar xJpf "$1" || exit 1
docker-compose up -d || exit 1

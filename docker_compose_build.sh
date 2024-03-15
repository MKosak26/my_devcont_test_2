#!/bin/bash

compose_file=docker-compose.yml

# U slučaju da container istog imena (ime je definano u yml file-u) postoji već, ove naredbe će ga rewrite-ati. Nema warninga/errora
docker-compose -f $compose_file build
docker-compose -f $compose_file up -d

printf "\r\n## CURRENT IMAGES ##\r\n"
docker images -a
printf "\r\n## CURRENT CONTAINERS ##\r\n"
docker ps -a
printf "\r\n"

# Imamo running container na koji nismo attach-ani (nismo se sa konzolom spojili) jer je bolje koristiti VSCode i onda se spojiti
# Preko VSCode-a onda se otvori baš taj container sa svim file-ovima mount-anim i dobro se to sve vidi
# Ako se želi ući putem konzole u taj container, onda koristiti "docker attach ...
# docker attach $container_name

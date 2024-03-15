#!/bin/bash

image_name="my_docker_image"
container_name="my_docker_container"

# Ako postoji već container koji se isto zove, obriši ga prvo - inače bi bacao grešku
if docker ps -a --format "{{.ID}}:{{.Names}}" | grep $container_name >/dev/null
then
    echo "Deleting the old container !"

    docker stop "$container_name" > /dev/null
    docker rm "$container_name" > /dev/null
else
    echo "No old container with the same ID present"
fi

docker build -t $image_name .devcontainer/
docker run --name $container_name -idt $image_name

printf "\r\n## CURRENT IMAGES ##\r\n"
docker images -a
printf "\r\n## CURRENT CONTAINERS ##\r\n"
docker ps -a
printf "\r\n"

# Imamo running container na koji nismo attach-ani (nismo se sa konzolom spojili) 
# Ako se želi ući putem konzole u taj container, onda koristiti "docker attach ...
# docker attach $container_name

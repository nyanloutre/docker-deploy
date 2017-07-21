#!/bin/bash

docker build -t site-max https://github.com/nyanloutre/site-max.git

docker stop site-max
docker rm site-max

docker run -d --network nginx-net --name site-max --label traefik.frontend.rule=Host:maxspiegel.fr --label traefik.port=80 site-max 

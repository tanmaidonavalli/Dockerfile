#!/bin/bash
docker build -t tfimage:v1 .
docker run -it -d --name tcont1 tfimage:v1
docker exec -it tfcontainer2 bash -c 'cd /root/TFCode/TF_Files && terraform init && terraform plan && terraform apply && docker stop tfcontainer2 && docker rm tfcontainer2 && docker rmi tfimage:v1 ; exec "${SHELL:-sh}"'

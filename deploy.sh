#!/bin/bash
docker build -t tfimage:v1 .
docker run -it -d --name tfcontainer tfimage:v1
docker exec -it tfcontainer bash -c 'cd /root/TFCode/TF_Files && 
                                     terraform init && 
                                     terraform plan && 
                                     terraform apply &&
                                     docker stop tfcontainer &&
                                     docker rm tfcontainer && 
                                     docker rmi tfimage:v1 ; exec "${SHELL:-sh}"'

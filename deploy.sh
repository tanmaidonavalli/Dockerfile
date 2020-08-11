#!/bin/bash
docker build -t tfimage:latest .
docker run -it -d --name tfcontainer1 tfimage:latest
docker exec -it tfcontainer1 bash -c 'cd /root/TFCode/TF_Files &&
        terraform init  &&
        config-lint 
        terraform plan &&
        terraform apply &&
        exit ; exec "${SHELL:-sh}"'
docker stop tfcontainer1
docker rm tfcontainer1
docker rmi tfimage:latest

#!/bin/bash

docker build -t tfimage:latest .
docker run -it -d --name tfcontainer1 tfimage:latest
docker exec -it tfcontainer1 bash -c 'cd /root/TFCode/TF_Files &&
        terraform init &&
        config-lint -terraform . > log.txt &&
        chmod 755 config.sh &&

        ./config.sh &&
        terraform plan &&
        terraform apply &&
        exit ; exec "${SHELL:-sh}"'
docker stop tfcontainer1
docker rm tfcontainer1
docker rmi tfimage:latest

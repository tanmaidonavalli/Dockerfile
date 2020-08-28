#!/bin/bash
docker build -t tfimage:latest .
docker run -it -d --name tfcontainer1 tfimage:latest
docker exec -it tfcontainer1 bash -c 'cd /root/TFCode/TF_Files &&
        
        terraform init --backend-config="access_key=xxx" --backend-config="secret_key=xxx" &&
        chmod 755 con.sh && ./con.sh &&
        terraform workspace new "app1-dev" &&
        terraform plan &&
        terraform apply &&
        exit ; exec "${SHELL:-sh}"'
docker stop tfcontainer1
docker rm tfcontainer1
docker rmi tfimage:latest



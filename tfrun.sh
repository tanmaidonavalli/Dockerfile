#!/bin/bash

#Clone Terraform files from GitHub
git clone https://github.com/tanmaidonavalli/TF_Files.git

#Build Image
#docker build -t <image_name> /root/

#Create Container
#docker run -it -d --name <container_name> <image_name> /bin/bash

#login to container
#docker exec -it <container_name> /bin/bash

#Intialize the folder
#terraform init

#Run config-lint
#config-lint -terraform TF_Files

#Run Terraform plan
#terraform plan

#Run Terraform
#terraform apply

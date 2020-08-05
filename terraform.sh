!#/bin/bash

cd /root/TFCode/TF_Files
$terraform --version



#Intialize the folder
$terraform init -no-color -upgrade=true 

#Run config-lint
$config-lint -terraform TF_Files

$terraform plan -no-color -out=tfplan | tee plan.output


      $terraform apply -no-color tfplan

        

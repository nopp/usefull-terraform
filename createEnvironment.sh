#!/bin/bash
## -auto-approve

echo "Creating environment ..."

cd vpc
terraform init
terraform plan
terraform apply

cd ../sg
terraform init
terraform plan
terraform apply

cd ../dynamodb
terraform init
terraform plan
terraform apply

cd ../rds
terraform init
terraform plan
terraform apply

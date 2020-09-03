#!/bin/bash
## -auto-approve 

echo "Removing environment ..."

cd rds
terraform destroy

cd ../dynamodb
terraform destroy

cd ../sg
terraform plan
terraform destroy

cd ../vpc
terraform plan
terraform destroy
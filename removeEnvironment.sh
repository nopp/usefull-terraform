#!/bin/bash
## -auto-approve

function removeVpc {
    echo "Removing VPC ..."
    cd vpc
    terraform destroy   
}

function removeSg {
    echo "Removing Security Group ..."
    cd ../sg
    terraform destroy    
}

function removeDynamoDB {
    echo "Removing DynamoDB ..."
    cd ../dynamodb
    terraform destroy    
}

function removeRds {
    echo "Removig RDS ..."
    cd ../rds
    terraform destroy
}

if [ -z $1 ]; then
    echo "Usage: ./removeEnvironment [all|rds|dynamodb|sg|eks]"
    exit
elif [ $1 == "all" ]; then
    removeSg
    removeDynamoDB
    removeRds
    removeVpc
elif [ $1 == "sg" ]; then
    removeSg
elif [ $1 == "dynamodb" ]; then
    removeDynamoDB
elif [ $1 == "rds" ]; then
    removeRds
elif [ $1 == "eks" ]; then
    removeEks
fi
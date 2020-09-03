#!/bin/bash
## -auto-approve

function createVpc {
    echo "Creating VPC ..."
    cd vpc
    terraform init
    terraform plan
    terraform apply    
}

function createSg {
    echo "Creating Security Group ..."
    cd ../sg
    terraform init
    terraform plan
    terraform apply    
}

function createDynamoDB {
    echo "Creating DynamoDB ..."
    cd ../dynamodb
    terraform init
    terraform plan
    terraform apply    
}

function createRds {
    echo "Creating RDS ..."
    cd ../rds
    terraform init
    terraform plan
    terraform apply    
}

function createIam {
    echo "Creating IAM ..."
    cd ../iam
    terraform init
    terraform plan
    terraform apply    
}

function createEks {
    echo "Creating EKS ..."
    createVpc
    createIam
    createSg
    cd vpc
    # Subnet Private
    declare -a subnetsPrivate
    subnetsPrivate=`terraform output | grep BE-* | awk {'print $3'}`
    SUBPR=1
    for obj in ${subnetsPrivate[@]}; do
        export subnetPrivate$SUBPR=$obj
        ((SUBPR++))
    done
    # Subnet Public
    declare -a subnetsPublic
    subnetsPublic=`terraform output | grep FE-* | awk {'print $3'}`
    SUBPB=1
    for obj in ${subnetsPublic[@]}; do
        export subnetsPublic$SUBPB=$obj
        ((SUBPB++))
    done
    cp ../eks/cluster.yaml newcluster.yaml
    sed -i s/subnet-xxpriv1xx/$subnetPrivate1/g newcluster.yaml
    sed -i s/subnet-xxpriv2xx/$subnetPrivate2/g newcluster.yaml
    sed -i s/subnet-xxpriv3xx/$subnetPrivate3/g newcluster.yaml
    sed -i s/subnet-xxpub1xx/$subnetsPublic1/g newcluster.yaml
    sed -i s/subnet-xxpub2xx/$subnetsPublic2/g newcluster.yaml
    sed -i s/subnet-xxpub3xx/$subnetsPublic3/g newcluster.yaml
    eksctl create cluster -f newcluster.yaml
}

if [ -z $1 ]; then
    echo "Usage: ./createEnvironment [all|vpc|rds|dynamodb|sg|eks]"
    exit
elif [ $1 == "all" ]; then
    createVpc
    createSg
    createDynamoDB
    createRds
elif [ $1 == "sg" ]; then
    createVpc
    createSg
elif [ $1 == "dynamodb" ]; then
    createVpc
    createDynamoDB
elif [ $1 == "rds" ]; then
    createVpc
    createRds
elif [ $1 == "vpc" ]; then
    createVpc
elif [ $1 == "eks" ]; then
    # createVpc
    createEks
fi
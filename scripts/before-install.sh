#!/bin/bash

export ACCESS_KEY=$(aws ssm get-parameter --name "/fibo-stress/access_key" --region $AWS_DEFAULT_REGION --query "Parameter.Value")
export SECRET_ACCESS_KEY=$(aws ssm get-parameter --name "/fibo-stress/secret_access_key"  --region $AWS_DEFAULT_REGION --query "Parameter.Value")
export REGISTRY_USERNAME=$(aws ssm get-parameter --name "/fibo-stress/registry_username" --region $AWS_DEFAULT_REGION --query "Parameter.Value")
export IMAGE_REGISTRY=$(aws ssm get-parameter --name "/fibo-stress/image_registry_url" --region $AWS_DEFAULT_REGION --query "Parameter.Value")

aws ecr get-login-password --region $AWS_DEFAULT_REGION | docker login --username $REGISTRY_USERNAME --password-stdin $IMAGE_REGISTRY
docker pull $IMAGE_REGISTRY/fibo-stress
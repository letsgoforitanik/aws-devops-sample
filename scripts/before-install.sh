#!/bin/bash

export ACCESS_KEY=$(aws ssm get-parameter --name "/fibo-stress/access_key" --query "Parameter.Value")
export SECRET_ACCESS_KEY=$(aws ssm get-parameter --name "/fibo-stress/secret_access_key" --query "Parameter.Value")
export REGISTRY_USERNAME=$(aws ssm get-parameter --name "/fibo-stress/registry_username" --query "Parameter.Value")
export IMAGE_REGISTRY=$(aws ssm get-parameter --name "/fibo-stress/image_registry_url" --query "Parameter.Value")

echo $ACCESS_KEY > abc.txt

#aws configure set aws_access_key_id "$ACCESS_KEY" && aws configure set aws_secret_access_key "$SECRET_ACCESS_KEY"
#aws ecr get-login-password --region $AWS_DEFAULT_REGION | docker login --username "$REGISTRY_USERNAME" --password-stdin $IMAGE_REGISTRY
docker pull public.ecr.aws/e2u5l6n6/fibo-stress:latest
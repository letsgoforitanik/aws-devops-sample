#!/bin/bash

export REGISTRY_USERNAME=$(aws ssm get-parameter --name "/fibo-stress/registry_username" --region ap-south-1 --query "Parameter.Value" | tr -d '"')
export IMAGE_REGISTRY=$(aws ssm get-parameter --name "/fibo-stress/image_registry_url" --region ap-south-1 --query "Parameter.Value" | tr -d '"')
export CODEBUILD_BUILD_NUMBER=$(aws ssm get-parameter --name "/fibo-stress/codebuild_build_number" --region ap-south-1 --query "Parameter.Value" | tr -d '"')

aws ecr get-login-password --region ap-south-1 | docker login --username "$REGISTRY_USERNAME" --password-stdin $IMAGE_REGISTRY
docker image rm -f $(docker image ls -q fibo-stress)
docker pull $IMAGE_REGISTRY/fibo-stress:$CODEBUILD_BUILD_NUMBER
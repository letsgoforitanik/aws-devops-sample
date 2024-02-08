#!/bin/bash

IMAGE_REGISTRY=$(aws ssm get-parameter --name "/fibo-stress/image_registry_url" --region ap-south-1 --query "Parameter.Value" | tr -d '"')
CODEBUILD_BUILD_NUMBER=$(aws ssm get-parameter --name "/fibo-stress/codebuild_build_number" --region ap-south-1 --query "Parameter.Value" | tr -d '"')

docker run -d -p 3000:3000 $IMAGE_REGISTRY/fibo-stress:$CODEBUILD_BUILD_NUMBER

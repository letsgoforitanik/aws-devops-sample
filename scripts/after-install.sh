#!/bin/bash
echo "$IMAGE_REGISTRY/fibo-stress:$CODEBUILD_BUILD_NUMBER" > /home/ubuntu/anik.txt
docker run -d -p 3000:3000 $IMAGE_REGISTRY/fibo-stress:$CODEBUILD_BUILD_NUMBER

#!/bin/bash

ENVIRONMENT="dev"
BUCKET_NAME="<YOUR BUCKET NAME HERE>"
REGION="us-east-1"

terraform \
            init \
            -backend-config "bucket=$BUCKET_NAME" \
            -backend-config "key=$ENVIRONMENT-ec2-image-builder.tfstate" \
            -backend-config "region=$REGION" \
            -backend-config "skip_credentials_validation=true"

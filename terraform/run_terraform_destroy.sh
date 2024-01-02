#!/bin/bash

ENVIRONMENT="dev"

terraform \
                destroy \
                -var-file $ENVIRONMENT.tfvars

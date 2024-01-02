#!/bin/bash

ENVIRONMENT="dev"

terraform \
                plan \
                -var-file $ENVIRONMENT.tfvars \
                -out tfplan.log

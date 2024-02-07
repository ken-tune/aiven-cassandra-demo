#!/bin/bash

# Get login token
source myEnv.sh

# Configuration
source projConfig.sh

# Build Terraform assets
terraform apply -auto-approve 


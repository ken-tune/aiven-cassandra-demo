#!/bin/bash

# Get login token
source aivenToken.sh

# Environment variables
source env.sh

# Build Terraform assets
terraform apply -auto-approve 

# Reset service passwords
useful/resetServicePasswords.sh


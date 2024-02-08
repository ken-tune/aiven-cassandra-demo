#!/bin/bash

. env.sh

# Utility script to get the Cassandra service port
export CASSANDRA_PORT=$(avn service get ${SERVICE_NAME_PREFIX}-cassandra --project $AIVEN_PROJECT --json | jq '.service_uri_params.port' | sed 's/"//g')

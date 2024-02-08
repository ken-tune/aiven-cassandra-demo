#!/bin/bash

. env.sh
# Check we've got our certificates
useful/check-certs.sh

CASSANDRA_PORT=$(avn service get aiven-demo-cassandra --project sa-demo --json | jq '.service_uri_params.port' | sed 's/"//g')

cassandra-stress write n=100k -mode native cql3 user=$AIVEN_ADMIN_USER password=$AIVEN_SERVICE_PASSWORD -node $CASSANDRA_HOST:$CASSANDRA_PORT  \
-transport "truststore=$TRUSTSTORE_LOCATION truststore-password=$TRUSTSTORE_PASSWORD"

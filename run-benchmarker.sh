#!/bin/bash

. env.sh

cassandra-stress write n=100k -mode native cql3 user=$AIVEN_ADMIN_USER password=$AIVEN_SERVICE_PASSWORD -node $CASSANDRA_HOST:$CASSANDRA_PORT  -transport "truststore=$TRUSTSTORE_LOCATION truststore-password=password"

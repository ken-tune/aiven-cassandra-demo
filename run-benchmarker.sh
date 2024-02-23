#!/bin/bash

# Environment variables
. env.sh

# Check we've got our certificates
useful/check-certs.sh

# Get Cassandra port
. useful/get-cassandra-port.sh

CONSISTENCY_LEVEL=QUORUM
RECORD_COUNT=100m
REPLICATION_FACTOR=3
THREADS=16

cassandra-stress write no-warmup cl=$CONSISTENCY_LEVEL  n=$RECORD_COUNT -schema "replication(strategy=SimpleStrategy,factor=$REPLICATION_FACTOR)" -mode native cql3 \
user=$AIVEN_ADMIN_USER password=$AIVEN_SERVICE_PASSWORD -node $CASSANDRA_HOST:$CASSANDRA_PORT -rate threads=$THREADS \
-transport "truststore=$TRUSTSTORE_LOCATION truststore-password=$TRUSTSTORE_PASSWORD"

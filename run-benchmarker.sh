#!/bin/bash

. env.sh
. cassandra-env.sh

cassandra-stress write n=100k -mode native cql3 user=$CASSANDRA_USER password=$CASSANDRA_PASSWORD -node $CASSANDRA_HOST:$CASSANDRA_PORT  -transport "truststore=$TRUSTSTORE_LOCATION truststore-password=password"

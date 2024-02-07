#!/bin/bash

. env.sh
. cassandra-env.sh

cqlsh --ssl -u $CASSANDRA_USER -p $CASSANDRA_PASSWORD $CASSANDRA_HOST $CASSANDRA_PORT

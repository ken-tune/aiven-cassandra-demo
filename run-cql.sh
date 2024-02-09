#!/bin/bash

# Environment variables
. env.sh

# Check we've got our certificates
useful/check-certs.sh

# Get Cassandra port
. useful/get-cassandra-port.sh

cqlsh --ssl -u $AIVEN_ADMIN_USER -p $AIVEN_SERVICE_PASSWORD $CASSANDRA_HOST $CASSANDRA_PORT

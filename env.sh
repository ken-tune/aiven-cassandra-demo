#!/bin/bash

source userSpecific.sh

# Cassandra root directory - needed for cassandra-stress and cqlsh
CASSANDRA_TOOLS_DIR=../downloads/apache-cassandra-4.0.12

# Default Cassandra port on Aiven
CASSANDRA_PORT=13091

# Cassandra host name
CASSANDRA_HOST=callsign-cassandra-${AIVEN_PROJECT}.a.aivencloud.com

# Default cassandra user name
AIVEN_ADMIN_USER=avnadmin

# CA certificate details
CERTS_DIR=certs

# Needed in a truststore for cassandra-stress
TRUSTSTORE_LOCATION=$CERTS_DIR/myTrustStore.jks

# And exported as SSL_CERTFILE for cqlsh
CA_PATH=$CERTS_DIR/ca.pem
export SSL_CERTFILE=$CA_PATH

# Put cqlsh and cassandra-stress in path
PATH=$PATH:$CASSANDRA_TOOLS_DIR/tools/bin:$CASSANDRA_TOOLS_DIR/bin

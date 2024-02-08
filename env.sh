#!/bin/bash

source userSpecific.sh

# Default cassandra user name
AIVEN_ADMIN_USER=avnadmin

# Service name prefix
SERVICE_NAME_PREFIX=aiven-demo

# Cassandra root directory - needed for cassandra-stress and cqlsh
CASSANDRA_TOOLS_DIR=apache-cassandra-4.0.12

# Default Cassandra port on Aiven
CASSANDRA_PORT=13091

# Cassandra host name
CASSANDRA_HOST=${SERVICE_NAME_PREFIX}-cassandra-${AIVEN_PROJECT}.a.aivencloud.com

# CA certificate details
CERTS_DIR=certs

# Needed in a truststore for cassandra-stress
TRUSTSTORE_LOCATION=$CERTS_DIR/myTrustStore.jks

# And exported as SSL_CERTFILE for cqlsh
CA_PATH=$CERTS_DIR/ca.pem
export SSL_CERTFILE=$CA_PATH

# Put cqlsh and cassandra-stress in path
PATH=$PATH:$CASSANDRA_TOOLS_DIR/tools/bin:$CASSANDRA_TOOLS_DIR/bin

# Need to export some variables to Terraform so they can be used
export TF_VAR_project_name=$AIVEN_PROJECT
export TF_VAR_service_name_prefix=$SERVICE_NAME_PREFIX


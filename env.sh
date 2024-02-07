#!/bin/bash

CASSANDRA_TOOLS_DIR=../downloads/apache-cassandra-4.0.12
CASSANDRA_PORT=13091
CASSANDRA_HOST=callsign-cassandra-ktune-demo.a.aivencloud.com

CERTS_DIR=certs
TRUSTSTORE_LOCATION=$CERTS_DIR/myTrustStore.jks
CA_PATH=$CERTS_DIR/ca.pem

export SSL_CERTFILE=$CA_PATH

PATH=$PATH:$CASSANDRA_TOOLS_DIR/tools/bin:$CASSANDRA_TOOLS_DIR/bin

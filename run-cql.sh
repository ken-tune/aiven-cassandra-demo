#!/bin/bash

. env.sh

CASSANDRA_PORT=$(avn service get aiven-demo-cassandra --project sa-demo --json | jq '.service_uri_params.port' | sed 's/"//g')

# Downloading CA
if [ ! -e $CA_PATH ]
then
	echo "Downloading CA file"
	$(avn service user-creds-download --project sa-demo --username avnadmin aiven-demo-cassandra -d $CERTS_DIR >/dev/null 2>&1) 
	keytool -keystore $TRUSTSTORE_LOCATION -alias CARoot -import -file $CA_PATH -storepass $TRUSTSTORE_PASSWORD -noprompt
fi

cqlsh --ssl -u $AIVEN_ADMIN_USER -p $AIVEN_SERVICE_PASSWORD $CASSANDRA_HOST $CASSANDRA_PORT

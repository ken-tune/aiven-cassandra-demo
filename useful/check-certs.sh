# Utility script to download certificates if not previously downloaded

if [ ! -e $CA_PATH ]
then
	echo "CA not found - downloading CA file and creating keystore"
	mkdir -p $CERTS_DIR
	$(avn service user-creds-download --project sa-demo --username avnadmin aiven-demo-cassandra -d $CERTS_DIR >/dev/null 2>&1) 
	keytool -keystore $TRUSTSTORE_LOCATION -alias CARoot -import -file $CA_PATH -storepass $TRUSTSTORE_PASSWORD -noprompt
fi

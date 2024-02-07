#!/bin/bash

source env.sh

avn service user-password-reset callsign-cassandra --project $AIVEN_PROJECT --username $AIVEN_ADMIN_USER --new-password $AIVEN_SERVICE_PASSWORD
avn service user-password-reset callsign-cassandra-logs --project $AIVEN_PROJECT --username $AIVEN_ADMIN_USER --new-password $AIVEN_SERVICE_PASSWORD
avn service user-password-reset callsign-cassandra-grafana --project $AIVEN_PROJECT --username $AIVEN_ADMIN_USER --new-password $AIVEN_SERVICE_PASSWORD

#!/bin/bash

source env.sh

avn service user-password-reset ${SERVICE_NAME_PREFIX}-cassandra --project $AIVEN_PROJECT --username $AIVEN_ADMIN_USER --new-password $AIVEN_SERVICE_PASSWORD
avn service user-password-reset ${SERVICE_NAME_PREFIX}-cassandra-logs --project $AIVEN_PROJECT --username $AIVEN_ADMIN_USER --new-password $AIVEN_SERVICE_PASSWORD
avn service user-password-reset ${SERVICE_NAME_PREFIX}-cassandra-grafana --project $AIVEN_PROJECT --username $AIVEN_ADMIN_USER --new-password $AIVEN_SERVICE_PASSWORD

variable "aiven_api_token" {}
variable "project_name" {}
variable "service_cloud" {}
variable "service_name_prefix" {}
variable "service_plan_cassandra" {}
variable "service_plan_influx" {}
variable "service_plan_opensearch" {}
variable "service_plan_grafana" {}

variable "ips" {
    type = list(object({
        network  = string,
        description = string
    }))
}

terraform {
  required_providers {
    aiven = {
      source = "aiven/aiven"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
}

provider "aiven" {
  api_token = var.aiven_api_token
}

###################################################
# Cassandra
###################################################

resource "aiven_cassandra" "demo-cassandra" {
  project                 = var.project_name
  cloud_name              = var.service_cloud
  plan                    = var.service_plan_cassandra
  service_name            = "${var.service_name_prefix}-cassandra"

  cassandra_user_config {

    dynamic ip_filter_object {
      for_each = var.ips
      content {
        network = ip_filter_object.value["network"]
        description =ip_filter_object.value["description"]
      }
    }
  }

}

###################################################
# Opensearch
###################################################

resource "aiven_opensearch" "demo-cassandra-logs" {
  project = var.project_name
  cloud_name = var.service_cloud
  plan = var.service_plan_opensearch
  service_name = "${var.service_name_prefix}-cassandra-logs"
}

###################################################
# InfluxDB
###################################################

resource "aiven_influxdb" "demo-cassandra-ts-db"{
  project = var.project_name
  cloud_name = var.service_cloud
  plan = var.service_plan_influx
  service_name = "${var.service_name_prefix}-cassandra-influxdb"
}

###################################################
# Grafana
###################################################

resource "aiven_grafana" "demo-cassandra-grafana"{
  project = var.project_name
  cloud_name = var.service_cloud
  plan = var.service_plan_grafana
  service_name = "${var.service_name_prefix}-cassandra-grafana"
}

###################################################
# Integrations
###################################################
###################################################

###################################################
# Cxndra -> OpenSearch (Logs)
###################################################

resource "aiven_service_integration" "demo-cassandra-logs-integration"{
  project = var.project_name
  integration_type = "logs"
  source_service_name = aiven_cassandra.demo-cassandra.service_name
  destination_service_name = aiven_opensearch.demo-cassandra-logs.service_name

  depends_on = [
    aiven_cassandra.demo-cassandra,aiven_opensearch.demo-cassandra-logs
  ]
}

###################################################
# Cxndra -> InfluxDB (Metrics)
###################################################

resource "aiven_service_integration" "demo-cassandra-metrics-integration"{
  project = var.project_name
  integration_type = "metrics"
  source_service_name = aiven_cassandra.demo-cassandra.service_name
  destination_service_name = aiven_influxdb.demo-cassandra-ts-db.service_name

  depends_on = [
    aiven_cassandra.demo-cassandra,aiven_influxdb.demo-cassandra-ts-db
  ]

}

###################################################
# InfluxDB -> Grafana (Metrics)
###################################################

resource "aiven_service_integration" "demo-cassandra-grafana-integration"{
  project = var.project_name
  integration_type = "dashboard"
  destination_service_name = aiven_influxdb.demo-cassandra-ts-db.service_name
  source_service_name = aiven_grafana.demo-cassandra-grafana.service_name

  depends_on = [
    aiven_influxdb.demo-cassandra-ts-db,aiven_grafana.demo-cassandra-grafana
  ]

}

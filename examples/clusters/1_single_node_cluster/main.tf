provider "databricks" {
  host  = var.workspace_url
  token = var.dapi_token
}

terraform {
  required_providers {
    databricks = {
      source  = "databrickslabs/databricks"
      version = "~> 0.5.7"
    }
  }
}

module "databricks_workspace_management" {
  source = "../../../"
  # ------------------------------------------------
  # CLUSTER
  # ------------------------------------------------
  deploy_cluster = true
  fixed_value    = 0

  libraries = {
    maven = {
      "com.microsoft.azure:azure-eventhubs-spark_2.12:2.3.21" = {}
    }
    python_wheel = {}
  }

  # ------------------------------------------------
  # Do not change the teamid, prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}

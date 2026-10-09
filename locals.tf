locals {
  # Abreviaturas de región según la guía de Microsoft (Cloud Adoption Framework).
  region_short = {
    mexicocentral  = "mxc"
    northcentralus = "ncus"
    eastus         = "eus"
    eastus2        = "eus2"
    westus         = "wus"
    southcentralus = "scus"
  }

  location = var.location

  # Ej: utvt-integradora-qa-ncus-001  ->  rg-utvt-integradora-qa-ncus-001
  suffix = "${var.organization}-${var.project_name}-${var.environment}-${lookup(local.region_short, var.location, var.location)}-001"

  tags = merge(
    var.tags,
    {
      project     = var.project_name
      environment = var.environment
      location    = var.location
    }
  )
}

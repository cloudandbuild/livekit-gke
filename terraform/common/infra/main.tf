# Provider
terraform {
  required_version = ">= 1.5"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
    random = {
      version = "~> 3.0"
    }
  }
}
provider "google" {
  project = local.base.project
  region  = local.base.region
}
# Variables

# Main
module "gke" {
  source                       = "../../modules/gke"
  project                      = local.base.project
  env                          = local.base.env
  location                     = "${local.base.region}-${local.zone}"
  network                      = local.base.vpc.self_link
  public_subnet                = local.base.subnet.public_subnetwork
  cluster_secondary_range_name = local.base.subnet.public_subnetwork_secondary_range_name
}

# Output
output "vpc" {
  value       = local.base.vpc
  description = "module vpc"
}
output "subnet" {
  value       = local.base.subnet
  description = "module subnet"
}
output "project" {
  value = local.base.project
}
output "name" {
  value = local.base.name
}
output "env" {
  value = local.base.env
}
output "region" {
  value = local.base.region
}

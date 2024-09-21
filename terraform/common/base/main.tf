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
  project = local.project
  region  = local.region
}

# Variables
variable "project_id" {
  type = string
}
variable "region" {
  type    = string
  default = "asia-northeast1"
}

locals {
  name    = "livekit-gke"
  project = var.project_id
  region  = var.region
  activate_apis = [
    "compute.googleapis.com",
    "container.googleapis.com",
    "containeranalysis.googleapis.com",
    "monitoring.googleapis.com",
    "oslogin.googleapis.com",
  ]
}

# Main
module "project-services" {
  source        = "../../modules/project_services"
  project       = local.project
  activate_apis = local.activate_apis
}

module "vpc" {
  source  = "../../modules/backend/vpc"
  project = local.project
  env     = local.env
}
module "router" {
  source        = "../../modules/backend/router"
  env           = local.env
  project       = local.project
  region        = local.region
  vpc_self_link = module.vpc.self_link
}
module "subnet" {
  source   = "../../modules/backend/subnet"
  env      = local.env
  region   = local.region
  vpc_name = module.vpc.vpc_name
}
module "nat" {
  source           = "../../modules/backend/nat"
  project          = local.project
  region           = local.region
  env              = local.env
  router_name      = module.router.router_name
  subnet_self_link = module.subnet.subnet_public_self_link
}
module "firewall" {
  source        = "../../modules/backend/firewall"
  env           = local.env
  vpc_name      = module.vpc.vpc_name
  ip_cidr_range = module.subnet.ip_cidr_range
}

# Outputs
output "vpc" {
  value       = module.vpc
  description = "module vpc"
}
output "subnet" {
  value       = module.subnet
  description = "module subnet"
}
output "project" {
  value = local.project
}
output "name" {
  value = local.name
}
output "env" {
  value = local.env
}
output "region" {
  value = local.region
}

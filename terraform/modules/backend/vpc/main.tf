# Create VPC
resource "google_compute_network" "vpc" {
  provider                = google-beta
  project                 = var.project
  name                    = "${var.env}-vpc"
  auto_create_subnetworks = "false"
}

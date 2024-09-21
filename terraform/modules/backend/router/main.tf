resource "google_compute_router" "router" {
  name     = "${var.env}-router"
  provider = google-beta

  project = var.project
  region  = var.region
  network = var.vpc_self_link
}

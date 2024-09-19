# VPC firewall configuration
# Create a firewall rule that allows internal communication across all protocols:
resource "google_compute_firewall" "firewalli-int" {
  name    = "${var.env}-firewall-int"
  network = var.vpc_name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
  }

  allow {
    protocol = "udp"
  }

  source_ranges = [var.ip_cidr_range]
}

resource "google_compute_firewall" "allow-ingress-from-iap" {
  name    = "${var.env}-allow-ingress-from-iap"
  network = var.vpc_name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["35.235.240.0/20"] # IAP
}

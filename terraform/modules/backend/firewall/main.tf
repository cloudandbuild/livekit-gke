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

resource "google_compute_firewall" "allow-livekit" {
  name    = "${var.env}-allow-livekit"
  network = var.vpc_name

  allow {
    protocol = "tcp"
    ports    = ["7881"]
  }
  allow {
    protocol = "udp"
    ports    = ["50000-60000"]
  }

  source_ranges = ["0.0.0.0/0"]
}

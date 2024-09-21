# network subnet output

output "ip_cidr_range" {
  value       = google_compute_subnetwork.subnet_public.ip_cidr_range
  description = "Export created CICDR range"
}

output "subnet_name" {
  value       = google_compute_subnetwork.subnet_public.name
  description = "Export created CICDR range"
}

output "subnet_public_self_link" {
  value       = google_compute_subnetwork.subnet_public.self_link
  description = "Export subnet public self link"
}

# ---------------------------------------------------------------------------------------------------------------------
# Public Subnetwork Outputs
# ---------------------------------------------------------------------------------------------------------------------

output "public_subnetwork" {
  description = "A reference (self_link) to the public subnetwork"
  value       = google_compute_subnetwork.subnet_public.self_link
}

output "public_subnetwork_name" {
  description = "Name of the public subnetwork"
  value       = google_compute_subnetwork.subnet_public.name
}

output "public_subnetwork_cidr_block" {
  value = google_compute_subnetwork.subnet_public.ip_cidr_range
}

output "public_subnetwork_gateway" {
  value = google_compute_subnetwork.subnet_public.gateway_address
}

output "public_subnetwork_secondary_cidr_block" {
  value = google_compute_subnetwork.subnet_public.secondary_ip_range[0].ip_cidr_range
}

output "public_subnetwork_secondary_range_name" {
  value = google_compute_subnetwork.subnet_public.secondary_ip_range[0].range_name
}

# ---------------------------------------------------------------------------------------------------------------------
# Private Subnetwork Outputs
# ---------------------------------------------------------------------------------------------------------------------

output "private_subnetwork" {
  description = "A reference (self_link) to the private subnetwork"
  value       = google_compute_subnetwork.subnet_private.self_link
}

output "private_subnetwork_name" {
  description = "Name of the private subnetwork"
  value       = google_compute_subnetwork.subnet_private.name
}

output "private_subnetwork_cidr_block" {
  value = google_compute_subnetwork.subnet_private.ip_cidr_range
}

output "private_subnetwork_gateway" {
  value = google_compute_subnetwork.subnet_private.gateway_address
}

output "private_subnetwork_secondary_cidr_block" {
  value = google_compute_subnetwork.subnet_private.secondary_ip_range[0].ip_cidr_range
}

output "private_subnetwork_secondary_range_name" {
  value = google_compute_subnetwork.subnet_private.secondary_ip_range[0].range_name
}

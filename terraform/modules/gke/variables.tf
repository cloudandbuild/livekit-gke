variable "project" {
  description = "The project ID for the network"
  type        = string
}
variable "env" {
}
variable "location" {
  description = "The location for the network"
  type        = string
}
variable "network" {
  description = "The network name"
  type        = string
}
variable "public_subnet" {
  description = "The public subnet name"
  type        = string
}
variable "cluster_secondary_range_name" {
  description = "The name of the secondary range for the cluster"
  type        = string
}

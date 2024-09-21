# Subnet variables
variable "project" {
  description = "The project ID for the network"
  type        = string
}

variable "region" {
  description = "Region of resources"
}

variable "vpc_self_link" {
  description = "VPC Self Link"
}

variable "env" {

}
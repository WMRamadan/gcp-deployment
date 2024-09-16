variable "project_id" {
  description = "The project ID to deploy to"
  type        = string
}

variable "region" {
  description = "The region to deploy the resources"
  type        = string
}

variable "zone" {
  description = "The zone to deploy the resources"
  type        = string
}

variable "deny_ip_ranges_ipv4" {
  description = "List of IPv4 ranges to deny"
  type        = list(string)
}

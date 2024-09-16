provider "google" {
  project = var.project_id
  region  = var.region
}

# VPC
resource "google_compute_network" "vpc" {
  name                    = "${var.project_id}-vpc"
  auto_create_subnetworks = "false"
}

# Subnet
resource "google_compute_subnetwork" "subnet" {
  name          = "${var.project_id}-subnet"
  region        = var.region
  network       = google_compute_network.vpc.name
  ip_cidr_range = "10.10.0.0/24"
}

# Deny access
resource "google_compute_firewall" "deny_all_other_access" {
  name    = "${var.project_id}-deny-all-other-access"
  network = google_compute_network.vpc.name
  priority = 1000  # Priority for deny rules

  deny {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["10.26.32.12/32", "19.104.105.29/32"]  # Deny traffic from IP addresses

  target_tags = ["gke-node"]
}

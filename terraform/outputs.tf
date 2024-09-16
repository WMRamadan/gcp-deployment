output "gke_endpoint" {
  description = "The GKE master endpoint"
  value       = google_container_cluster.primary.endpoint
}

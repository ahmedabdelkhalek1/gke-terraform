output "region" {
  value       = var.region
  description = "GCloud Region"
}

output "kubernetes_cluster_name" {
  value       = google_container_cluster.primary.name
  description = "GKE Cluster Name"
}

output "kubernetes_cluster_host" {
  value       = google_container_cluster.primary.endpoint
  description = "GKE Cluster Host"
}

output "cluster_ca_certificate" {
  value       = google_container_cluster.primary.master_auth[0].cluster_ca_certificate
  description = "Base64 encoded cluster CA certificate"
}

output "client_certificate" {
  value       = google_container_cluster.primary.master_auth[0].client_certificate
  description = "Base64 encoded client certificate"
}

output "client_key" {
  value       = google_container_cluster.primary.master_auth[0].client_key
  description = "Base64 encoded client key"
}

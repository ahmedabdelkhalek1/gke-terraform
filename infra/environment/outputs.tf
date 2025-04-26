output "region" {
  value       = var.region
  description = "GCloud Region"
}

output "kubernetes_cluster_name" {
  value       = module.gke_demo.kubernetes_cluster_name
  description = "GKE Cluster Name"
}

output "kubernetes_cluster_host" {
  value       = module.gke_demo.kubernetes_cluster_host
  description = "GKE Cluster Host"
}
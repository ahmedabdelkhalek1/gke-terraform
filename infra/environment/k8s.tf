provider "kubernetes" {
  host                   = module.gke_demo.kubernetes_cluster_host
  cluster_ca_certificate = base64decode(module.gke_demo.cluster_ca_certificate)
  client_certificate     = base64decode(module.gke_demo.client_certificate)
  client_key             = base64decode(module.gke_demo.client_key)
}

# Removed deployment from terraform to move to GitHub Actions pipeline

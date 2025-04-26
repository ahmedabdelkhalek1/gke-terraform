resource "google_container_node_pool" "primary_nodes" {
  name     = "primary-node-pool"
  location = var.region
  cluster  = google_container_cluster.primary.name

  node_locations = var.node_locations

  node_count = 2

  version = data.google_container_engine_versions.gke_version.release_channel_latest_version["STABLE"]

  node_config {
    machine_type = var.machine_type

    # Google recommended default scopes
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/devstorage.read_only"
    ]
  }
}
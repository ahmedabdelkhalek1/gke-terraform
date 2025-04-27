resource "google_container_node_pool" "primary_nodes" {
  name     = "primary-node-pool"
  location = var.region
  cluster  = google_container_cluster.primary.name

  node_locations = var.node_locations

  node_count = 2 #numbers of nodes per zone


  version = data.google_container_engine_versions.gke_version.release_channel_latest_version["STABLE"]

  node_config {

    # Google recommended default scopes
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/devstorage.read_only"
    ]
    labels = {
      env = var.project_id
    }

    # Reduce disk size from default 100GB to 50GB or smaller
    disk_size_gb = 40
    disk_type    = "pd-standard" # Changed from pd-ssd to pd-standard
    machine_type = var.machine_type
    tags         = ["gke-node", "${var.project_id}-gke"]
    metadata = {
      disable-legacy-endpoints = "true"
    }

  }
}
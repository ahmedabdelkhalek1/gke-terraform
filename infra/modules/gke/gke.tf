data "google_container_engine_versions" "gke_version" {
  location       = var.region
  version_prefix = var.version_prefix
}

resource "google_container_cluster" "primary" {
  # On version 5.0.0+ of the provider, you must explicitly set deletion_protection = false
  deletion_protection = false

  name     = "${var.project_id}-cluster"
  location = var.region

  # Use a zonal cluster instead of regional for free tier
  node_locations = var.node_locations

  remove_default_node_pool = true
  initial_node_count       = 1

  network    = google_compute_network.vpc.name
  subnetwork = google_compute_subnetwork.subnet.name

  ip_allocation_policy {
    cluster_secondary_range_name  = "pod-range"
    services_secondary_range_name = "service-range"
  }

  networking_mode = "VPC_NATIVE"
}
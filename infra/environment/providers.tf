provider "google" {
  project = var.project_id
  region  = var.region
}

terraform {
  backend "gcs" {
    bucket = "devoteam-tf-demo"
  }
}

# === Enable the Container (GKE) API ===
resource "google_project_service" "container" {
  service = "container.googleapis.com"
  project = var.project_id

  # optional: ensure enabling happens before you read versions
  disable_on_destroy = false
}

# You can now safely call your data source:
data "google_container_engine_versions" "gke_version" {
  provider   = google
  depends_on = [google_project_service.container]
}
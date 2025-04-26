module "gke_demo" {
  source         = "../modules/gke"
  node_locations = var.node_locations
  project_id     = var.project_id
  version_prefix = local.version_prefix
  machine_type   = local.machine_type
}
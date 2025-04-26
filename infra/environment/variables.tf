variable "project_id" {
  description = "GCP project id"
  type        = string
}

variable "region" {
  description = "region"
  default     = "us-east1" # Free tier region
  type        = string
}

variable "node_locations" {
  description = "Availability zone of the GKE nodes"
  type        = list(string)
}

variable "node_ip_range" {
  default     = "10.0.0.0/16"
  description = "IP address range of GKE nodes"
  type        = string
}

variable "pod_ip_range" {
  default     = "10.1.0.0/16"
  description = "IP address range of k8s pods"
  type        = string
}

variable "service_ip_range" {
  default     = "10.2.0.0/16"
  description = "IP address range of k8s services"
  type        = string
}
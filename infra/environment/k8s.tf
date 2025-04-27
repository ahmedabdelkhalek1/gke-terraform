provider "kubernetes" {
  host                   = module.gke_demo.kubernetes_cluster_host
  cluster_ca_certificate = base64decode(module.gke_demo.cluster_ca_certificate)
  client_certificate     = base64decode(module.gke_demo.client_certificate)
  client_key             = base64decode(module.gke_demo.client_key)
}

resource "null_resource" "deploy_microservices_demo" {
  provisioner "local-exec" {
    command = <<EOT
      kubectl apply -f https://raw.githubusercontent.com/GoogleCloudPlatform/microservices-demo/master/release/kubernetes-manifests.yaml
    EOT
    environment = {
      KUBECONFIG = "${path.module}/kubeconfig"
    }
  }
  triggers = {
    always_run = timestamp()
  }
}

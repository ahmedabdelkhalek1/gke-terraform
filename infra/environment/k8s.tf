provider "kubernetes" {
  host                   = module.gke_demo.kubernetes_cluster_host
  cluster_ca_certificate = base64decode(module.gke_demo.cluster_ca_certificate)
  client_certificate     = base64decode(module.gke_demo.client_certificate)
  client_key             = base64decode(module.gke_demo.client_key)
}

resource "null_resource" "download_manifest" {
  provisioner "local-exec" {
    command = "curl -o ${path.module}/microservices-demo.yaml https://raw.githubusercontent.com/GoogleCloudPlatform/microservices-demo/master/release/kubernetes-manifests.yaml"
  }
  triggers = {
    always_run = timestamp()
  }
}

resource "kubernetes_manifest" "microservices_demo" {
  depends_on = [null_resource.download_manifest]
  manifest   = yamldecode(file("${path.module}/microservices-demo.yaml"))
}

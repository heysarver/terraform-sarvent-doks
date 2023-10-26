terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.31.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.11.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.23.0"
    }
  }
}

provider "kubernetes" {
  host  = digitalocean_kubernetes_cluster.main.endpoint
  token = digitalocean_kubernetes_cluster.main.kube_config[0].token
  cluster_ca_certificate = base64decode(
    digitalocean_kubernetes_cluster.main.kube_config[0].cluster_ca_certificate
  )
}

provider "helm" {
  kubernetes {
    host = "${digitalocean_kubernetes_cluster.testcluster.endpoint}"
    client_certificate     = "${base64decode(digitalocean_kubernetes_cluster.main.kube_config[0].client_certificate)}"
    client_key             = "${base64decode(digitalocean_kubernetes_cluster.main.kube_config[0].client_key)}"
    cluster_ca_certificate = "${base64decode(digitalocean_kubernetes_cluster.main.kube_config[0].cluster_ca_certificate)}"
  }
}

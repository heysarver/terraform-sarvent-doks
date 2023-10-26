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

locals {
  cluster_endpoint = digitalocean_kubernetes_cluster.main.endpoint
  kube_config = digitalocean_kubernetes_cluster.main.kube_config.0
}

provider "kubernetes" {
  host                   = local.cluster_endpoint
  token                  = local.kube_config.token
  cluster_ca_certificate = base64decode(local.kube_config.cluster_ca_certificate)
}

provider "helm" {
  kubernetes {
    host                   = local.cluster_endpoint
    client_certificate     = base64decode(local.kube_config.client_certificate)
    client_key             = base64decode(local.kube_config.client_key)
    cluster_ca_certificate = base64decode(local.kube_config.cluster_ca_certificate)
  }
}

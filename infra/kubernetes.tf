data "digitalocean_kubernetes_versions" "main" {
  version_prefix = var.k8s_version_prefix
}

resource "digitalocean_kubernetes_cluster" "main" {
  name         = var.cluster_name
  region       = var.cluster_region
  auto_upgrade = var.cluster_auto_upgrade
  version      = data.digitalocean_kubernetes_versions.main.latest_version
  vpc_uuid     = var.cluster_vpc_uuid != "" ? var.cluster_vpc_uuid : null


  maintenance_policy {
    start_time = var.cluster_mainentance_start_time
    day        = var.cluster_maintenance_day
  }

  node_pool {
    name       = var.default_node_pool_name
    size       = var.default_node_pool_size
    auto_scale = var.default_node_auto_scale
    min_nodes  = var.default_node_min_nodes
    max_nodes  = var.default_node_max_nodes
  }
}

variable "k8s_version_prefix" {
  default = "1.28."
}

variable "cluster_name" {
  default = "k8s-default"
}

variable "cluster_region" {
  default = "nyc1"
}

variable "cluster_auto_upgrade" {
  default = false
}

variable "cluster_mainentance_start_time" {
  default = "05:00"
}

variable "cluster_maintenance_day" {
  default = "sunday"
}

variable "default_node_pool_name" {
  default = "main"
}

variable "default_node_pool_size" {
  default = "s-4vcpu-8gb"
}

variable "default_node_auto_scale" {
  default = "true"
}

variable "default_node_min_nodes" {
  default = "4"
}

variable "default_node_max_nodes" {
  default = "7"
}

locals {
  cluster_id = yandex_kubernetes_cluster.cluster.id
}

output "cluster_endpoint" {
  value = yandex_kubernetes_cluster.cluster.master[0].external_v4_endpoint
}

output "cluster_version_info" {
  value = yandex_kubernetes_cluster.cluster.master[0].version_info[0]
}

output "yc_add_cluster_command" {
  description = "Command to add the cluster to config of kubectl with proprietary yc tool"
  value       = "yc managed-kubernetes cluster get-credentials --id ${local.cluster_id} --external"
}

output "cluster_endpoint" {
  value = yandex_kubernetes_cluster.cluster.master[0].external_v4_endpoint
}

output "cluster_version_info" {
  value = yandex_kubernetes_cluster.cluster.master[0].version_info[0]
}

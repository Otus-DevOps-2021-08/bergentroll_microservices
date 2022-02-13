provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}

data "yandex_iam_service_account" "choosen" {
  name = var.service_account
}

data "yandex_vpc_network" "choosen" {
  name = var.network
}

resource "yandex_kubernetes_cluster" "cluster" {
  name                    = "otus-devops-app"
  service_account_id      = data.yandex_iam_service_account.choosen.id
  node_service_account_id = data.yandex_iam_service_account.choosen.id
  network_id              = data.yandex_vpc_network.choosen.id

  master {
    version   = var.k8s_version
    public_ip = true
    zonal { zone = var.zone }
  }
}

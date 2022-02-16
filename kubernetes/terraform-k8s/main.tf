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
  network_policy_provider = "CALICO"

  master {
    version   = var.k8s_version
    public_ip = true
    zonal { zone = var.zone }
  }
}

resource "yandex_vpc_subnet" "choosen" {
  network_id     = data.yandex_vpc_network.choosen.id
  zone           = var.zone
  v4_cidr_blocks = [var.subnet_cidr]
}

resource "yandex_kubernetes_node_group" "node_group" {
  name       = "dev"
  cluster_id = yandex_kubernetes_cluster.cluster.id

  instance_template {
    resources {
      memory        = var.node_memory
      cores         = var.node_cores_num
      core_fraction = var.node_core_fraction
    }

    scheduling_policy {
      preemptible = var.node_preemptible
    }

    boot_disk {
      size = var.node_disk_size
      type = "network-ssd"
    }

    network_interface {
      nat        = true
      subnet_ids = ["${yandex_vpc_subnet.choosen.id}"]
    }
  }

  scale_policy {
    fixed_scale {
      size = var.node_group_size
    }
  }
}

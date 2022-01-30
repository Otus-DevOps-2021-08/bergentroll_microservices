provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}

locals {
  instance_ip_list = yandex_compute_instance.cluster[*].network_interface[0].nat_ip_address
  hosts = [
    for i in yandex_compute_instance.cluster :
    {
      "name"    = i.name,
      "address" = i.network_interface[0].nat_ip_address
    }
  ]
}

data "yandex_compute_image" "choosen" {
  family = var.disk_image_family
}

data "yandex_vpc_subnet" "choosen" {
  name = var.subnet_name
}

resource "yandex_compute_instance" "cluster" {
  count                     = var.instance_num
  name                      = "${var.instance_prefix}-${count.index + 1}"
  platform_id               = "standard-v2"
  allow_stopping_for_update = true

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}}"
  }

  resources {
    cores         = var.cores_num
    core_fraction = var.core_fraction
    memory        = var.memory
  }

  scheduling_policy {
    preemptible = var.preemptible
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.choosen.id
      size     = var.disk_size
    }
  }

  network_interface {
    subnet_id = data.yandex_vpc_subnet.choosen.subnet_id
    nat       = true
  }
}

resource "local_file" "inventory_json" {
  content = "${jsonencode(
    {
      "masters" = {
        "hosts" = {
          for host in slice(local.hosts, 0, 1) :
          host.name => { "ansible_host" : host.address }
        },
      },
      "nodes" = {
        "hosts" = {
          for host in slice(local.hosts, 1, length(local.hosts)) :
          host.name => { "ansible_host" : host.address }
        }
      },
    }
  )}\n"
  filename        = "${var.inventory_output_dir}/inventory.json"
  file_permission = "644"
}

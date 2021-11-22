provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}

locals {
  instance_ip_list = yandex_compute_instance.monolith[*].network_interface[0].nat_ip_address
}

data "yandex_compute_image" "choosen" {
  family    = var.disk_image_family
  folder_id = var.folder_id
}

data "yandex_vpc_subnet" "choosen" {
  name = var.subnet_name
}

resource "yandex_compute_instance" "monolith" {
  count                     = var.instance_num
  name                      = "reddit-monolith-${count.index}"
  platform_id               = "standard-v2"
  allow_stopping_for_update = true

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}}"
  }

  resources {
    cores         = 2
    core_fraction = 5
    memory        = 1
  }

  boot_disk {
    initialize_params { image_id = data.yandex_compute_image.choosen.id }
  }

  network_interface {
    subnet_id = data.yandex_vpc_subnet.choosen.subnet_id
    nat       = true
  }
}

resource "null_resource" "deploy" {
  count = length(local.instance_ip_list)

  connection {
    type        = "ssh"
    host        = local.instance_ip_list[count.index]
    user        = "ubuntu"
    agent       = false
    private_key = file(var.private_key_path)
  }
}

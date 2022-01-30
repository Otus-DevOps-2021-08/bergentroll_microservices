output "hosts" {
  description = "Provisioned hosts"
  value       = local.hosts
}

output "image_name" {
  description = "Name of image used to set up hosts"
  value       = data.yandex_compute_image.choosen.name
}

output "compute_instance_ids" {
  value = yandex_compute_instance.cluster[*].id
}

output "external_ip_addresses" {
  description = "Assigned instance IPv4 address"
  value       = local.address_book
}

output "image_name" {
  description = "Name of image used to set up hosts"
  value       = data.yandex_compute_image.choosen.name
}

output "compute_instance_ids" {
  value = yandex_compute_instance.monolith[*].id
}

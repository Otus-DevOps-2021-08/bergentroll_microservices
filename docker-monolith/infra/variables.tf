variable "cloud_id" {}

variable "folder_id" {}

variable "zone" { default = "ru-central1-a" }

variable "service_account_key_file" {
  description = "YC secrets JSON file"
}

variable "instance_num" {
  description = "Amount of application hosts"
  type        = number
  default     = 1
}

variable "public_key_path" {
  description = "Path to the public key used for SSH access"
}

variable "private_key_path" {
  description = "Path to the private key used for SSH access"
}

variable "disk_image_family" { default = "ubuntu-1804-lts" }

variable "subnet_name" {}

variable "name_prefix" { default = "" }

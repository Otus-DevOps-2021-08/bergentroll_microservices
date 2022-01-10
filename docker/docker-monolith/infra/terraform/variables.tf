variable "cloud_id" {}

variable "folder_id" {}

variable "zone" { default = "ru-central1-a" }

variable "service_account_key_file" {
  description = "YC secrets JSON file"
}

variable "instance_prefix" {
  description = "Name of instances"
  default     = "reddit-monolith"
}

variable "instance_num" {
  description = "Amount of application hosts"
  type        = number
  default     = 1
}

variable "core_fraction" {
  description = "Assured vCPU time percent"
  type        = number
  default     = 5
}

variable "memory" {
  description = "RAM amount for an instance in GB"
  type        = number
  default     = 1
}

variable "disk_size" {
  description = "Storage size in GB"
  type        = number
  default     = 10
}

variable "preemptible" {
  description = "Allow the cloud to interrupt an instance"
  type        = bool
  default     = false
}

variable "public_key_path" {
  description = "Path to the public key used for SSH access"
}

variable "private_key_path" {
  description = "Path to the private key used for SSH access"
}

variable "disk_image_family" { default = "docker" }

variable "subnet_name" {}

variable "inventory_output_dir" {
  description = "Directory to put generated Ansible inventory file"
}

variable "cloud_id" {}

variable "folder_id" {}

variable "zone" { default = "ru-central1-a" }

variable "service_account" {}

variable "service_account_key_file" { description = "YC secrets JSON file" }

variable "k8s_version" { default = "1.19" }

variable "network" { default = "default" }

variable "subnet_cidr" { default = "10.1.0.0/16" }

variable "node_group_size" { default = 2 }

variable "node_cores_num" {
  description = "Per node number of CPU cores"
  type        = number
  default     = 4
}

variable "node_core_fraction" {
  description = "Per node assured vCPU time percent"
  type        = number
  default     = 50
}

variable "node_memory" {
  description = "Per node RAM amount for an instance in GB"
  type        = number
  default     = 8
}

variable "node_disk_size" {
  description = "Per node storage size in GB"
  type        = number
  default     = 64
}

variable "node_preemptible" {
  description = "Allow the cloud to interrupt nodes"
  type        = bool
  default     = false
}

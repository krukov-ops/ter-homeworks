###cloud vars
#variable "token" {
#  type        = string
#  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
#}

variable "cloud_id" {
  type        = string
#  default     = file("~/.authorized_key4.json")
  default     = "b1g1odr3a58u7kekm0k4"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
#  default     = file("~/.authorized_key3.json")
  default     = "b1gao12179jdnmktdmo8"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "service_account_key_file" {
  type        = string
#  default     = file("~/.authorized_key2.json")
  default     = "ajeoem45pau8j4kf2tid"
  description = "Path to service account key file"  
}

	
variable "compute_image_family" {
  type        = string
  default     = "ubuntu-2204-lts"
  description = "Compute image family"
  
}

variable "common_metadata" {
  description = "Common metadata for instances"
  type = map(string)
  default = {
    serial-port-enable = "1"
  }
}

variable "public_key_path" {
  type        = string
  default     = "~/.ssh/nika.pub"
  description = "Path to the public key"
}

variable "each_vm" {
  type = list(object({
    vm_name     = string
    cpu         = number
    ram         = number      # GB
    disk_volume = number      # GB
    platform_id = string
  }))

  default = [
    { vm_name = "main",    cpu = 2, ram = 4,  disk_volume = 15, platform_id = "standard-v3" },
    { vm_name = "replica", cpu = 4, ram = 8,  disk_volume = 20, platform_id = "standard-v3" },
  ]
}

variable "default_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "Platform ID for VM"
}
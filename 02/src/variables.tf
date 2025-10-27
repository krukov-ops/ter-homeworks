###cloud vars


#variable "token" {
#  type        = string
#  default     = "y0_AgAAAAA7KsNxAATuwQAAAAEZl1E6AAA-mOVo62lOB7Giz6Hnqb1a08kpBQ"
#  description = "id"
#}



variable "cloud_id" {
  type        = string
  default     = "b1g1odr3a58u7kekm0k4"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
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
  description = "VPC network & subnet name"
}


###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIA3s04LSlGaHdiakRDATQs/mCGbeVeprpo+rYGxHW5ex kruko@MSI"
  description = "ssh-keygen -t ed25519"
}

variable "compute_image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Family of the compute image to use, e.g., ubuntu-2004-lts"
  
}

variable "instance_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "Name of the compute instance"  
}

variable "platform_id" {
  type        = string
  default     = "standard-v3"
  description = "Platform ID for the compute instance, e.g., standard-v3"  
}

variable "vm_db_image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Family of the compute image for the database VM"
}

variable "vm_db_default_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "Default zone for the database VM"
}

variable "vm_db_instance_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "Name of the database VM instance"
}
variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "Platform ID for the database VM, e.g., standard-v3"
}

variable "vm_db_vpc_name" {
  type        = string
  default     = "develop-db"
  description = "VPC network & subnet name"
}

variable "vm_db_default_cidr" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "Default CIDR for the database VM"
}

variable "vms_resources" {
  description = "CPU/RAM/fraction/hdd config for both VMs"
  type = map(object({
    cores         : number
    memory        : number
    core_fraction : number
  }))
  default = {
    web = {
      cores         = 2
      memory        = 1
      core_fraction = 20
    }
    db = {
      cores         = 2
      memory        = 1
      core_fraction = 20
    }
  }
}


variable "common_metadata" {
  description = "Common metadata for instances"
  type = map(string)
  default = {
    serial-port-enable = "1"
  }
}
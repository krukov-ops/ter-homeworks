terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=1.8.4"
}

provider "yandex" {
  token     = file("~/.authorized_key.json")
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.default_zone
}
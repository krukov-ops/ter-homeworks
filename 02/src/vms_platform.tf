
data "yandex_compute_image" "db" {
  family = var.vm_db_image_family
}

resource "yandex_vpc_subnet" "vm_db_develop" {
  name           = var.vm_db_vpc_name
  zone           = var.vm_db_default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.vm_db_default_cidr
}

resource "yandex_compute_instance" "vm_db_platform" {
  name        = local.vm_db_full_name
  zone       = var.vm_db_default_zone
  platform_id = var.vm_db_platform_id
  resources {
    cores         = var.vms_resources["db"].cores
    memory        = var.vms_resources["db"].memory
    core_fraction = var.vms_resources["db"].core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.vm_db_develop.id
    nat       = true
  }

  metadata = local.merged_metadata
}
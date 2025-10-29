resource "yandex_compute_instance" "web" {
  count       = 2
  name        = "web-${count.index + 1}" # web-1, web-2
  platform_id = var.default_platform_id

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.id
      size     = 10
    }
  }

  network_interface {
    subnet_id           = yandex_vpc_subnet.develop.id
    nat                 = true
    security_group_ids  = [yandex_vpc_security_group.example.id]
  }

  metadata = {
    ssh-keys = "ubuntu:${local.ssh_public_key}"
  }

  # after db instance creation
  depends_on = [yandex_compute_instance.db]
}
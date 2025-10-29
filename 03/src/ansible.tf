locals {
  web_hosts = [
    for i in yandex_compute_instance.web : {
      name         = i.name
      ansible_host = try(i.network_interface[0].nat_ip_address, i.network_interface[0].ip_address)
      fqdn         = i.fqdn
      user        = "ubuntu"
    }
  ]

  db_hosts = [
    for i in yandex_compute_instance.db : {
      name         = i.name
      ansible_host = try(i.network_interface[0].nat_ip_address, i.network_interface[0].ip_address)
      fqdn         = i.fqdn
      user        = "ubuntu"
    }
  ]

  storage_hosts = [
    {
      name         = yandex_compute_instance.storage.name
      ansible_host = try(yandex_compute_instance.storage.network_interface[0].nat_ip_address, yandex_compute_instance.storage.network_interface[0].ip_address)
      fqdn         = yandex_compute_instance.storage.fqdn
      user        = "ubuntu"
    }
  ]

  ansible_inventory = templatefile("${path.module}/templates/hosts.tftpl", {
    web     = local.web_hosts
    db      = local.db_hosts
    storage = local.storage_hosts
  })
}

resource "local_file" "ansible_inventory" {
  filename = "${path.module}/ansible/hosts.ini"
  content  = local.ansible_inventory

  depends_on = [
    yandex_compute_instance.web,
    yandex_compute_instance.db,
    yandex_compute_instance.storage
  ]
}
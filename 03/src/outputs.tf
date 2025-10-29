output "vm_from_count_and_foreach" {
  description = "VMs (web from count, db from for_each) as list of objects"
  value = concat(
    [for i in yandex_compute_instance.web : {
      name = i.name
      id   = i.id
      fqdn = i.fqdn
    }],
    [for i in yandex_compute_instance.db : {
      name = i.name
      id   = i.id
      fqdn = i.fqdn
    }]
  )
}
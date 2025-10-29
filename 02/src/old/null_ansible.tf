resource "null_resource" "ansible_ping" {
  triggers = {
    inv_sha = filesha256(local_file.ansible_inventory.filename)
  }

  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible -i ${local_file.ansible_inventory.filename} all -m ping"
  }

  depends_on = [local_file.ansible_inventory]
}
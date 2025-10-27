locals {
  project          = "netology"
  env              = "develop"
  role_web         = "platform-web"
  role_db          = "platform-db"

  vm_web_full_name = "${local.project}-${local.env}-${local.role_web}"
  vm_db_full_name  = "${local.project}-${local.env}-${local.role_db}"

  merged_metadata = merge(
    var.common_metadata,
    {
      "ssh-keys" = "ubuntu:${var.vms_ssh_root_key}"
    }
  )
}
#  metadata = {
#    serial-port-enable = 1
#    #ssh-keygen -t ed25519  Забудьте уже про rsa ключи!!
#    # ubuntu - дефолтный пользователь в ubuntu :)
#    ssh-keys = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGiVcfW8Wa/DxbBNzmQcwn7hJOj7ji9eoTpFakVnY/AI webinar"
#  }

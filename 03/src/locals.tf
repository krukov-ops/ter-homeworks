locals {

  ssh_public_key = chomp(file(pathexpand(var.public_key_path)))


}

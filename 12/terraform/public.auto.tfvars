default_zone   = "ru-central1-a"
username       = "cloud-alex"
ssh_public_key = "~/.ssh/id_ed25519.pub"
vm_packages    = ["vim"]

vpc_params = {
  name = "production"
  subnets = {
    public = { zone = "ru-central1-a", cidr = "192.168.10.0/24" },
  }
}

lamp_group_params = {
  group_name      = "lamp"
  image_family    = "lamp"
  instance_cores  = 2
  instance_memory = 2
  group_size      = 3
  max_unavailable = 1
  max_expansion   = 0
}

storage_params = {
  bucket_name = "nkrukov-netology"
  bucket_acl = "public-read"
  object_key = "1.jpg"
  object_source = "files/1.jpg"
  object_acl = "public-read"
}
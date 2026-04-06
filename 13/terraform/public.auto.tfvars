default_zone = "ru-central1-a"
encrypted_bucket_params = {
  bucket_name = "nkrukov-netology"
  bucket_acl  = "public-read"
}
bucket_objects = {
  "1.jpg" = {
    object_source = "files/1.jpg"
    object_acl    = "public-read"
  }
}
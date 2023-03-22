resource "random_password" "application" {
  length  = 16
  special = true
}

resource "random_password" "read_only" {
  length  = 16
  special = true
}
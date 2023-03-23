locals {
  service_name = "web-app"

  tags = {
    managed-by  = "terraform"
    application = local.service_name
  }
}

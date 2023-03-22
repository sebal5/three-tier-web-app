locals {
  service_name = "api-app"

  tags = {
    managed-by  = "terraform"
    application = local.service_name
  }
}

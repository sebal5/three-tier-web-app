locals {
  service_name = "api-app"

  tags = {
    owner       = "Senthil-Toptal"
    managed-by  = "terraform"
    application = local.service_name
  }
}

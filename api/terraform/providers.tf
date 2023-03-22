provider "google" {
  project                     = var.gcp_project
  region                      = var.gcp_region
  impersonate_service_account = var.terraform_service_account
}

data "google_client_config" "default" {}

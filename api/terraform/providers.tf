provider "google" {
  project     = var.gcp_project
  region      = var.gcp_region
  credentials = file("github-actions-service-account.json")
}

data "google_client_config" "default" {}

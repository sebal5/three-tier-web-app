resource "google_service_account" "this" {
  project      = var.gcp_project
  account_id   = "sa-${local.service_name}-${var.environment}"
  display_name = "sa-${local.service_name}-${var.environment}"
  description  = "Service account for '${local.service_name}'-'${var.environment}' service."
}
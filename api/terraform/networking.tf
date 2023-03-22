resource "google_compute_global_address" "this" {
  name          = "google-managed-services-vpn-connector"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = "default"
  project       = var.gcp_project
}

resource "google_service_networking_connection" "this" {
  network                 = "default"
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.this.name]
}

resource "google_vpc_access_connector" "this" {
  provider      = google-beta
  project       = var.gcp_project
  name          = "vpc-conn"
  ip_cidr_range = "10.8.0.0/28"
  network       = "default"
  region        = var.gcp_region
  depends_on    = [google_compute_global_address.this]
}
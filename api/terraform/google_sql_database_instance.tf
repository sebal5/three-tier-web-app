resource "google_sql_database_instance" "this" {
  name                = local.service_name
  database_version    = "POSTGRES_14"
  region              = var.gcp_region
  deletion_protection = var.deletion_protection
  project             = var.gcp_project
  depends_on          = [google_service_networking_connection.this]

  settings {
    tier                        = var.database_tier
    availability_type           = var.database_availability_type
    deletion_protection_enabled = var.deletion_protection_enabled
    disk_size                   = "10"

    ip_configuration {
      ipv4_enabled    = false
      private_network = "projects/${var.gcp_project}/global/networks/default"
    }
    backup_configuration {
      enabled                        = true
      location                       = "eu"
      start_time                     = "23:00"
      point_in_time_recovery_enabled = true
      transaction_log_retention_days = 7
    }

    maintenance_window {
      day          = "1"
      hour         = "2"
      update_track = "stable"
    }

    dynamic "database_flags" {
      for_each = var.database_flags
      content {
        name  = lookup(database_flags.value, "name", null)
        value = lookup(database_flags.value, "value", null)
      }
    }
  }

  lifecycle {
    ignore_changes = [
      settings.0.disk_size,
    ]
  }

}
locals {
  secret_list = [
    "db_user_ro",
    "db_pwd_ro",
  ]
}

resource "google_secret_manager_secret" "this" {
  for_each  = toset(local.secret_list)
  labels    = local.tags
  project   = var.gcp_project
  secret_id = "${local.service_name}_${each.value}_${var.environment}"

  replication {
    automatic = true
  }

  timeouts {}
}

resource "google_secret_manager_secret_version" "db_user" {
  secret      = google_secret_manager_secret.this["db_user_ro"].id
  secret_data = google_sql_user.read_only.name
}


resource "google_secret_manager_secret_version" "db_pwd" {
  secret      = google_secret_manager_secret.this["db_pwd_ro"].id
  secret_data = google_sql_user.read_only.password
}

resource "google_secret_manager_secret_iam_binding" "this" {
  for_each  = toset(local.secret_list)
  project   = var.gcp_project
  secret_id = google_secret_manager_secret.this[each.value].secret_id
  role      = "roles/secretmanager.secretAccessor"
  members = [
    "serviceAccount:${google_service_account.this.email}",
  ]
}
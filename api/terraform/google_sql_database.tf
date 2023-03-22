resource "google_sql_database" "this" {
  name     = local.service_name
  instance = google_sql_database_instance.this.name
}
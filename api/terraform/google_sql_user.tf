resource "google_sql_user" "application" {
  name     = "api_app_user"
  instance = google_sql_database_instance.this.name
  password = random_password.application.result
}

resource "google_sql_user" "read_only" {
  name     = "api_app_user_ro"
  instance = google_sql_database_instance.this.name
  password = random_password.read_only.result
}
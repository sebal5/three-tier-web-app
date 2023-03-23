resource "google_cloud_run_service" "this" {
  name                       = "${local.service_name}-cloud-run-${var.environment}"
  location                   = var.gcp_region
  autogenerate_revision_name = true

  metadata {
    labels = local.tags
    annotations = {
      "run.googleapis.com/ingress" = "all"
    }
  }

  template {
    metadata {
      annotations = {
        "autoscaling.knative.dev/minScale" = var.gcr_min_instances
        "autoscaling.knative.dev/maxScale" = var.gcr_max_instances
      }
    }
    spec {
      containers {
        image = "europe-west4-docker.pkg.dev/${var.gcp_project}/web-appplication/${local.service_name}:latest"

        env {
          name  = "API_HOST"
          value = "https://api-app-cloud-run-prod-zlblmbf5aq-ez.a.run.app"
        }
        resources {
          limits = {
            cpu    = "1000m"
            memory = "1024Mi"
          }
        }
        ports {
          container_port = 8080
        }
      }
      service_account_name = google_service_account.this.email
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }

  lifecycle {
    ignore_changes = [
      # Ignore changes to specific metadata as we deploy with gcloud.
      metadata.0.annotations["client.knative.dev/user-image"],
      metadata.0.annotations["run.googleapis.com/client-name"],
      metadata.0.annotations["run.googleapis.com/client-version"],
      template.0.metadata.0.annotations["client.knative.dev/user-image"],
      template.0.metadata.0.annotations["run.googleapis.com/client-name"],
      template.0.metadata.0.annotations["run.googleapis.com/client-version"],
    ]
  }
}

data "google_iam_policy" "this" {
  binding {
    role    = "roles/run.invoker"
    members = ["allUsers"]
  }
}

resource "google_cloud_run_service_iam_policy" "this" {
  project  = var.gcp_project
  location = google_cloud_run_service.this.location
  service  = google_cloud_run_service.this.name

  policy_data = data.google_iam_policy.this.policy_data
}
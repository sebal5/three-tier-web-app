terraform {
  required_version = "~> 1.4.2"

  backend "gcs" {
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.58.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "4.58.0"
    }
  }
}
variable "terraform_service_account" {
  type        = string
  description = "The service account to use for terraform operations on the GCP project"
}

variable "gcp_project" {
  type        = string
  description = "The project id for GCP"
}

variable "gcp_region" {
  type        = string
  description = "The region app engine is associated with, needed for cloud scheduler"
  default     = "europe-west4"
}

variable "database_tier" {
  type        = string
  description = "The machine type to use for the CloudSQL instance"
}

variable "database_availability_type" {
  type        = string
  description = "The availability type of the Cloud SQL instance, high availability (REGIONAL) or single zone (ZONAL)"
}

variable "deletion_protection" {
  type        = bool
  description = "Whether or not to allow Terraform to destroy the instance"
}

variable "deletion_protection_enabled" {
  type        = bool
  description = "Enables deletion protection of an instance at the GCP level. Enabling this protection will guard against accidental deletion across all surfaces"
}

variable "database_flags" {
  description = "The database flags for the sql instance. See [more details](https://cloud.google.com/sql/docs/postgres/flags)"
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "environment" {
  type        = string
  description = "environment"
  default     = "prod"
}

variable "gcr_min_instances" {
  type        = number
  description = "The minimum amount of instances that should be kept running in Cloud Run."
}

variable "gcr_max_instances" {
  type        = number
  description = "The maximum amount of instances that can be kept running in Cloud Run."
}



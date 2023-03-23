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



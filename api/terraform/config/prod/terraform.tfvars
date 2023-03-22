terraform_service_account = "github-actions-service-account@toptal-project-381320.iam.gserviceaccount.com"
gcp_project               = "toptal-project-381320"
environment               = "prod"
gcr_min_instances         = 1
gcr_max_instances         = 1
# SQL Database flags
database_tier               = "db-custom-1-3840"
database_availability_type  = "REGIONAL"
deletion_protection         = true
deletion_protection_enabled = true
database_flags              = [{ name : "log_connections", value : "off" }, { name : "log_disconnections", value : "off" }]


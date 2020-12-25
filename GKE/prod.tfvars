region      = "australia-southeast1"
prefix      = "prod"
region_zone = "australia-southeast1-b"
gcp_project = "sample"
credentials = "../files/credentials/ap-terraform-prod-sample.json"
gcp_service_list = [
  "compute.googleapis.com",           # Compute Engine API
  "iam.googleapis.com",               # Identity and Access Management (IAM) API
  "iamcredentials.googleapis.com",    # IAM Service Account Credentials API
  "logging.googleapis.com",           # Stackdriver Logging API
  "monitoring.googleapis.com",        # Stackdriver Monitoring API
  "servicemanagement.googleapis.com", # Service Management API
  "serviceusage.googleapis.com",      # Service Usage API
  "sourcerepo.googleapis.com",        # Cloud Source Repositories API
  "sql-component.googleapis.com",     # Cloud SQL
  "sqladmin.googleapis.com",          # Cloud SQL
  "servicenetworking.googleapis.com", # Service Networking
  "storage-api.googleapis.com",       # Google Cloud Storage JSON API
  "storage-component.googleapis.com"  # Cloud Storage
]
vpc                                      = "ap-prod-vpc"
subnet_cidr                              = "10.10.0.0/24"
machine_type                             = "n1-standard-4"
gke_machine_type                         = "n1-standard-1"
db_machine_type                          = "db-n1-standard-1"
db_root_password                         = "sample"
db_user                                  = "sample"
db_user_password                         = "sample"
db_db                                    = "sample"
availability_type                        = "REGIONAL"
db_machine_disk_size                     = "10"
gce_ssh_user                             = "sample"
gce_ssh_pub_key_file                     = "/sample/me.pub"
gce_ssh_priv_key_file                    = "/sample/me"
activeplace_url                          = "sample.com"
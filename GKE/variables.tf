/* -------------------------------------------------------------------------- */
/*                                 Global Vars                                */
/* -------------------------------------------------------------------------- */

variable "region" {
  description = "This is the cloud hosting region where your webapp will be deployed."
}

variable "prefix" {
  description = "This is the environment where your webapp is deployed. qa, prod, or dev"
}

variable "region_zone" {
  description = "This is the cloud hosting region's zone where your webapp will be deployed."
}

variable "gcp_project" {
  description = "The Project on which we want to work"
  type        = string
}

variable "gcp_service_list" {
  description = "Api to be enabled"
  type        = list
}

variable "credentials" {
  description = "The Service Account File"
}

/* --------------------------- End of Global Vars --------------------------- */

/* -------------------------------------------------------------------------- */
/*                                  VPC Vars                                  */
/* -------------------------------------------------------------------------- */
variable "vpc" {
  description = "The VPC name"
  type        = string
}

variable "subnet_cidr" {
  description = "Subnet range under VPC"
}
/* ----------------------------- End of VPC Vars ---------------------------- */


/* -------------------------------------------------------------------------- */
/*                              GCP Compute Vars                              */
/* -------------------------------------------------------------------------- */

variable "machine_type" {
  description = "Machine type"
  type        = string
}

/* ------------------------- End of GCP Compute Vars ------------------------ */


/* -------------------------------------------------------------------------- */
/*                                  GKE Vars                                  */
/* -------------------------------------------------------------------------- */

variable "gke_machine_type" {
  description = "GKE Machine type"
  type        = string
}

variable "gke_image_type" {
  default = "UBUNTU"
}

variable "gke_disk_size_gb" {
  default = "10"
}

variable "gke_disk_type" {
  default = "pd-ssd"
}

variable "initial_node_count" {
  description = "GKE Node Count"
  type        = string
  default     = "1"
}

/* ----------------------------- End of GKE Vars ---------------------------- */

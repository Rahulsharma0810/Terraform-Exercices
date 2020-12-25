provider "google" {
  credentials = file(var.credentials)
  project     = var.gcp_project
  region      = var.region
  version     = "~> 3.51.0"
}

/* -------------------------------------------------------------------------- */
/*                                 GKE Cluster                                */
/* -------------------------------------------------------------------------- */

resource "google_container_cluster" "gke_cluster" {
  name     = "gke-${var.gcp_project}"
  location = var.region_zone

  remove_default_node_pool = true
  initial_node_count       = var.initial_node_count

  master_auth {
    username = ""
    password = ""
  }

  # private_cluster_config {
  #   enable_private_endpoint = true
  #   enable_private_nodes    = true
  #   master_ipv4_cidr_block  = "10.152.0.0/28"
  # }

  timeouts {
    create = "20m"
    update = "15m"
    delete = "15m"
  }

  min_master_version        = "1.17.14-gke.1600"
  network                   = "default"
  subnetwork                = "projects/sample-staging/regions/australia-southeast1/subnetworks/default"
}

/* --------------------------- End of GKE Cluster --------------------------- */

/* -------------------------------------------------------------------------- */
/*                                  GKE Nodes                                 */
/* -------------------------------------------------------------------------- */

resource "google_container_node_pool" "primary_nodes" {
  name       = "gke-node-${var.gcp_project}"
  location   = var.region_zone
  cluster    = google_container_cluster.gke_cluster.name
  node_count = 1
  version              = "1.17.14-gke.1600"

  node_locations = [
    var.region_zone
  ]

  node_config {
    machine_type = var.gke_machine_type
    image_type   = var.gke_image_type
    disk_type    = var.gke_disk_type
    disk_size_gb = var.gke_disk_size_gb
    metadata = {
      disable-legacy-endpoints = "true"
    }
    oauth_scopes = [
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/trace.append",
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }
  timeouts {
    create = "20m"
    update = "15m"
    delete = "15m"
  }
}

/* ---------------------------- End of GKE Nodes ---------------------------- */

/* -------------------------------------------------------------------------- */
/*                          Static Public Ip Address                          */
/* -------------------------------------------------------------------------- */

## ISSUE - {}
### Global IP Is Required otherwise
#### Error during sync: error running load balancer syncing routine: loadbalancer NAME does not exist:
resource "google_compute_global_address" "gke_pub_ip" {
  name = "${google_container_cluster.gke_cluster.name}-pub-ip"
}

/* ---------------------- End Static Public Ip Address ---------------------- */

/* -------------------------------------------------------------------------- */
/*                                   Outputs                                  */
/* -------------------------------------------------------------------------- */

output "cluster_ca_certificate" {
  value = google_container_cluster.gke_cluster.master_auth.0.cluster_ca_certificate
}

output "host" {
  value = google_container_cluster.gke_cluster.endpoint
}

output "kubernetes_cluster_name" {
  value       = google_container_cluster.gke_cluster.name
  description = "GKE Cluster Name"
}

/* ----------------------------- End of Outputs ----------------------------- */
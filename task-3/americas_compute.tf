#Montreal:
#VM Instance 3
resource "google_compute_instance" "vm_instance_3" {
  name         = "atreides-1"
  machine_type = var.vm2_machine_type
  zone         = "northamerica-northeast1-a"

  boot_disk {
    initialize_params {
      image = var.vm2_image
      size = 50 
      type = "pd-balanced"
    }
  }

  network_interface {
    access_config {
      // Ephemeral IP
      network_tier = "PREMIUM"
    }
    subnetwork = "projects/pooper-scooper/regions/northamerica-northeast1/subnetworks/montreal-office"
    stack_type  = "IPV4_ONLY"
  }

  service_account {
    email  = "876288284083-compute@developer.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
  }
  depends_on = [ google_compute_subnetwork.network3_sub1 ]
}
#>>> 

#Sao Paulo:
#VM Instance 3
resource "google_compute_instance" "vm_instance_4" {
  name         = "atreides-2"
  machine_type = var.vm2_machine_type
  zone         = "southamerica-east1-a"

  boot_disk {
    initialize_params {
      image = var.vm2_image
      size = 50 
      type = "pd-balanced"
    }
  }

  network_interface {
    access_config {
      // Ephemeral IP
      network_tier = "PREMIUM"
    }
    subnetwork = "projects/pooper-scooper/regions/southamerica-east1/subnetworks/sao-paulo-office"
    stack_type  = "IPV4_ONLY"
  }

  service_account {
    email  = "876288284083-compute@developer.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
  }
  depends_on = [ google_compute_subnetwork.network4_sub1 ]
}

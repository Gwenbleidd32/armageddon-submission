#VM Instance 1
resource "google_compute_instance" "vm_instance" {
  name         = var.vm_name
  machine_type = var.vm_machine_type
  zone         = var.vm_zone

  tags = ["http-server", "https-server"]#public network tags

  boot_disk {
    initialize_params {
      image = var.vm_image
      size = 10 
      type = "pd-balanced"
    }
  }

  network_interface {
    access_config {
      // Ephemeral IP
      network_tier = "PREMIUM"
    }
    subnetwork = var.vm_subnetwork
    stack_type  = "IPV4_ONLY"
  }

  metadata_startup_script = var.vm_metadata

  service_account {
    email  = "876288284083-compute@developer.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
  }
  depends_on = [ google_storage_bucket.bucket1, google_compute_subnetwork.network_sub1 ]
}

# Output the IP address of the instance with print included
output "vm_public_ip" {
  description = "The public IP of the VM instance"
  value       = google_compute_instance.vm_instance.network_interface[0].access_config[0].nat_ip
}

output "vm_internal_ip" {
  description = "The internal IP of the VM instance"
  value       = google_compute_instance.vm_instance.network_interface[0].network_ip
}

resource "local_file" "output" {
  content = "Public IP: ${google_compute_instance.vm_instance.network_interface[0].access_config[0].nat_ip}\nInternal IP: ${google_compute_instance.vm_instance.network_interface[0].network_ip}\nNetwork Name: ${google_compute_network.network_1.name}\nSubnetwork Name: ${google_compute_subnetwork.network_sub1.name}\nSubnetwork Region: ${google_compute_subnetwork.network_sub1.region}"
  filename = "${path.module}/output.txt"
}
#Network 3 - Americas 
resource google_compute_network "network_3" {
    name                    = "cd-projeckt-red-americas1-net"
    description             = "3"
    auto_create_subnetworks = false
    routing_mode            = "REGIONAL"
    mtu                     = 1460
}

output "n3" {
    value = google_compute_network.network_3.name
}
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

#Subnet1 - MONTREAL
resource google_compute_subnetwork "network3_sub1" {
    name          = "montreal-office"
    description   = "Montreal office subnet"
    ip_cidr_range = "172.16.32.0/24"
    region        = "northamerica-northeast1"
    network       = google_compute_network.network_3.id
}
#>>>
output "n3_s1" {
    value = google_compute_subnetwork.network3_sub1.name
}
output "n3_s1_range" {
    value = google_compute_subnetwork.network3_sub1.ip_cidr_range
}
output "n3_s1_region" {
    value = google_compute_subnetwork.network3_sub1.region
}
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

#Network 4 - Americas 
resource google_compute_network "network_4" {
    name                    = "cd-projeckt-red-americas2-net"
    description             = "4"
    auto_create_subnetworks = false
    routing_mode            = "REGIONAL"
    mtu                     = 1460
}

output "n4" {
    value = google_compute_network.network_1.name
}
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

#Subnet2 - SAO PAULO
resource google_compute_subnetwork "network4_sub1" {
    name          = "sao-paulo-office"
    description   = "Sao Paulo office subnet"
    ip_cidr_range = "172.16.76.0/24"
    region        = "southamerica-east1"
    network       = google_compute_network.network_4.id
}
#>>>
output "n4_s1" {
    value = google_compute_subnetwork.network4_sub1.name
}
output "n4_s1_range" {
    value = google_compute_subnetwork.network4_sub1.ip_cidr_range
}
output "n4_s1_region" {
    value = google_compute_subnetwork.network4_sub1.region
}
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

#Firewall rules:
#Net 3

#RDP
resource "google_compute_firewall" "net3_rdp"{
    name = "net3-rdp"
    network = google_compute_network.network_3.id
    description = "whatforandwhy?"
    direction = "INGRESS"
    priority = 65534
    source_ranges = ["0.0.0.0/0"]
    allow {
        protocol = "tcp"
        ports = ["3389"]
    }
}
#>>>

#Net 4
#RDP
resource "google_compute_firewall" "net4_rdp"{
    name = "net4-rdp"
    network = google_compute_network.network_4.id
    description = "whatforandwhy?"
    direction = "INGRESS"
    priority = 65534
    source_ranges = ["0.0.0.0/0"]
    allow {
        protocol = "tcp"
        ports = ["3389"]
    }
}
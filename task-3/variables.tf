#Network 1
variable "net1" {
type = string
default = "cd-projeckt-red-main-net"
}
#>>>
#Subnet 1
variable "net1_sub1" {
    type = string
    default = "warsaw-office"
}

variable "net1_sub1_iprange" {
    type = string
    default = "10.132.32.0/24"
}

variable "net1_sub1_region" {
    type = string
    default = "europe-central2"
}
#>>>

#Network 2
variable "net2" {
type = string
default = "cd-projeckt-red-japan-net"
}
#>>>
#Subnet 1
variable "net2_sub1" {
    type = string
    default = "tokyo-office"
}

variable "net2_sub1_iprange" {
    type = string
    default = "192.168.32.0/24"
}

variable "net2_sub1_region" {
    type = string
    default = "asia-northeast1"
}
#>>>

#Bucket Variable
variable "bucket_1" {
  type = string
  default = "kaer-seren-library"
  description = "The Hidden library carrying the renowned Griffin school Techniques"
}

#Bucket Region
variable "bucket_1_region" {
  type = string
  default = "europe-central2"
}

variable "content_source1" {
  default = "C:/Users/User/Desktop/Homework/Landing Page Setup/g-sketch/punk-o.jpg"
}

variable "content_source2" {
  default = "C:/Users/User/Desktop/Homework/Landing Page Setup/g-sketch/cd.png"
}
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

#VM Instances
#>>>

#Main Warsaw Office VM Instance
variable "vm_name" {
  type = string
  default = "kamila-1"
}

variable "vm_machine_type" {
  type = string
  default = "e2-medium"
}

variable "vm_zone" {
  type = string
  default = "europe-central2-b"
}

variable "vm_image" {
  type = string
  default = "projects/debian-cloud/global/images/debian-12-bookworm-v20240415"
}

variable "vm_subnetwork" {
  type = string
  default = "projects/pooper-scooper/regions/europe-central2/subnetworks/warsaw-office"
  
}

variable "vm_metadata" {
  type = string
  default = "#Thanks to Remo\n#!/bin/bash\n# Update and install Apache2\napt update\napt install -y apache2\n\n# Start and enable Apache2\nsystemctl start apache2\nsystemctl enable apache2\n\n# GCP Metadata server base URL and header\nMETADATA_URL=\"http://metadata.google.internal/computeMetadata/v1\"\nMETADATA_FLAVOR_HEADER=\"Metadata-Flavor: Google\"\n\n# Use curl to fetch instance metadata\nlocal_ipv4=$(curl -H \"$${METADATA_FLAVOR_HEADER}\" -s \"$${METADATA_URL}/instance/network-interfaces/0/ip\")\nzone=$(curl -H \"$${METADATA_FLAVOR_HEADER}\" -s \"$${METADATA_URL}/instance/zone\")\nproject_id=$(curl -H \"$${METADATA_FLAVOR_HEADER}\" -s \"$${METADATA_URL}/project/project-id\")\nnetwork_tags=$(curl -H \"$${METADATA_FLAVOR_HEADER}\" -s \"$${METADATA_URL}/instance/tags\")\n\n# Create a simple HTML page and include instance details\ncat <<EOF > /var/www/html/index.html\n<html>\n<head>\n<title>W3.CSS Template</title>\n<meta charset=\"UTF-8\">\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n<link rel=\"stylesheet\" href=\"https://www.w3schools.com/w3css/4/w3.css\">\n<link rel=\"stylesheet\" href=\"https://fonts.googleapis.com/css?family=Raleway\">\n<style>\nbody,h1 {font-family: \"Raleway\", sans-serif}\nbody, html {height: 100%}\n.bgimg {\n  background-image: url('https://storage.googleapis.com/kaer-seren-library/punk-o.jpg');\n  min-height: 100%;\n  background-position: center;\n  background-size: cover;\n}\n</style>\n</head>\n<body>\n\n<div class=\"bgimg w3-display-container w3-animate-opacity w3-text-white\">\n<div class=\"w3-display-topleft w3-padding-large w3-xlarge\">\n<img src=\"https://storage.googleapis.com/kaer-seren-library/cd.png\" alt=\"Descriptive Alt Text\" width=\"20%\" height=\"20%\">\n</div>\n<div class=\"w3-display-middle\">\n<h1 class=\"w3-jumbo w3-animate-top\">COMING SOON</h1>\n<hr class=\"w3-border-grey\" style=\"margin:auto;width:40%\">\n<p class=\"w3-large w3-center\">Cyberpunk-2077</p>\n</div>\n<div class=\"w3-display-bottomleft w3-padding-large\">\n<h3>Welcome to the CD Projeckt Red Game Engine Server!</h3>\n<p><b>Instance Name:</b> kamila-1</p>\n<p><b>Instance Private IP Address: </b> 10.132.32.2</p>\n<p><b>Zone: </b> europe-central2-b</p>\n<p><b>Project ID:</b> pooper-scooper</p>\n<p><b>Network Tags:</b> n/a</p>\n</div>\n</div>\n</body></html>"
}
#>>>

#Main Tokyo Office VM Instance
variable "vm2_name" {
  type = string
  default = "kise-beya-1"
}

variable "vm2_machine_type" {
  type = string
  default = "e2-highmem-2"
}

variable "vm2_zone" {
  type = string
  default = "asia-northeast1-b"
}

variable "vm2_image" {
  type = string
  default = "projects/windows-cloud/global/images/windows-server-2022-dc-v20240415"
}

variable "vm2_subnetwork" {
  type = string
  default = "projects/pooper-scooper/regions/asia-northeast1/subnetworks/tokyo-office"
  
}
#>>>

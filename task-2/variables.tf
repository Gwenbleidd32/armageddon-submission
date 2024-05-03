#Network 1
variable "net1" {
type = string
default = "arrakis-net"
}
#>>>
#Subnet 1
variable "net1_sub1" {
    type = string
    default = "arrakeen-keep"
}

variable "net1_sub1_iprange" {
    type = string
    default = "10.132.32.0/24"
}

variable "net1_sub1_region" {
    type = string
    default = "me-west1"
}
#>>>

#Bucket Variable
variable "bucket_1" {
  type = string
  default = "arrakeen-keep-library"
  description = "The Hidden library on Arakkis carrying Harkonnen secrets"
}

#Bucket Region
variable "bucket_1_region" {
  type = string
  default = "me-west1"
}

variable "content_source1" {
  default = "C:/Users/User/Desktop/Homework/Landing Page Setup/g-sketch/br1.jpg"
}

variable "content_source2" {
  default = "C:/Users/User/Desktop/Homework/Landing Page Setup/g-sketch/dune.webp"
}
#>>>

#VM Instances

variable "vm_name" {
  type = string
  default = "hark-1"
}

variable "vm_machine_type" {
  type = string
  default = "e2-medium"
}

variable "vm_zone" {
  type = string
  default = "me-west1-a"
}

variable "vm_image" {
  type = string
  default = "projects/debian-cloud/global/images/debian-12-bookworm-v20240415"
}

variable "vm_subnetwork" {
  type = string
  default = "projects/pooper-scooper/regions/me-west1/subnetworks/arrakeen-keep"
  
}

variable "vm_metadata" {
  type = string
  default = "#Thanks to Remo\n#!/bin/bash\n# Update and install Apache2\napt update\napt install -y apache2\n\n# Start and enable Apache2\nsystemctl start apache2\nsystemctl enable apache2\n\n# GCP Metadata server base URL and header\nMETADATA_URL=\"http://metadata.google.internal/computeMetadata/v1\"\nMETADATA_FLAVOR_HEADER=\"Metadata-Flavor: Google\"\n\n# Use curl to fetch instance metadata\nlocal_ipv4=$(curl -H \"$${METADATA_FLAVOR_HEADER}\" -s \"$${METADATA_URL}/instance/network-interfaces/0/ip\")\nzone=$(curl -H \"$${METADATA_FLAVOR_HEADER}\" -s \"$${METADATA_URL}/instance/zone\")\nproject_id=$(curl -H \"$${METADATA_FLAVOR_HEADER}\" -s \"$${METADATA_URL}/project/project-id\")\nnetwork_tags=$(curl -H \"$${METADATA_FLAVOR_HEADER}\" -s \"$${METADATA_URL}/instance/tags\")\n\n# Create a simple HTML page and include instance details\ncat <<EOF > /var/www/html/index.html\n<html lang=\"en\">\n<head>\n<meta charset=\"UTF-8\">\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n<title>Responsive Background and Centered Image with Text</title>\n<style>\n/* Set the body to display full height of the viewport with no margin */\nbody, html {\nheight: 100%;\nmargin: 0;\nfont-family: 'Verdana', sans-serif; /* Default to Roboto, replace with 'Jersey 20' if available */\n}\n\n/* Fullscreen background image */\n.background {\nbackground-image: url('https://storage.googleapis.com/arrakeen-keep-library/br1.jpg');\nheight: 100%;\nbackground-position: center;\nbackground-repeat: no-repeat;\nbackground-size: cover; /* Cover the entire viewport */\nposition: relative; /* Allows for absolute positioning of elements inside */\ndisplay: flex;\njustify-content: center;\nalign-items: center; /* Center the child div vertically and horizontally */\nflex-direction: column; /* Align children vertically */\n}\n\n/* Header styling */\nheader {\nposition: absolute;\ntop: 0;\nwidth: 100%;\nbackground: rgba(0, 0, 0, 0.5); /* Semi-transparent black background */\ncolor: white;\npadding: 10px 20px;\ntext-align: center;\n}\n\n/* Centered image container */\n.centered-image {\nwidth: 300px; /* Fixed width for the centered image */\nheight: 300px;\nbackground-image: url('https://storage.googleapis.com/arrakeen-keep-library/dune.webp');\nbackground-position: center;\nbackground-repeat: no-repeat;\nbackground-size: cover; /* Change to cover to ensure the image fills the circle */\nborder-radius: 50%; /* Makes the container a circle */\nmargin-bottom: 20px; /* Space between the image and the text */\n}\n\n/* Text container */\n.text-container {\ncolor: white;\ntext-align: center;\nfont-size: 1.5em;\nwidth: 35%; /* Width relative to the parent */\npadding: 10px;\nbackground-color: rgba(0, 0, 0, 0.5); /* Semi-transparent background for text */\nborder-radius: 15px; /* Rounded corners for the text container */\nfont-weight: bold;\n}\n</style>\n</head>\n<body>\n<div class=\"background\">\n<header></header>\n<div class=\"centered-image\"></div>\n<div class=\"text-container\">\nArmageddon has arrived\n</div>\n</div>\n</body>\n</html>"
}
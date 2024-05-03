#Active Storage Buckets
#>>>

resource "google_storage_bucket" "bucket1" {
  name     = var.bucket_1
  location = var.bucket_1_region
  force_destroy = true
}

# Set the bucket-level IAM policy to allow public read
resource "google_storage_bucket_iam_binding" "public_read" {
  bucket = google_storage_bucket.bucket1.name
  role   = "roles/storage.objectViewer"

  members = [
    "allUsers",
  ]
}

# Upload local files to the folder inside the bucket
resource "google_storage_bucket_object" "o1" {
  name   = "punk-o.jpg"
  bucket = google_storage_bucket.bucket1.name
  source = var.content_source1
  depends_on = [ google_storage_bucket.bucket1 ]
  content_type = "image/jpeg"
}

resource "google_storage_bucket_object" "o2" {
  name   = "cd.png"
  bucket = google_storage_bucket.bucket1.name
  source = var.content_source2
  depends_on = [ google_storage_bucket.bucket1 ]
  content_type = "image/png"
}

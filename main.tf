provider "google" {
  credentials = file("my-portfolio-460322-e1641ec8e592.json")
  project = "my-portfolio-460322"
  region  = "us-central1"
}

resource "google_storage_bucket" "personal_site" {
  name          = "my-portfolio-460322-portfolio"
  location      = "US"
  website {
    main_page_suffix = "index.html"
    not_found_page   = "index.html"
  }
  uniform_bucket_level_access = true
}

resource "google_storage_bucket_iam_binding" "public_access" {
  bucket = google_storage_bucket.personal_site.name

  role = "roles/storage.objectViewer"
  members = [
    "allUsers"
  ]
}

resource "google_storage_bucket_object" "index" {
  name   = "index.html"
  bucket = google_storage_bucket.personal_site.name
  source = "index.html"
  content_type = "text/html"
}

resource "google_storage_bucket_object" "style" {
  name   = "style.css"
  bucket = google_storage_bucket.personal_site.name
  source = "style.css"
  content_type = "text/css"
}

resource "google_storage_bucket_object" "script" {
  name   = "script.js"
  bucket = google_storage_bucket.personal_site.name
  source = "script.js"
  content_type = "application/javascrip"
}

resource "google_storage_bucket_object" "image" {
  name   = "profile.jpg"
  bucket = google_storage_bucket.personal_site.name
  source = "profile.jpg"
  content_type = "image/jpeg"
}
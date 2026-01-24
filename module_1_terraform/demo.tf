terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "7.16.0"
    }
  }
}

provider "google"{
    credentials = file(var.credentials)
    project = "dezoomcamp2026-485216"
    region  = "us-central1"
}

resource "google_storage_bucket" "de_2026" {
  name          = "de-2026-bucket-12345" # global unique name
  location      = "US"
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "Delete"
    }
  }

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}


resource "google_bigquery_dataset" "demo_dataset" {
  dataset_id                  = "my_dataset_12345"
  description                 = "This is a demo dataset"
  location                    = "EU"

}
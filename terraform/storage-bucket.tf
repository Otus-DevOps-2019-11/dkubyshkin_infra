provider "google" {
  version = "~> 2.15"
  project = "infra-262510"
  region  = "europe-west1"
}

module "storage-bucket" {
  source  = "SweetOps/storage-bucket/google"
  version = "0.3.0"
  location = "europe-west1-b"

  # Имя поменяйте на другое
  name = "storage-bucket-appreddit"
}

output storage-bucket_url {
  value = module.storage-bucket.url
}
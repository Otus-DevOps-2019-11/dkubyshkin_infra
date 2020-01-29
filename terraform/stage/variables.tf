variable project {
  description = "Project ID"
}
variable region {
  description = "Region"
  # Значение по умолчанию
  default = "europe-west1"
}
variable public_key_path {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}
variable disk_image {
  description = "Disk image"
}

variable private_key {
  description = "private_key"
}
variable zone {
  description = "zone"
  default     = "europe-west1-b"
}

variable app_disk_image {
  description = "Disk image for reddit app"
  default     = "app-1580243107"
}

variable db_disk_image {
  description = "Disk image for reddit db"
  default     = "app-1580244092"
}

variable source_ranges {
  default = ["0.0.0.0/0"]
}
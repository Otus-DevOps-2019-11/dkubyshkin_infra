variable db_disk_image {
  description = "Disk image for reddit db"
  default = "app-1580244092"
}

variable zone {
  description = "zone"
  default     = "europe-west1-b"
}

variable private_key {
  description = "private_key"
  default     = "/Users/ruakbdg/.ssh/id_rsa2"
}

variable public_key_path {
  # Описание переменной
  description = "Path to the public key used for ssh access"
  default     = "/Users/ruakbdg/.ssh/id_rsa2.pub"
}
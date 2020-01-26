variable public_key_path {
  description = "Path to the public key used to connect to instance"
  default     = "/Users/ruakbdg/.ssh/id_rsa2.pub"
}

variable zone {
  description = "Zone"
  default     = "europe-west1-b"
}

variable app_disk_image {
  description = "Disk image for reddit app"
  default     = "app-1579632676"
}
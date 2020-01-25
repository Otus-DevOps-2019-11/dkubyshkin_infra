variable zone {
  description = "zone"
  default     = "europe-west1-b"
}

variable region {
  description = "Region"
  # Значение по умолчанию
  default = "europe-west1"
}

variable project {
  description = "Project ID"
  default     = "infra-262510"
}

variable public_key_path {
  # Описание переменной
  description = "Path to the public key used for ssh access"
  default = "/Users/ruakbdg/.ssh/id_rsa2.pub"
}
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
    backend "s3" {
    endpoints = {
      s3 = "https://storage.yandexcloud.net"
    }
    bucket = "ya-prac-grishin2"
    region = "ru-central1"
    key    = "prac/instance/terraform.tfstate"

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true 
    skip_s3_checksum            = true 
   }
}

provider "yandex" {
  zone      = var.yandex_zone
}


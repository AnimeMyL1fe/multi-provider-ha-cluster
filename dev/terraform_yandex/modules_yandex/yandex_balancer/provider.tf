terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
<<<<<<<< HEAD:dev/terraform_yandex/modules_yandex/yandex_balancer/provider.tf
<<<<<<< HEAD:dev/terraform_yandex/modules_yandex/yandex_balancer/provider.tf
}
=======
  required_version = ">= 0.13"
  
  backend "s3" {
========
    backend "s3" {
>>>>>>>> main:dev/terraform_yandex/provider.tf
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

>>>>>>> main:dev/terrraform/provider.tf

#======================================
# YANDEX_INSTANCES VARIABLES
#======================================

variable "configuration_vm" {
  type = map(object({
    id      = number
    node    = string
    user    = string
    address = string
    profile = string
    role    = string
    tags    = list(string)
  }))
}

variable "profile_conf" {
  type = map(object({
    cpu       = number
    ram       = number
    disk_size = number 
  }))
  default = {
    "low" = {
      cpu = 1
      ram = 2024
      disk_size = 32
    }
    "medium" = {
        cpu = 2
        ram = 2024
        disk_size = 32
    }
    "high" = {
        cpu = 2
        ram = 2048
        disk_size = 32
    }
  }
}

variable "network_conf" {
  type = map(object({
    gateway = string
    vnet    = string
  }))

  default = {
    lb = {
      gateway = "10.10.10.1"
      vnet    = "vnetlb"
    }
    web = {
      gateway = "10.10.20.1"
      vnet    = "vnetweb"
    }
    db = {
      gateway = "10.10.30.1"
      vnet    = "vnetdb"
    }
  }
}


# user

variable "path_ssh" {
  type = string
}

variable "private_path_ssh" {
  type = string
}

variable "vm_user" {
  type = string
}
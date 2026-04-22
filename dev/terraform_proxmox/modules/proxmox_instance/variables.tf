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
}

variable "network_conf" {
  type = map(object({
    gateway = string
    vnet    = string
  }))
}

variable "path_ssh" {
  type = string
}
variable "private_path_ssh" {
  type = string
}

variable "vm_user" {
  type = string
}

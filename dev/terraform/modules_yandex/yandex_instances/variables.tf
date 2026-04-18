#======================================
# YANDEX_INSTANCES VARIABLES
#======================================

#-----------------------
# provider
#-----------------------
variable "yandex_zone" {
  type = string
  default = "ru-central1-a"
}

#-----------------------
# configuration cloud vm
#-----------------------

variable "vm_configuration" {
  type = map(object({
    disk_name   = string
    disk_type   = string
    vm_name     = string
    vm_profile  = string
  }))
}

variable "vms_profile" {
  type = map(object({
    platform_id   = string
    core_fraction = number
    cores         = number
    memory        = number
    disk_size     = number
  }))
}


variable "subnet_id" {} 

variable "security_group_id" {}


variable "path_ssh" {
  type = string
}
variable "private_path_ssh" {
  type = string
}

variable "vm_user" {
  type = string
}
# inventory
variable "lb_nat_ip" {}
variable "lb_ip" {}


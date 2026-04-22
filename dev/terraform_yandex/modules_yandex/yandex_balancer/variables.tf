#======================================
# YANDEX_BALANCER_GROUP VARIABLES
#======================================
variable "yc_region" {
  type = string
}
#-----------------------
# config balancer
#-----------------------

variable "yc_balancer" {
  type = object({
    name            = string
    listener        = string
    listener_port   = string
    healthcheck     = string
    unhealthy       = string
    healthy         = string
    http_port       = string
  })
}

#-----------------------
# config instance
#-----------------------
variable "lb_group" {
  type = object({
    name        = string
    folder_id   = string
    service_id  = string
    platform_id = string
    group_name  = string
    fixed_scale = number
  })
}

variable "lb_group_profile" {
  type = object({
    cores       = number
    ram         = number
    disk_size   = number 
  })
}

#-----------------------
# ssh
#-----------------------
variable "path_ssh" {
  type = string
}
variable "private_path_ssh" {
  type = string
}
variable "vm_user" {
  type = string
}
#-----------------------
# network
#-----------------------
variable "network_id" {}

variable "subnet_id" {}

variable "security_group_id" {}


#======================================
# PROVIDER VARIABLES
#======================================
variable "yandex_zone" {
  type = string
}

variable "yc_region" {
  type = string
}

#======================================
# YANDEX_NETWORKS VARIABLES
#======================================

#-----------------------
# security_group
#-----------------------
variable "allowed_ports" {
  type = list(string)
}

#-----------------------
# subnet
#-----------------------
variable "cidr_v4" {
  type = list(string)
}


#======================================
# YANDEX_INSTANCES VARIABLES
#======================================
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
  default = {
    "lb" = {
      platform_id   = "standard-v1"
      core_fraction = 20
      cores         = 2
      memory        = 2
      disk_size     = 10
    }
    "web" = {
      platform_id   = "standard-v1"
      core_fraction = 20
      cores         = 2
      memory        = 4
      disk_size     = 10
    }
    "db" = {
      platform_id   = "standard-v1"
      core_fraction = 20
      cores         = 4
      memory        = 4
      disk_size     = 40
    }
    "zbx" = {
      platform_id   = "standard-v1"
      core_fraction = 20
      cores         = 2
      memory        = 4
      disk_size     = 20
    }
  }
}


#======================================
# YANDEX_BALANCER_GROUP VARIABLES
#======================================
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
# SSH
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


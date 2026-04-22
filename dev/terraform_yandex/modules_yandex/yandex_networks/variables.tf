#======================================
# YANDEX_NETWORKS VARIABLES
#======================================
#-----------------------
# zone
#-----------------------
variable "yandex_zone" {
  type = string
  default = "ru-central1-a"
}
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

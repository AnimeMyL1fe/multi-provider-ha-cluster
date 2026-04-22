output "sg_id" {
  value = yandex_vpc_security_group.sg1.id
}

output "sub_id" {
  value = yandex_vpc_subnet.sub_web.id
}

output "network_id" {
  value = yandex_vpc_network.net_web.id
}
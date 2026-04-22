resource "yandex_vpc_subnet" "sub_web" {
  v4_cidr_blocks = var.cidr_v4
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.net_web.id
  route_table_id = yandex_vpc_route_table.route1.id
}

resource "yandex_vpc_network" "net_web" {}
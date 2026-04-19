resource "yandex_vpc_security_group" "sg1" {
  name        = "Firewall-web-servers"
  network_id  = yandex_vpc_network.net_web.id

  dynamic "ingress" {
    for_each = var.allowed_ports
    content{
        protocol       = "TCP"
        description    = "allowed ports"
        v4_cidr_blocks = ["0.0.0.0/0"]
        port           = ingress.value
    }
  }

  ingress {
    protocol       = "TCP"
    description    = "web"
    v4_cidr_blocks = var.cidr_v4
    port           = "80"
  }

  ingress {
    protocol       = "TCP"
    description    = "postgresql"
    v4_cidr_blocks = var.cidr_v4
    port           = "5432"
  }

  ingress {
    protocol       = "TCP"
    description    = "zabbix"
    v4_cidr_blocks = var.cidr_v4
    port           = "8080"
  }

  ingress {
    protocol       = "TCP"
    description    = "ssh"
    v4_cidr_blocks = var.cidr_v4
    port           = "22"
  }

  ingress {
    protocol       = "TCP"
    description    = "etcd-client"
    v4_cidr_blocks = var.cidr_v4
    port           = "2379"
  }

  ingress {
    protocol       = "TCP"
    description    = "etcd-peer"
    v4_cidr_blocks = var.cidr_v4
    port           = "2380"
  }

  ingress {
    protocol       = "TCP"
    description    = "patroni-api"
    v4_cidr_blocks = var.cidr_v4
    port           = "8008"
  }




  egress {
    protocol       = "ANY"
    description    = "Permit ANY"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
}

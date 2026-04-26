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

  dynamic "ingress" {
    for_each = var.internal_allowed_ports
    content{
        protocol       = "TCP"
        description    = "allowed ports"
        v4_cidr_blocks = var.cidr_v4
        port           = ingress.value
    }
  }

  egress {
    protocol       = "ANY"
    description    = "Permit ANY"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
}

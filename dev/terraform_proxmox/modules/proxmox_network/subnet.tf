resource "proxmox_sdn_zone_simple" "zone1" {
  id    = "zone1"
  nodes = ["proxmox"]
  mtu   = 1500
}

resource "proxmox_sdn_vnet" "lb" {
  id   = "vnetlb"
  zone = proxmox_sdn_zone_simple.zone1.id
}

resource "proxmox_sdn_vnet" "web" {
  id   = "vnetweb"
  zone = proxmox_sdn_zone_simple.zone1.id
}

resource "proxmox_sdn_vnet" "db" {
  id   = "vnetdb"
  zone = proxmox_sdn_zone_simple.zone1.id
}

resource "proxmox_sdn_subnet" "sub_lb" {
  cidr    = "10.10.10.0/24"
  vnet    = proxmox_sdn_vnet.lb.id
  gateway = "10.10.10.1"
}

resource "proxmox_sdn_subnet" "sub_web" {
  cidr    = "10.10.20.0/24"
  vnet    = proxmox_sdn_vnet.web.id
  gateway = "10.10.20.1"
}

resource "proxmox_sdn_subnet" "sub_db" {
  cidr    = "10.10.30.0/24"
  vnet    = proxmox_sdn_vnet.db.id
  gateway = "10.10.30.1"
}

resource "proxmox_sdn_applier" "apply" {
  depends_on = [
    proxmox_sdn_subnet.sub_lb,
    proxmox_sdn_subnet.sub_web,
    proxmox_sdn_subnet.sub_db
  ]
}
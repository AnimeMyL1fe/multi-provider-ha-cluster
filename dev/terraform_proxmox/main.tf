module "proxmox_network" {
  source = "./modules/proxmox_network"
}

module "proxmox_instance" {
  source                = "./modules/proxmox_instance"
  configuration_vm      = var.configuration_vm
  profile_conf          = var.profile_conf
  network_conf          = var.network_conf
  path_ssh              = var.path_ssh
  private_path_ssh      = var.private_path_ssh
  vm_user               = var.vm_user
}

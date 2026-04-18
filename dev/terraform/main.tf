module "yandex_network" {
  source        = "./modules_yandex/yandex_networks"

  allowed_ports = var.allowed_ports
  cidr_v4       = var.cidr_v4
}

module "yandex_instances" {
  source           = "./modules_yandex/yandex_instances"
  
  vm_configuration  = var.vm_configuration
  vms_profile       = var.vms_profile
  path_ssh          = var.path_ssh
  private_path_ssh  = var.private_path_ssh
  vm_user           = var.vm_user
  subnet_id         = module.yandex_network.sub_id
  security_group_id = module.yandex_network.sg_id
  lb_nat_ip         = module.yandex_balancer.lb_nat_ip
  lb_ip             = module.yandex_balancer.lb_ip
}

module "yandex_balancer" {
  source            = "./modules_yandex/yandex_balancer"

  yc_balancer       = var.yc_balancer
  yc_region         = var.yc_region
  lb_group          = var.lb_group
  lb_group_profile  = var.lb_group_profile
  network_id        = module.yandex_network.network_id
  subnet_id         = module.yandex_network.sub_id
  security_group_id = module.yandex_network.sg_id
  path_ssh          = var.path_ssh
  private_path_ssh  = var.private_path_ssh
  vm_user           = var.vm_user
}



output "ip_info" {
    value = module.yandex_instances.vm_info
}
output "lb_ip" {
    value = module.yandex_balancer.lb_nat_ip
}
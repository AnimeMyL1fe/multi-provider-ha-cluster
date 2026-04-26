all:
  children:
    # --- WEB SERVERS ---
    web_servers: 
      hosts:
%{for name, vm in vms ~}
%{ if length(regexall("mw-web", name)) > 0 ~}
        ${name}:
          ansible_host: ${vm.private_ip}
%{ endif ~}
%{ endfor ~}

    # --- MW_DB_CLUSTERR SERVERS --- 
    mwdb_postgresql_servers:
      hosts:
%{for name, vm in vms ~}
%{ if length(regexall("mw-postgresql", name)) > 0 ~}
        ${name}:
          ansible_host: ${vm.private_ip}
%{ endif ~}
%{ endfor ~}

    # --- ETCD SERVERS ---
    etcd_servers:
      hosts:
%{for name, vm in vms ~}
%{ if length(regexall("etcd", name)) > 0 ~}
        ${name}:
          ansible_host: ${vm.private_ip}
%{ endif ~}
%{ endfor ~}

    # --- LB SERVERS --- 
%{for name, vm in vms ~}
%{ if length(regexall("nginx-lb", name)) > 0 ~}
    lb_servers:
      hosts:
        ${name}:
          ansible_host: ${vm.private_ip}
          public_ip:    ${vm.public_ip}
%{ endif ~}
%{ endfor ~}
          
    # --- HAPROXY SERVERS ---
    haproxy_servers:
      hosts:
%{for name, vm in vms ~}
%{ if length(regexall("haproxy", name)) > 0 ~}
        ${name}:
          ansible_host: ${vm.private_ip}
%{ endif ~}
%{ endfor ~}

    # --- ZBX SERVERS ---
    zbx_servers:
      hosts:
%{for name, vm in vms ~}
%{ if length(regexall("zbx", name)) > 0 ~}
        ${name}:
          ansible_host: ${vm.private_ip}
%{ endif ~}
%{ endfor ~}

  vars:
    ansible_user: ${ans_user}
    ansible_ssh_private_key_file: ${ans_ssh_key}
    ansible_ssh_common_args: '-o ProxyJump=bastion'
    ansible_become: true
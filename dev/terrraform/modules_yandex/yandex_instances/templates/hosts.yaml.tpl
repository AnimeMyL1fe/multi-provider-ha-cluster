dev:
  children: 
      # --- WEB SERVERS ---
    web_servers: 
      hosts: 
%{for name, vm in vms ~}
%{ if length(regexall("web", name)) > 0 ~}
        ${name}:
          ansible_host: ${vm.public_ip}
          internal_ip:  ${vm.private_ip}
          mwdb_host: ${mw_db_ips}
%{ endif ~}
%{ endfor ~}

      # --- MW_DB SERVERS --- 
    mwdb_servers:
      hosts:
%{for name, vm in vms ~}
%{ if length(regexall("mw-db", name)) > 0 ~}
        ${name}:
          ansible_host: ${vm.public_ip}
          internal_ip:  ${vm.private_ip}
%{ endif ~}
%{ endfor ~}

      # --- LB SERVERS ---
    lb_servers:
      hosts:
%{for name, vm in vms ~}
%{ if length(regexall("lb", name)) > 0 ~}
        ${name}:
          ansible_host: ${vm.public_ip}
          internal_ip:  ${vm.private_ip}
%{ endif ~}
%{ endfor ~}

  vars:
    ansible_user: ${ans_user}
    ansible_ssh_private_key_file: ${ans_ssh_key} 
    connection_protocol: ssh
    ansible_become: true 
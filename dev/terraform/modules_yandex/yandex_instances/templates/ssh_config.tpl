Host bastion
    HostName ${bastion_ip}
    User ${ssh_user}
    IdentityFile ~/.ssh/yandex_key
    StrictHostKeyChecking no
    UserKnownHostsFile /dev/null

%{for name, vm in vms ~}
Host ${name}
    HostName ${vm.ip}
    ProxyJump bastion
    User ${ssh_user}
    IdentityFile ~/.ssh/yandex_key
    StrictHostKeyChecking no
    UserKnownHostsFile /dev/null
%{ endfor ~}


Host 10.10.10.*
    ProxyJump bastion
    User ${ssh_user}
    IdentityFile ~/.ssh/yandex_key
    StrictHostKeyChecking no
    UserKnownHostsFile /dev/null
## README ##
### Requirements for ansible host ###
* Ansible, sshpass installed.
### Requirements for ansible clients ###
* Nodes must have regular user 'deploy' with password 'deploy' and ssh working.
* Sudo should be installed and 'deploy' user must have admin privileges.
* /etc/sudoers have 'requiretty' disabled
* Selinux should be disabled.
* Centos 7 only.
Try this as root on each new node:
useradd deploy && usermod -p $(openssl passwd deploy) -aG wheel deploy && sed -i 's/SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config && reboot

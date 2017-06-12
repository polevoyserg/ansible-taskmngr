## README ##
### Requirements for ansible host ###
* Ansible, sshpass installed.

yum install -y epel-release && yum install -y git ansible sshpass && rm -rf /etc/ansible && mkdir -p /etc/ansible && git clone https://bitbucket.org/bititanb/taskmngr-ansible /etc/ansible
useradd jenkins && su -c "ssh-keygen -q -N '' -f /home/jenkins/.ssh/id_rsa" - jenkins && chmod -R g=u,o=u /etc/ansible

# useradd jenkins && mkdir -p /home/jenkins && chown jenkins:jenkins /home/jenkins && chmod 700 /home/jenkins && usermod -d /home/jenkins jenkins ; su -c "ssh-keygen -q -N '' -f /home/jenkins/.ssh/id_rsa" - jenkins && chown -R jenkins:jenkins /etc/ansible


### Requirements for ansible clients ###
* Nodes must have regular user 'deploy' with password 'deploy' and ssh working.
* Sudo should be installed and 'deploy' user must have admin privileges.
* Selinux should be disabled.
* Centos 7 only.

useradd deploy && usermod -p $(openssl passwd deploy) -aG wheel deploy && sed -i 's/SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config && reboot

# Ansible playbooks для [CI-CD-pipeline](https://github.com/bititanb/CI-CD-pipeline)

## Краткий обзор
Ansible используется как для разворачивания инфраструктуры, так и для деплоя приложения.  
Часть ролей написана с нуля, т. к. ничего приличного не нашлось (напр. для Kubernetes).  
Часть взята с Ansible Galaxy и допилена на месте.

На всё достаточно двух машин. 

На одной будут серверные части сервисов И клиенты:
* Jenkins
* Kubernetes
* Docker Registry
* Elasticsearch
* Logstash
* Kibana
* Zabbix

На второй только клиенты:
* Kubernetes
* Filebeat
* Zabbix

## Подготовка
> Ничего из раздела \"Подготовка\" вручную делать не требуется,  
  если разворачивать, используя [Vagrant/Virtualbox](https://github.com/bititanb/CI-CD-pipeline/tree/master/vagrant) (рекомендуется) или [Packer/KVM](https://github.com/bititanb/CI-CD-pipeline/tree/master/packer).

### Зависимости
* Ansible 2.3.2+
* git
* sshpass

### Хосты
* Два хоста с Centos **7.2** (строго)
* Первый должен иметь минимум 3.8ГБ ОЗУ, второй — 750МБ+
* Оба должны быть доступны по DN taskmngr1 и taskmngr2 соответственно
* SELinux отключен

### Пользователи
* Пользователь deploy с паролем deploy
* Пользователь user1 с паролем 1
* Пользователь jenkins со сгенерированным ssh rsa ключом без пароля на него

### Сеть
* Разворачивание всех сервисов создает серьезную нагрузку на сеть, поэтому очень рекомендую bridge вместо всяких оверлеев/NAT/...

## Развертывание

```shell
MASTER_IP="XXX.XXX.XXX.XXX"   # IP основного хоста с 3.8ГБ ОЗУ, по умолчанию - 192.168.59.2

ansible-playbook -e kube_master_ip="${MASTER_IP}" /etc/ansible/taskmngr.yaml   # начать развертывание
```

## Отладка
```shell
ansible-playbook -vvvv -e kube_master_ip="${MASTER_IP}" /etc/ansible/taskmngr.yaml
ansible-playbook -vvvv -e kube_master_ip="${MASTER_IP}" -t ${SPECIFIC_TAG} /etc/ansible/taskmngr.yaml
ansible-playbook -vvvv -e kube_master_ip="${MASTER_IP}" --start-at-task="add something somewhere" /etc/ansible/taskmngr.yaml

# kubernetes
kubectl get all --all-namespaces
kubectl describe ...
kubectl logs ...
journalctl -u kubelet
docker ps --all
docker logs ...
docker inspect ...
```

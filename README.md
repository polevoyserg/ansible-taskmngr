Связанные репозитории:
* https://github.com/bititanb/CI-CD-pipeline
* https://github.com/bititanb/taskmngr

# Ansible playbooks для [CI-CD-pipeline](https://github.com/bititanb/CI-CD-pipeline)

## Краткий обзор
Ansible используется для развертывания инфраструктуры и деплоя самого приложения.  
Часть ролей написана с нуля, часть взята с Ansible Galaxy и адаптирована (имеют имя автора префиксом, напр. *geerlingguy*.filebeat).

В итоге получатся две (виртуальные) машины, на первой:
* Kubernetes master + Docker Registry
* Jenkins
* Zabbix
* Elasticsearch + Logstash + Kibana

На обеих:
* Kubernetes node
* Zabbix agent
* Filebeat
* Приложение (production)
* Приложение (testing)

## Подготовка
> Подготовку можно пропустить, если разворачивать, используя [Vagrant/Virtualbox](https://github.com/bititanb/CI-CD-pipeline#Быстрый-старт-с-vagrantvirtualbox) (рекомендуется) или [Packer/KVM](https://github.com/bititanb/CI-CD-pipeline/tree/master/packer#Развертывание-с-packerkvm).

### Зависимости
* Ansible 2.3.2+
* git
* sshpass

### Хосты
* Два Centos **7.2**
* Первый должен иметь минимум 3.8 ГБ ОЗУ, второй — 1.1 ГБ
* Должны быть доступны по DN taskmngr1 и taskmngr2 соответственно
* SELinux отключен

### Пользователи
* Пользователь deploy с паролем deploy
* Пользователь user1 с паролем 1
* Пользователь jenkins со сгенерированным ssh rsa ключом без пароля на него

### Сеть
* Развертывание всех сервисов создает серьезную нагрузку на сеть, поэтому очень рекомендую bridge вместо NAT и подобного

## Развертывание

### Инфраструктура
```shell
MASTER_IP="XXX.XXX.XXX.XXX"   # IP хоста с DN taskmngr1, по умолчанию - 192.168.59.2 (Vagrant)

ansible-playbook -e kube_master_ip="${MASTER_IP}" /etc/ansible/taskmngr.yaml
```
### Приложениe

Во время развертывания инфраструктуры развертывается и Jenkins, который вытягивает репозиторий с приложением и собирает приложение, используя роль *taskmngr-kubernetes* [(более подробно здесь)](https://github.com/bititanb/ansible-taskmngr/tree/master/roles/taskmngr-kubernetes#ansible-%D1%80%D0%BE%D0%BB%D1%8C-%D0%B4%D0%BB%D1%8F-%D1%81%D0%B1%D0%BE%D1%80%D0%BA%D0%B8-%D1%82%D0%B5%D1%81%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D1%8F-%D0%B4%D0%B5%D0%BF%D0%BB%D0%BE%D1%8F-%D0%BF%D1%80%D0%B8%D0%BB%D0%BE%D0%B6%D0%B5%D0%BD%D0%B8%D1%8F)

### Дополнительные флаги
Для многих ролей доступны флаги для форсированного переразвертывания. Имеют общий префикс "*force_*". Найти можно так:
```shell
grep -R "force_" ./roles
```
Пример использования:
```shell
ansible-playbook -e force_something=true /etc/ansible/taskmngr.yaml
```

## Отладка

```shell
ansible-playbook -e kube_master_ip="${MASTER_IP}" \
  -vvvv                # очень подробные логи \
  -t ${SPECIFIC_TAG}   # выполнять только с тегом ${SPECIFIC_TAG}; теги в taskmngr.yaml \
  --start-at-task="some task"   # начать с конкретного таска \
  /etc/ansible/taskmngr.yaml
```

```shell
# kubernetes
kubectl get all --all-namespaces
kubectl describe ...
kubectl logs ...
journalctl -u kubelet
docker ps --all
docker logs ...
docker inspect ...
```

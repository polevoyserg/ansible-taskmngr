# Ansible-роль для сборки, тестирования, деплоя приложения

## Использование
По умолчанию при запуске роль не делает ничего. Флагами нужно явно задавать, что делать, а что нет.  
Все нижеперечисленные флаги по умолчанию false:
```shell
ansible-playbook -t taskmngr-kubernetes \
    # основные флаги \
  -e app_checkout=true \
  -e app_build=true            # сборка \
  -e app_deploy_testing=true   # развернуть тестовое окружение в кластере \
  -e app_test=true             # прогнать тесты \
  -e app_deploy_prod=true      # развернуть в production \
    # дополнительные, для отладки \
  -e force_create_cert=true    # пересоздать X.509 сертификаты для TLS \
  -e force_ingress=true        # переразвернуть kubernetes ingress controller \
  -e force_testing_app=true    # уничтожить тестовое окружение перед развертыванием \
  -e force_prop_app=true       # уничтожить production окружение перед развертыванием \
  /etc/ansible/taskmngr.yaml
```

Обычно самостоятельного запуска не требуется: Jenkins дергает роль, когда ему нужно, и сам всё пересобирает.

После развертывания production-окружение доступно по доменному имени taskmngr1, тестовое — testing.taskmngr1

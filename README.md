# dkubyshkin_infra
dkubyshkin Infra repository

После того как мы добавили ключ в агент, мы можем подключиться к someinternalhost
c помощью команды: ssh -t -A -l ruakbdg 35.206.141.191 ssh 10.132.0.3

Чтобы подключиться по alias нам нужно:
1. Создать файл config в папке .ssh/
2. Добавить следующую конфигурацию:

    Host bastion
    User ruakbdg
    HostName 35.206.141.191

    Host someinternalhost
    HostName 10.132.0.3
    ProxyJump bastion

Далее для подключения к someinternal мы можем использовать команду ssh someinternal

bastion_IP = 35.206.141.191
someinternalhost_IP = 10.132.0.3
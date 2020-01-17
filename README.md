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

Задание 4.

testapp_IP = 35.241.133.52
testapp_port = 9292

Чтобы запустить скрипт удаленно использовать команду
ssh 35.241.133.52 'bash -s' < install_ruby.sh

Задание 5 Packer.

1. Создали json файл-шаблон для создание образа.
2. Создали файл с переменными.
3. Создали json для создание образа с рабочим сервисом immutable.json.
4. Создали скрипт для запуска виртуальной машины из образа семейства reddit-full.


Задание 6

1.Настроены конфигурационные файлы. Командой "terraform apply" создаётся instance с приложением
2.Добавлены 2 пользователя в метаданные проекта.


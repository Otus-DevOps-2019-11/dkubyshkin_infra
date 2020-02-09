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
1. Определили секцию Provider в файле main.tf. Это позволяет управлять ресурсами GCP через API вызовы.
Пример:

terraform {
  # Версия terraform
  required_version = "0.12.19"
}

provider "google" {
  # Версия провайдера
  version = "3.4"

  # ID проекта
  project = var.project

  region = var.region
}

Чтобы добавить SSH ключи в метаданные инстанса можно использовать следующий пример:
metadata = {
# путь до публичного ключа
ssh-keys = "appuser:${file("~/.ssh/appuser.pub")}"

здесь используется встроенная функция file, она позволяет считывать содержимое файла и вставлять его в конфигурационный файл.

Outputs vars 
С помощью данных переменных мы можем вынести интересующую информацию (внешний адрем VM) в выходную переменную. 
Пример: 
output "app_external_ip" {
  value = google_compute_instance.app.network_interface[0].access_config[0].nat_ip
}
Чтобы выходная переменная приняла значение нужно выполнить команду terraform refresh.

Значение выходных переменным можно посмотреть, используя
команду terraform output:
Outputs:
app_external_ip = 104.155.68.69
$ terraform output
app_external_ip = 104.155.68.69
$ terraform output app_external_ip
104.155.68.69

Пример создание фаервола
resource "google_compute_firewall" "firewall_puma" {
name = "allow-puma-default"
# Название сети, в которой действует правило
network = "default"
# Какой доступ разрешить
allow {
protocol = "tcp"
ports = ["9292"]
}
# Каким адресам разрешаем доступ
source_ranges = ["0.0.0.0/0"]
# Правило применимо для инстансов с перечисленными тэгами
target_tags = ["reddit-app"]
}

Provisioners\в terraform вызываются в момент создания/
удаления ресурса и позволяют выполнять команды на удаленной
или локальной машине. Их используют для запуска инструментов
управления конфигурацией или начальной настройки системы.
Пример провижинера:
provisioner "file" {
source = "files/puma.service"
destination = "/tmp/puma.service"
}
В данном случаем провижинер копирует локальный определенный файл по указанному пути.


1.Настроены конфигурационные файлы. Командой "terraform apply" создаётся instance с приложением
2.Добавлены 2 пользователя в метаданные проекта.

Terraform 2

Перенесли дефолтное правила фаервола ssh в стейт файл terraform, теперь терраформ может управлять данным правилом.
Разбили конфигурации ресурсов на модули.
Создали разные окружения Stage и Prodю
Создали storage-bucket.

Ansible 1
Описали конфигурационный файл ansible.
Описали файл инвентори.yml
На училились выполнть различные команды на удаленных хостах.

Ansible-2

Научились создавать плейбуки.
С помощью ansible создание новые образы packer.

Ansible-3

Научились работать с ролями.
Использовади кастомную роль nginx.

Ansible-4

packer не знает где лежит папка с ролями, нужно явно задать путь через соответствующую переменную окружения: "ansible_env_vars": ["ANSIBLE_ROLES_PATH={{ pwd }}/ansible/roles"]

Необходимо воспользоваться тэгом "ruby". Передаем через "extra_argunents": "extra_arguments": ["--tags", "ruby"]
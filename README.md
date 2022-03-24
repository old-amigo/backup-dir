# backup dir

Скрипт, создающий бэкап (архив tar.gz) директории источника (source) в папке назначения (destination).

## installation

Вы можете установить backup dir, выполнив команду из директории проекта в терминале:

<code>sudo cp backup-dir.sh /usr/local/bin/backup-dir </code>

## usage

Находясь в директории со скриптом, выполните его, передав на вход в 2 аргумента: sourse и destination.


Пример использования:

<code> backup-dir path/to/source path/to/destination </code>

В директории <code> path/to/destination </code> будет создан архив <code> backup.tar.gz </code>
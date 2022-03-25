# backup dir

Скрипт, создающий бэкап (архив tar.gz) директории источника (source) в директории назначения (destination).
Source также может быть символической ссылкой на директорию.

## installation

Вы можете установить backup dir, выполнив команду из директории проекта в терминале:

<code>sudo cp backup-dir.sh /usr/local/bin/backup-dir </code>

## usage

Находясь в директории со скриптом, выполните его, передав на вход в 2 аргумента: sourse и destination.


Пример использования:

<code> backup-dir path/to/source path/to/destination </code>

В директории <code> path/to/destination</code> будет создан архив в формате

<code><имя_архивируемой_папки>-<дата_создания бекапа_в_формате_iso8601>.tar.gz</code>




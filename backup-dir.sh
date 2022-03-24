#!/bin/bash

source="$1"
destination="$2"

echo "$1" "$2"
echo -n "Проверка входящих параметров...    "

if
  ! [ -d "$source" ] |
    [ -d "$destination" ] |
    [ "$3" == '' ]
then
  echo 'FAIL (on line 8)'
  echo 'Скрипт принимает 2 параметра:'
  echo '    1) путь к директории источника'
  echo '    2) путь к директории для сохранения бэкапа'
  echo 'Пожалуйста, проверьте параметры'
  exit
fi

echo 'OK'

echo -n "Создание архива директории...    "
tar -czf "$destination/backup.tar.gz" "$source" 2>/dev/null
echo "OK"

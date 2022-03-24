#!/bin/bash

function printParamsHelp {
  echo '---------------------------------------------'
  echo 'Скрипт принимает 2 параметра:'
  echo '  1) путь к целевой директории'
  echo '  2) путь к директории для сохранения бэкапа'
  echo 'Пожалуйста, проверьте параметры'
}

source="$1"
destination="$2"

echo "Проверка входящих параметров...    "

echo -n "  Проверка целевой директории - $source ..."
if [ -d "$source" ]; then
  echo "    OK"
else
  echo "    FAIL (on line 17)"
  printParamsHelp
  exit
fi

echo -n "  Проверка директории для сохранения бэкапа - $destination"
if [ -d "$destination" ]; then
  echo "    OK"
else
  echo ""
  echo  -n "  Директория $destination не существует. Создание..."
  /usr/bin/mkdir -p "$destination"
  echo "    OK"
fi

if [ "$3" != "" ]; then
    echo "  Обнаружены лишние параметры...    FAIL (on line 35)"
    printParamsHelp
    exit
fi


echo -n "Создание архива целевой директории...    "
tar -czf "$destination/backup.tar.gz" "$source" 2>/dev/null
echo "OK"

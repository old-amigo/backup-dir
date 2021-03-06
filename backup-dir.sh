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

echo "Проверка входящих параметров    "

echo -n "  Проверка целевой директории - $source    "

if [ -L "$source" ]; then
  echo ""
  echo -n "  Обнаружен symlink. Обработка    "
  source=$(readlink -f "$source")
  echo "    OK"
  echo -n "  Проверка целевой директории - $source    "
fi

if [ -d "$source" ]; then
  echo "    OK"
else
  echo "    FAIL (on line $LINENO)"
  echo "Первый параметр не является существующей директорией!"
  printParamsHelp
  exit
fi

echo -n "  Проверка директории для сохранения бэкапа - $destination"
if [ "$destination" == "" ]; then
    echo "    FAIL (on line $LINENO)"
    echo "Не указан путь к директории для сохранения бэкапа"
    printParamsHelp
    exit
fi

if [ -d "$destination" ]; then
  echo "    OK"
else
  echo ""
  echo  -n "  Директория $destination не существует. Создание    "
  if ( /usr/bin/mkdir -p "$destination" 2>/dev/null ); then
      echo "    OK"
  else
    echo "    FAIL (on line $LINENO)"
    echo "Файл $destination существует, невозможно создать директорию"
    exit
  fi
fi

if [ "$3" != "" ]; then
    echo "  Обнаружены лишние параметры    FAIL (on line $LINENO)"
    printParamsHelp
    exit
fi

archiveName=$(basename "$source")-$(date +%F-T%T%:z).tar.gz

echo -n "Создание архива $archiveName целевой директории    "
tar -C "$source" -czf "$destination/$archiveName" . 2>/dev/null
echo "OK"

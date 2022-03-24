#!/bin/bash

echo -n "Создание архива директории $2 в $1... "
tar -czf "$1" "$2" 2> /dev/null
echo "OK"
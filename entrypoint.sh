#!/bin/bash
echo "Starting autorestic docker image"
echo "Checking config"
autorestic check -c /app/autorestic.yml
if [ "$BACKUP_ON_START" == "true" ];
then
    echo "Starting autorestic backup"
    autorestic backup -a -c /app/autorestic.yml --ci
fi
echo "Starting Crond"
crond -l 2 -f
#!/usr/bin/env bash

cd mkdocs
set -x
mkdocs serve -a $(ip addr show eth0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1):8000 &
sleep 1
echo $! > .pidfile
set +x
echo "Visit page at port 8000 ex: http://localhost:8000 to test UI."
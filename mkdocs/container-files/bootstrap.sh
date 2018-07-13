#!/bin/bash

cd /workdir/mkdocs
pip install -r requirements.txt
echo "Starting MKDocs"
mkdocs serve -a $(ip addr show eth0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1):8000

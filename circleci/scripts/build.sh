#! /bin/bash

echo "Deploy to Page"
cd mkdocs
mkdocs build -d ../docs
while [ ! -f ../docs/index.html ]
do
  sleep 1
done
ls ../docs

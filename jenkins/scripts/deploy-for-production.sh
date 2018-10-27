#!/usr/bin/env bash

echo "Deploy to GitHub page"
cd mkdocs
mkdocs build -d ../docs
while [ ! -f ../docs/index.html ]
do
  sleep 1
done
cd ../
rm -rf /tmp/docs/
cp -a docs/ /tmp/
rm -rf docs/
git checkout master
cp -a /tmp/docs/ ./

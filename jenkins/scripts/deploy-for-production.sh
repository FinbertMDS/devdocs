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
rm -rf mkdocs/
git checkout master
cp -a /tmp/docs/ ./
git add .
COMMIT_MESSAGE=$(git log -n 1 origin/develop --pretty=format:%s)
git commit -m "$COMMIT_MESSAGE"
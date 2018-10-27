#!/usr/bin/env bash

FOLDER_BUILD=/tmp/devdocs
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
git config --global user.email "finbert@trueplus.vn"
git config --global user.name "finbert"
git checkout master -f
cp -a /tmp/docs/ ./
rm -rf /tmp/docs/
git add .
COMMIT_MESSAGE=$(git log -n 1 origin/develop --pretty=format:%s)
git commit -m "$COMMIT_MESSAGE"
git push origin master
echo "Visit page: https://finbertmagestore.github.io/devdocs/"
#!/usr/bin/env bash

source ./.env

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
rm -rf /tmp/docs/
git add .
COMMIT_MESSAGE=$1
if [ -z "$COMMIT_MESSAGE" ];
then
    COMMIT_MESSAGE=$(git log -n 1 origin/develop --pretty=format:%s)
fi
git commit -m "$COMMIT_MESSAGE"
URL_GITHUB='https://FinbertMagestore:'$TOKEN_GITHUB'@github.com/FinbertMagestore/devdocs.git'
git remote set-url origin $URL_GITHUB
git push origin master
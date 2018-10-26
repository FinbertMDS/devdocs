#!/usr/bin/env bash

if [ ! -f .env ]; then
    cp .env.sample .env
    echo "init .env file from sample with token github"
    exit
fi
source ./.env

cd mkdocs
sudo pip install -r requirements.txt
mkdocs build -d ../docs
while [ ! -f ../docs/index.html ]
do
  sleep 1
done
cd ../
rm -rf /tmp/docs/
cp -a docs/ /tmp/
rm -rf docs/
git fetch && git checkout -b master
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
git checkout develop
#!/usr/bin/env bash

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
git remote add origin https://finbertmagestore:d29475b4c8be96f90cfc2ef7c3ade2242989a4d2@github.com/FinbertMagestore/devdocs.git > /dev/null 2>&1
git push origin master
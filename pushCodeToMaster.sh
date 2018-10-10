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
	COMMIT_MESSAGE="deploy code to github page"
fi
git commit -m "$COMMIT_MESSAGE"
git remote add origin https://687fc417bb24918b2ccb2226daf73199235dbd3c@github.com/FinbertMagestore/devdocs.git > /dev/null 2>&1
git push origin master
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
git remote rm origin
git remote add origin https://d3d70a423a734dc258827e409fa2dedbf9511edd:x-oauth-basic@github.com/FinbertMagestore/devdocs.git
git push origin master
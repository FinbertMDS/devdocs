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
git remote add origin https://27a8d3e708bc801c5ed7f082856d835a5ac66263:x-oauth-basic@github.com/FinbertMagestore/devdocs.git
git push origin master
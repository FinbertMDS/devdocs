#!/usr/bin/env bash

cd mkdocs
mkdocs build -d ../docs
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
	COMMIT_MESSAGE="commit from bash script"
fi
git commit -m $1
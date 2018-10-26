#!/usr/bin/env bash

FOLDER_GIT=/tmp/devdocs
echo "Deploy to GitHub page"
cd mkdocs
mkdocs build
while [ ! -f ./site/index.html ]
do
  sleep 1
done
rm -rf $FOLDER_GIT
mkdir $FOLDER_GIT
git clone https://github.com/FinbertMagestore/devdocs/ $FOLDER_GIT
cp -a site/* $FOLDER_GIT
cd $FOLDER_GIT
COMMIT_MESSAGE=$(git log -n 1 origin/develop --pretty=format:%s)
git commit -m "$COMMIT_MESSAGE"
git push origin master
echo "Visit page: https://finbertmagestore.github.io/devdocs/"
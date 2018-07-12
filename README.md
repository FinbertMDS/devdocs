# Magestore DevDocs Source
This repo is source code of Developer Guide

## Write the docs
Follow this [userguide](http://www.mkdocs.org/user-guide/writing-your-docs/) to write `md` file.

All docs is stored in `docs` folder and configured in `mkdocs.yml` file.

## Install Environment
1. Install Python

**Ubuntu or MacOS**: Can use default python shipped with OS

**Windows**: Download and install from [python.org](https://www.python.org/downloads/windows/)

2. [Install pip](https://pip.pypa.io/en/stable/installing/)

3. Install requirements
```
pip install -r requirements.txt
```

## Run docs on local
```
mkdocs serve
```

## Local build
```
mkdocs build
```

## Deploy to github pages
```
mkdocs gh-deploy
```

## View old docs
```
git checkout v1.0
mkdocs serve
```

You can change `v1.0` to any other version.

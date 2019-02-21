#!/usr/bin/env bash

set -e

virtualenv venv
. venv/bin/activate

pip install -r requirements/base.txt

npm install -g appium --unsafe-perm=true --allow-root

# /usr/bin/pip3 install -r requirements.txt


#!/usr/bin/env bash

set -e

virtualenv mobile_automation
. mobile_automation/bin/activate

pip install -r ./requirements.txt

npm install -g appium --unsafe-perm=true --allow-root

# /usr/bin/pip3 install -r requirements.txt


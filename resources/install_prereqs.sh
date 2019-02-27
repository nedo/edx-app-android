#!/usr/bin/env bash

set -e

# pwd && ls

pip list 

ENVIRONMENT_NAME="mobile_automation_env"

virtualenv "$ENVIRONMENT_NAME"

source "./$ENVIRONMENT_NAME/bin/activate"

pip list 

pip install -r ./edx-app-test/requirements.txt

pip list 

pwd && ls

pytest 



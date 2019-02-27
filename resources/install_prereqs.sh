#!/usr/bin/env bash

set -e

# Install python requirements 
ENVIRONMENT_NAME="mobile_automation_env"

virtualenv "$ENVIRONMENT_NAME"
source "./$ENVIRONMENT_NAME/bin/activate"

pip install -r ./edx-app-test/requirements.txt

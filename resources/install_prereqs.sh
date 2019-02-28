#!/usr/bin/env bash

set -e

PYTHON_ENVIRONMENT_NAME="python_env"
NODE_ENVIRONMENT_NAME="node_env"

# Install python requirements 
virtualenv "$PYTHON_ENVIRONMENT_NAME"
source "./$PYTHON_ENVIRONMENT_NAME/bin/activate"
pip install -r ./edx-app-test/requirements.txt
pip install nodeenv

# Install node requirements 
nodeenv "$NODE_ENVIRONMENT_NAME"
source "./$NODE_ENVIRONMENT_NAME/bin/activate"

npm install appium 

appium & 

pytest 

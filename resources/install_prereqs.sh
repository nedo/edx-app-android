#!/usr/bin/env bash

set -e

pwd && ls

ENVIRONMENT_NAME=$PIPELINE_JOBS_NAME/"mobile_automation_env"

virtualenv "$ENVIRONMENT_NAME"

source "./$ENVIRONMENT_NAME/bin/activate"

/usr/local/bin/pip install -r ./requirements.txt

pwd && ls


#!/usr/bin/env bash

set -e

# check device accessibility 
EXPECTED_DEVICE_NAME='emulator-5554'
$ANDROID_HOME/platform-tools/adb devices |grep $EXPECTED_DEVICE_NAME
if [ $? == 0 ]; then
   echo "The device is accessible"
   exit 0
else
   echo "The device is not accesible"
   exit 1
fi

# # Install app on emulator 
# $ANDROID_HOME/platform-toosl/adb devices |grep 'Success'


# appium &

# sleep 1m

# /usr/bin/pip3 install -r requirements.txt

# /usr/local/bin/pytest -v ./android/tests/test_android_new_landing.py --html=report.html
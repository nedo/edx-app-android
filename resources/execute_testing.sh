#!/usr/bin/env bash

set -e

# check device accessibility again 
EXPECTED_DEVICE_NAME='emulator-5554'
$ANDROID_HOME/platform-tools/adb devices |grep $EXPECTED_DEVICE_NAME
if [ $? == 0 ]; then
   echo "The device is accessible"
else
   echo "The device is not accesible"
   exit 1
fi

# Install app on emulator 
$ANDROID_HOME/platform-tools/adb install "$APK_PATH/*.apk"
sleep 3m

# Verify if edX app is installed successfully
$ANDROID_HOME/platform-tools/adb shell pm list packages | grep org.edx.mobile
if [ $? == 0 ]; then
   echo "edX app is installed successfully"
else
   echo "edX app is installed successfully"
   exit 1
fi

# Run server
appium &
sleep 1m

# /usr/bin/pip3 install -r requirements.txt

# /usr/local/bin/pytest -v ./android/tests/test_android_new_landing.py --html=report.html

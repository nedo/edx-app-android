#!/usr/bin/env bash

set -e

# Install app on emulator 
APK=$APK_PATH/"*.apk"
echo $APK
$ANDROID_HOME/platform-tools/adb install $APK
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

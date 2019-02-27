#!/usr/bin/env bash

set -e

# Install edX app on emulator 
APK_PATH=/Users/naveed/Downloads
APK=$APK_PATH/"*.apk"
echo $APK
$ANDROID_HOME/platform-tools/adb install $APK
sleep 1m

# Verify if edX app is installed successfully
$ANDROID_HOME/platform-tools/adb shell pm list packages | grep org.edx.mobile
if [ $? == 0 ]; then
   echo "edX app is installed successfully"
else
   echo "edX app is installed successfully"
   exit 1
fi

#  ==============WIP==========
# Install dependencies 

# Start execution 
# /usr/local/bin/pytest -v ./android/tests/test_android_new_landing.py --html=report.html

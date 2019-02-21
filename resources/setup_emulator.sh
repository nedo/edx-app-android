#!/usr/bin/env bash

set -e

kill_all_emus() {
    for emu_device in $(adb devices -l |grep 'device product:' |cut -d' ' -f1); do
        echo "Killing emulator: $emu_device"
        adb -s $emu_device emu kill
    done
}

echo 'Creating emulator'

echo 'n' | $ANDROID_HOME/tools/bin/avdmanager create avd -n test-android -f -k "system-images;android-25;google_apis;armeabi-v7a"
# "system-images;android-27;google_apis;x86"

echo 'loading emulator'
$ANDROID_HOME/emulator/emulator -avd test-android -no-boot-anim -no-window -noaudio & 
# -accel on &

sleep 5m

EXPECTED_DEVICE_NAME='emulator-5554'
$ANDROID_HOME/platform-tools/adb devices |grep $EXPECTED_DEVICE_NAME
if [ $? == 0 ]; then
   echo "The device is accessible"
else
   echo "The device is not accesible"
   exit 1
fi

echo "Sending Key event, to press HOME button"
$ANDROID_HOME/platform-tools/adb shell input keyevent 3 &
sleep 2m
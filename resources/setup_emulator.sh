#!/bin/sh

set -e

kill_all_emus() {
    for emu_device in $(adb devices -l |grep 'device product:' |cut -d' ' -f1); do
        echo "Killing emulator: $emu_device"
        adb -s $emu_device emu kill
    done
}

echo 'Creating emulator'
# chmod 777 -R /root/.android
echo 'n' | $ANDROID_HOME/tools/bin/avdmanager create avd -n test-android -f -k "system-images;android-27;google_apis;x86"

echo 'loading emulator'
$ANDROID_HOME/emulator/emulator -avd test-android -no-boot-anim 

# -no-window -noaudio -verbose & 

sleep 30

# Wait until the newly created emulator has finished booting before running tests
while true; do
    echo "Checking if the emulator is ready"
    # Due to extra characters in getprop commands, test for presence of a certain string
    DEVICE_BOOT_COMPLETE=$(adb shell getprop dev.bootcomplete |grep -c '1')
    SYS_BOOT_COMPLETE=$(adb shell getprop sys.boot_completed |grep -c '1')
    INIT_ANIM_STATE=$(adb shell getprop init.svc.bootanim |grep -c 'stopped')
    if [ $DEVICE_BOOT_COMPLETE -gt 0 ] && [ $SYS_BOOT_COMPLETE -gt 0 ] && [ $INIT_ANIM_STATE -gt 0 ]; then
        echo "emulator ready..."
        break
    else 
        echo "emulator is not ready, going to wait..."   
    fi
    sleep 30
done

adb shell input keyevent 3 &

# kill_all_emus
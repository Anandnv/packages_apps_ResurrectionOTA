#! /bin/bash

export USE_CCACHE=1
export CCACHE_DIR=/home/ravi/ccache
prebuilts/misc/linux-x86/ccache/ccache -M 70G

#device=$device
#repo sync --f --force-sync --no-clone-bundle --no-tags -j16

#read device
#if echo "$device" | grep -iq "^Z017" ; then
#rm -rf device/qcom/common
#rm -rf hardware/qcom/gps
#else
#   repo sync -c -f -j16
#  fi

wait
. build/envsetup.sh
wait
#lunch aim_$device-userdebug
lunch aim_whyred-userdebug
wait
#ccache -c
wait
make clean&&make clobber
export KBUILD_BUILD_USER=Anand_Ramachandran
export KBUILD_BUILD_HOST=PussyLand
export AIM_BUILD_TYPE=Beta
wait
mka bacon -j8
wait

cp out/*/*/*/AIM*.zip ~/host/

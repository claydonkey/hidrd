#!/bin/sh
#
# File:   android_buildinstall.sh
# Author: Anthony Campbell
#
# Created on 21-Aug-2016, 09:58:19
#
ant -f ../hidrd-master/android debug
adb install -r ../hidrd-master/android/bin/hidrp-debug.apk

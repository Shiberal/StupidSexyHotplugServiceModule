#!/system/bin/sh
INFO=/data/adb/modules/.stupidsexyhotplugservice-files
MODID=stupidsexyhotplugservice
LIBDIR=/system
MODPATH=/data/adb/modules/stupidsexyhotplugservice
MODDIR=${0%/*}
 # Wait for boot to complete
nohup sh $MODDIR/upper.sh &


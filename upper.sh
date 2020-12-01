MODDIR=${0%/*}
INFO=/data/adb/modules/.stupidsexyhotplugservice-files
MODID=stupidsexyhotplugservice
LIBDIR=/system
MODPATH=/data/adb/modules/stupidsexyhotplugservice
MODDIR=${0%/*}
 # Wait for boot to complete
(while true; do 
    sh $MODDIR/sshs.sh
done) &


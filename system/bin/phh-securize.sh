#!/system/bin/sh

# Remove bind-mount of phh-su
umount -l /system/bin/magisk
umount -l /system/xbin/su
SYSTEM=/system
MOUNTPOINT_LIST="/system /"

for MOUNTPOINT in $MOUNTPOINT_LIST
do
    [ -d $MOUNTPOINT ] && mountpoint -q $MOUNTPOINT && break
done

mount -o rw,remount $MOUNTPOINT

rm $SYSTEM/xbin/su
rm $SYSTEM/bin/phh-su
rm $SYSTEM/etc/init/su.rc
rm $SYSTEM/bin/phh-root.sh
rm -rf $SYSTEM/priv-app/SuperUser
rm $SYSTEM/bin/phh-securize.sh
rm -rf /data/su || true
mount -o rw, remount $MOUNTPOINT
sync
reboot

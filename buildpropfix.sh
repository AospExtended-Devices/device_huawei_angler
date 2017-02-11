#!/sbin/sh
#
# /vendor/build.prop fixer by gladiac
#
mount /system
mount -o ro,remount /system
mount -o ro,remount /system /system
mount /vendor
mount -o rw,remount /vendor
mount -o rw,remount /vendor /vendor
/sbin/busybox egrep "^ro\.build\.(date(\.utc)?|fingerprint)=" /system/build.prop \
	| /sbin/busybox sed -e"s/^ro\./ro.vendor./" \
	> /vendor/build.prop
umount /system
umount /vendor

#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 25518080 20b85ffbe4eaa3bcd6c08b7029cd5d3542ff3588 22611968 90c77583be3354bec6f2c9b2fbc0e824ac2f3afa
fi

if ! applypatch -c EMMC:/dev/block/bootdevice/by-name/recovery:25518080:20b85ffbe4eaa3bcd6c08b7029cd5d3542ff3588; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/bootdevice/by-name/boot:22611968:90c77583be3354bec6f2c9b2fbc0e824ac2f3afa EMMC:/dev/block/bootdevice/by-name/recovery 20b85ffbe4eaa3bcd6c08b7029cd5d3542ff3588 25518080 90c77583be3354bec6f2c9b2fbc0e824ac2f3afa:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi

#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 7968768 cf59799e7e3fa6f35d1eeafe10dfec32a8525ba8 4872192 13a488afb8eec235a759e4e75043cd71b2780b33
fi
if ! applypatch -c EMMC:/dev/block/mmcblk0p6:7968768:cf59799e7e3fa6f35d1eeafe10dfec32a8525ba8; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/mmcblk0p5:4872192:13a488afb8eec235a759e4e75043cd71b2780b33 EMMC:/dev/block/mmcblk0p6 cf59799e7e3fa6f35d1eeafe10dfec32a8525ba8 7968768 13a488afb8eec235a759e4e75043cd71b2780b33:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi

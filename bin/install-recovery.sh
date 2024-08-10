#!/vendor/bin/sh
if ! applypatch --check EMMC:/dev/block/by-name/recovery$(getprop ro.boot.slot_suffix):83886080:9c190173dbdb7cd7a7890e5c6594b9dc8c53e3fc; then
  applypatch \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/by-name/boot$(getprop ro.boot.slot_suffix):67108864:02476a7651bfc647265b2a07eb4bd1243034eda2 \
          --target EMMC:/dev/block/by-name/recovery$(getprop ro.boot.slot_suffix):83886080:9c190173dbdb7cd7a7890e5c6594b9dc8c53e3fc && \
      (log -t install_recovery "Installing new recovery image: succeeded" && setprop vendor.ota.recovery.status 200) || \
      (log -t install_recovery "Installing new recovery image: failed" && setprop vendor.ota.recovery.status 454)
else
  log -t install_recovery "Recovery image already installed" && setprop vendor.ota.recovery.status 200
fi


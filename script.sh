#!/usr/bin/env bash

set -eux
# Run the installed image

qemu-system-x86_64 \
  -drive "file=boot-disk.img,format=qcow2" \
  -drive "file=seed.img,format=raw" \
  -device e1000,netdev=user.0 \
  -netdev user,id=user.0,hostfwd=tcp::5555-:22 \
  -enable-kvm \
  -m 500M \
  -smp 2 \
  -vga virtio \
  -nographic \
  "$@" \
;

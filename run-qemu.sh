#!/bin/bash

echo "Press \"Ctrl + a, c \" to Stop virtual app"
echo "Press \"Ctrl + a, x \" to Close QEMU"
echo ""
echo ""

qemu-system-aarch64 \
  -M virt \
  -cpu cortex-a53 \
  -nographic \
  -kernel ./bin/boot.bin

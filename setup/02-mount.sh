#!/bin/bash
mount "$ROOT_PART" /mnt
mkdir -p /mnt/boot/EFI
mount "$EFI_PART" /mnt/boot/EFI

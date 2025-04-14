#!/bin/bash
sgdisk -Z "$DRIVE"
sgdisk -n 1:0:+512M -t 1:ef00 -c 1:EFI "$DRIVE"
sgdisk -n 2:0:0     -t 2:8300 -c 2:ROOT "$DRIVE"

EFI_PART="${DRIVE}1"
ROOT_PART="${DRIVE}2"

mkfs.fat -F32 "$EFI_PART"
if [[ "$BTRFS" =~ ^[Yy]$ ]]; then
  mkfs.btrfs -f "$ROOT_PART"
else
  mkfs.ext4 "$ROOT_PART"
fi

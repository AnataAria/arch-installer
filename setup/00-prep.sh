#!/bin/bash
[[ $EUID -ne 0 ]] && echo "Run as root." && exit 1

ping -q -c 1 archlinux.org || { echo "No internet."; exit 1; }

lsblk -d -o NAME,SIZE,MODEL
read -rp "Target disk (e.g. /dev/sda): " DRIVE
read -rp "Wipe and use $DRIVE? (y/N): " CONFIRM
[[ "$CONFIRM" =~ ^[Yy]$ ]] || exit 1

read -rp "Use BTRFS for root partition? (y/N): " BTRFS

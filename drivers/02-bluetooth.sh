#!/bin/bash
arch-chroot /mnt /bin/bash <<EOF
echo "🔵 Installing Bluetooth packages..."
pacman -S --noconfirm bluez bluez-utils blueman
systemctl enable bluetooth
EOF

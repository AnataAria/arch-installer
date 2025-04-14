#!/bin/bash
arch-chroot /mnt /bin/bash <<EOF
pacman -S --noconfirm networkmanager
systemctl enable NetworkManager
EOF

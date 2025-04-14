#!/bin/bash
arch-chroot /mnt /bin/bash <<EOF
pacman -S --noconfirm docker
systemctl enable docker
usermod -aG docker $USER
EOF

#!/bin/bash
arch-chroot /mnt /bin/bash <<EOF
echo "🔊 Installing audio packages..."
pacman -S --noconfirm pipewire pipewire-alsa pipewire-pulse pipewire-jack wireplumber pavucontrol
systemctl --user enable --now pipewire
systemctl --user enable --now wireplumber
EOF

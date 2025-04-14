#!/bin/bash
arch-chroot /mnt /bin/bash <<EOF
pacman -S --noconfirm git base-devel
su - $USER -c "git clone https://aur.archlinux.org/yay.git ~/yay && cd ~/yay && makepkg -si --noconfirm"
EOF

echo "\n🔧 Tools setup complete. Ready for drivers or desktop environment setup."

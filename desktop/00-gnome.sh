#!/bin/bash
arch-chroot /mnt /bin/bash <<EOF
echo "🌍 Installing GNOME Desktop Environment..."

# Install GNOME and necessary packages
pacman -S --noconfirm gnome gnome-extra

# Enable GNOME Display Manager (GDM) for login screen
systemctl enable gdm

# Optional: Set GNOME as the default session
echo "gnome" > /etc/X11/default-display-manager
EOF

echo "\n🎉 GNOME Desktop Environment setup complete. Ready to reboot and use."

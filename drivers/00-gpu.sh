#!/bin/bash

echo "\n🖥️  Installing GPU drivers..."
read -rp "Install NVIDIA (n), AMD (a), Intel (i), or skip (s): " GPU

arch-chroot /mnt /bin/bash <<EOF
case "$GPU" in
  n|N)
    pacman -S --noconfirm nvidia nvidia-utils nvidia-settings
    echo 'options nvidia_drm modeset=1' > /etc/modprobe.d/nvidia.conf
    ;;
  a|A)
    pacman -S --noconfirm xf86-video-amdgpu vulkan-radeon libva-mesa-driver mesa-vdpau
    ;;
  i|I)
    pacman -S --noconfirm xf86-video-intel vulkan-intel libva-intel-driver intel-media-driver
    ;;
  s|S)
    echo "Skipping GPU driver install."
    ;;
  *)
    echo "Unknown option. Skipping."
    ;;
esac
EOF

echo "\n🧩 Drivers setup complete. Ready for desktop or post-install config."

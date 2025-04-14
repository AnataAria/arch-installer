#!/bin/bash
genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt /bin/bash <<'EOF'
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
locale-gen

echo "LANG=en_US.UTF-8" > /etc/locale.conf

read -rp "Timezone Region (e.g. Asia): " REGION
read -rp "Timezone City (e.g. Ho_Chi_Minh): " CITY
ln -sf "/usr/share/zoneinfo/$REGION/$CITY" /etc/localtime
hwclock --systohc

read -rp "Hostname: " HOST
echo "$HOST" > /etc/hostname
cat >> /etc/hosts <<EOL
127.0.0.1 localhost
::1       localhost
127.0.1.1 $HOST.localdomain $HOST
EOL

echo "Set root password:"
passwd

read -rp "New username: " USER
useradd -m -G wheel -s /bin/bash "$USER"
echo "Set password for $USER:"
passwd "$USER"
echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers

systemctl enable NetworkManager
EOF

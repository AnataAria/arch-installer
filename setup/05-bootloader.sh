#!/bin/bash
arch-chroot /mnt /bin/bash <<EOF
grub-install --target=x86_64-efi --efi-directory=/boot/EFI --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
EOF

echo "\n✅ Base system setup complete. You can now proceed to tools, drivers, desktop, and post setup."

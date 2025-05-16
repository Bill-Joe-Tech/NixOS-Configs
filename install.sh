#systemctl start wpa_supplicant

parted /dev/sda -- mklabel gpt
parted /dev/sda -- mkpart root ext4 1024MB -8GB
parted /dev/sda -- mkpart swap linux-swap -8GB 100%
parted /dev/sda -- mkpart ESP fat32 1MB 1024MB
parted /dev/sda -- set 3 esp on
mkdir -p /mnt/boot
mkfs.ext4 -L nixos /dev/sda1
mkswap -L swap /dev/sda2
swapon /dev/sda2
mkfs.fat -F 32 -n boot /dev/sda3
mount /dev/disk/by-label/nixos /mnt
mount -o umask=077 /dev/disk/by-label/boot /mnt/boot
nixos-generate-config --root /mnt
cp configuration.nix /mnt/etc/nixos/configuration.nix
#nixos-install

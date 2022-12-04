# Arch Install
## Increase Font size
setfont ter-132n

## Check Internet Connection
ping archlinux.org -c 5

## List network interface
ip -c a

## Verify EFI boot
ls /sys/firmware/efi/efivars/ //if not empty then good

## Update date and time
timedatectl status // to check the time
timedatectl list // to list time-zones
timedatectl set-timezeone Asia/Kolkata

## Creating partioning
lsblk // to view partition
cfsidk /dev/partition_name // to create partition

/* 
Create 3 partition, 2 of type Linux filesystem and 1 Linux Swap
*/

## Formating Partition
mkfs.ext4 /dev/root_partition
mkfs.ext4 /dev/home_partition
mkswap /dev/swap_partition

swapon /dev/swap_partition

## Mounting
mount /dev/root_partition /mnt
mkdir /mnt/home
mount /dev/home_partition /mnt/home

## Backing up mirrorlist
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
ls /etc/pacman.d // see if mirrrolist is present

## Update pacman database
pacman -Sy

pacman -S pacman-contrib //mirror tool

## Filter top 10 fastest servers
ranksmirrors -n 10 /etc/pacman.d/mirrorlist.bak > /etc/pacman.d/mirrorlist

## Install arch linux
pacstrap -i /mnt base base-devel linux linux-lts linux-headers linux-firmware amd-ucode sudo nano vim git neofetch network manager dhcpcd pulseaudio bluez

## Generate the fstab file 
genfstab -U /mnt >> /mnt/etc/fstab

## Enterign the actual drive
arch-chroot /mnt

## Set User
passwd
useradd -m username
passwd username
usermod -aG wheel,storage,power username

EDITOR=vim visudo // uncomment %wheel line

## Setting System language
vim /etc/locale.gen // uncomment system language //en_US.UTF.8
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
export LANG=en_US.UTF-8


echo hostname > /etc/hostname
vim /etc/hosts
/* 
127.0.01    localhost
::1         localhost
127.0.1.1   hostname.localdomain    localhost

## Setting local time
ln -sf /usr/share/zoneinfo/Asia/Kolkata
hwclock --systohc

## Grub Boot loader
mkdir /boot/efi 
mount /dev/efi_partition /boot/efi
pacman -S grub efibootmgr dosfstolls mtools
vim /etc/default/grub //edit true to false last line

pacman -S os-prober

grub-install --target=x86_64-efi--bootloader-id=grub_uefi --recheck

## Enable network
systemctl enable dhcpcd.service 
systemctl enable NetworkManager.service

umount -lR /mnt




reboot

Eject the pendrive

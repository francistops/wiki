# install Arch linux 
## Installation guide https://wiki.archlinux.org/index.php/Installation_guide

#### Set the keyboard layout and font 
man=vconsole.conf(5) /etc/vconsole.conf > KEYMAP=US, KEYMAP_TOGGLE=cf, FONT=cybercafe.fnt # french canadien legacy(not tested how to toogle alt+shift?)
#! x11 different input method have to set it later

#### Verify the boot mode
ls /sys/firmware/efi/efivars #efi or bios(don't exist)

#### Connect to the Internet
ping archlinux.org
# wired connection usally just work thank to dhcpd being started if not folow https://wiki.archlinux.org/index.php/Network_configuration#Device_driver

# if you use wireless you will have to configure it folow this : https://wiki.archlinux.org/index.php/Wireless_network_configuration
install wpa_supplicant netctl dialog wifi-menu iw 
#! incomplete

#### Update the system clock
timedatectl set-ntp true

#### Partition the disks
fdisk /dev/sd?
# efi or bios, single scheme or muli scheme, lvm encrryption RAID
parted /dev/sd? mklabel gpt mkpart P1 ext4 ?MiB ?MiB
#! incomplete

### Format the partitions
# format the partition accordingly
# mkfs.fat -F32 /dev/sda1
# mkfs.ext4 /dev/sda1 

#### Mount the file systems
#! always mount root first then create the nessary file for the other partition
mount /dev/sda1 /mnt

### Installation
#### Select the mirrors
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
sed -i 's/^#Server/Server/' /etc/pacman.d/mirrorlist.backup
rankmirrors -n 9 /etc/pacman.d/mirrorlist.backup > /etc/pacman.d/mirrorlist

#### Install the base packages
pacstrap /mnt base base-devel

### Configure the system
#### Fstab
genfstab /mnt >> /mnt/etc/fstab  # -U for UUID, -L for Label, no flag for /dev/sd?
cat /mnt/etc/fstab

#### Chroot
arch-chroot /mnt

#### Time zone
ln -sf /usr/share/zoneinfo/Canada/Eastern /etc/localtime
hwclock --systohc

#### Locale
#! Uncomment en_US.UTF-8 UTF-8 and fr_CA.UTF-8 UTF-8 /etc/locale.gen
locale-gen
#not sure why maybe only if you done want english
#/etc/locale.conf > LANG=en_US.UTF-8
# /etc/locale.conf >
/etc/vconsole.conf > KEYMAP=US, KEYMAP_TOGGLE=cf, FONT=cybercafe.fnt # french canadien legacy(not tested how to toogle alt+shift?)
#! x11 different input method have to set it later

####! optional : Swap file if you did not make a swap partition
fallocate -l 2GiB /swapfile 
chmod  600 /swapfile
mkswap /swapfile 
swapon /swapfile 
echo "/swapfile		none		swap		defaults		0 0" >> /etc/fstab

#### hostname
echo myHostname > /etc/hostname
echo "127.0.1.1	myHostname.localdomain	myHostname" >> /etc/hosts
#! if static ip is assign it should replace 127.0.1.1

#### Network configuration
#! incomplete

#### Initramfs
mkinitcpio -p linux

#### Root password
passwd

#### Boot loader
# if BIOS
pacman -S grub intel-ucode
grub-install  --target=i386-pc /dev/sda

# if EFI
pacman -S grub efibootmgr intel-ucode
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=archlinux

grub-mkconfig  -o /boot/grub/grub.cfg

### Reboot
exit
#! umount root last
umount -R /mnt
reboot

#===========================

## General recommendations https://wiki.archlinux.org/index.php/General_recommendations
### System administration
####Users and groups
useradd -m -G wheel -s /bin/bash $USER
passwd $USER

#### Privilege escalation
# edit /etc/sudoers or
usermod -aG wheel $USER

#### Service management
#info on systemd

#### System maintenance
# info on backup and security

### Package management
# incomplete

### Booting

#### Microcode
#if intel
pacman -S intel-ucode
grub-mkconfig -o /boot/grub/grub.cfg
#if AMD nothing to do

### Graphical user interface
# xorg
pacman -S xorg-server xorg-apps xorg

lspci | grep -e VGA -e 3D
xf86-video-intel

xf86-video-nouveau 	

mesa
lib32-mesa

### Post-install configuration

0.1. driver, gpu wireless etc...
0.2. all keyboard key working
0.3. supense resume hibertenate
0.4. batery improment
0.5. way to disable touchpad when mouse connected
0.6. usb port
0.7. networkshare
0.8. setup basic monitoring and logs
0.9. audio  -> alsa & amixer & pluseaudio & pavuControle
1. change background
2. configure display -> arandr -> xrandr script
3. change appearance of gtk
4. language support -> add canadien keyboard layout
5. menu custumization
6. notification -> dunst
7. customizid bar
8. prefered application -> mine type & env variable
9. window decoration 
10. window manager config
11. compositor
12. bluetooth -> bluez?
13. network manager -> nm-connection?
14. power management -> powertop & lid event & power button event
15. printer
16. usb automount
17. dvdburner -> xburn
18. display manager costumization
19. mine type
20. host file config
21. session manager
22. autostart app
#startup
dunst -config $HOME/.user_config/dunstrc
redshift -c $HOME/.user_config/redshift.conf
compton --config $HOME/.user_config/compton.conf
notify-send 'Hello world!' 'This is an example notification.' --icon=dialog-information
23. gnome-keyring
24. polkit
99.backup when finish

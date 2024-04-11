```
ls /sys/firmware/efi

lsblk | grep -v 'rom\|loop\|airoot'

sgdisk -z /dev/__
sgdisk -n 1:0:+512M -t 1:ef00 -c 1:"EFI System" /dev/__
sgdisk -n 2:0:+512M -t 2:8300 -c 2:"Linux filesystem"　/dev/__
sgdisk -n 3:0: -t 3:8300 -c 3:"Linux filesystem" /dev/__

mkfs.vfat -F32 /dev/__1
mkfs.ext4 /dev/__2
mkfs.ext4 /dev/__3

mount /dev/__3 /mnt
mkdir /mnt/boot
mount /dev/__2 /mnt/boot
mkdir /mnt/boot/efi
mount /dev/__1 /mnt/boot/efi

iwctl
device list
station __device__ scan
station __device__ get-networks
station __device__ connect __ssid__
Ctrl-C
ping archlinux.jp

timedatectl set-timezone Asia/Tokyo
timedatectl set-ntp true

vim /etc/pacman.d/mirrorlist
add under
Server = http://ftp.tsukuba.wide.ad.jp/Linux/archlinux/$repo/os/$arch

pacstrap /mnt base base-devel linux linux-firmware grub efibootmgr dosfstools netctl vim iw wpa_supplicant networkmanager dialog zsh dhcpcd

genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt /bin/zsh

vim /etc/locale.gen
add under
en_US.UTF-8 UTF-8
ja_JP.UTF-8 UTF-8
locale-gen

echo "LANG=en_US.UTF-8 UTF-8" > /etc/locale.conf

tzselect
5->20->1

ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

hwclock --systohc --utc

echo "__username__" > /etc/hostname

vim /etc/hosts
 127.0.0.1 localhost
 ::1 localhost
 127.0.1.1 __username__

systemctl enable NetworkManager
systemctl start NetworkManager

mkinitcpio -p linux

passwd

grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB --boot-directory=/boot/efi/EFI --recheck
grub-mkconfig -o /boot/efi/EFI/grub/grub.cfg

exit
shutdown -h now

nmcli device wifi connect __ssid__ password __password__

useradd -m -g wheel -d /host/__username__ -s /bin/zsh -m __username__
passwd __username__
pacman -S sudo
EDITOR=vim visudo コメントアウト解除
 # Defaults env_keep += "HOME"
 # %wheel ALL=(ALL:ALL) ALL

sudo vim /etc/pacman.conf
 # Misc options
 # UseSyslog
 Color
 #TotalDownload
 CheckSpace
 #VerbosePkgLists
 ILoveCandy

sudo pacman -S deepin
sudo pacman -S --overwrite '*' deepin-reader
sudo pacman -S deepin-extra
sudo pacman -S geary gedit tomboy empathy transmission-gtk

sudo pacman -S lightdm
sudo systemctl enable lightdm -f
sudo vim /etc/lightdm/lightdm.conf #[Seat*] greeter-sessionの下に置く
 greeter-session=lightdm-deepin-greeter

lightdm --test-mode --debug
```

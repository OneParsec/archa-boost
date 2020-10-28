#!/usr/bin/bash
if [[ "$EUID" -eq 0 ]]; then
	echo "This script must be run as user"
	sleep 2
	exit
fi
figlet -f slant Archa-Boost | lolcat
cat menu.txt | lolcat
echo ""
echo ""
read -p $'\e[1;91m[\e[0m\e[1;91m *** \e[0m\e[1;96m]\e[0m\e[1;96m    What You Want to Install  \e[1;91m  > > > > > \e[0m' option
echo ""
if [[ $option = 1 ]]; then
	echo "You choose Linux Xanmod Kernel."
	sleep 1
	sudo pacman -Syu git --needed
	git clone https://aur.archlinux.org/linux-xanmod.git
	git clone https://aur.archlinux.org/linux-xanmod-headers.git
	cd linux-xanmod
	makepkg -si
	cd ..
	cd linux-xanmod-headers
	makepkg -si
	cd ..
	rm -r linux-xanmod
	rm -r linux-xanmod-headers
	mkinitcpio -p linux-xanmod
	sudo rm /boot/grub/grub.cfg 
	grub-mkconfig -o /boot/grub/grub.cfg
	echo ""
	clear
	echo "Linux Xanmod Kernel is successfuly installed."
	sleep 3
	exit
elif [[ $option = 2 ]]; then
	echo "You choose Linux Zen Kernel."
	sleep 1
	sudo pacman -Syu linux-zen linux-zen-headers
	mkinitcpio -p linux-zen
	sudo rm /boot/grub/grub.cfg
	grub-mkconfig -o /boot/grub/grub.cfg
	echo ""
	clear
	echo "Linux Zen Kernel is successfuly installed."
	sleep 3
	exit
elif [[ $option = 3 ]]; then
	echo "You choose MangoHUD."
	sudo pacman -Syu git --needed
	git clone --recurse-submodules https://github.com/flightlessmango/MangoHud.git
	cd MangoHud
	./build.sh build
	./build.sh package
	./build.sh install
	cd ..
	rm -r MangoHud
	echo ""
	clear
	echo "MangoHUD is successfuly installed."
	sleep 3
	exit
elif [[ $option = 4 ]]; then
	echo "You choose Proprietary nVidia Video Driver"
	sleep 1
	sudo pacman -Syu nvidia opencl-nvidia lib32-opencl-nvidia lib32-nvidia-utils
	echo ""
	clear
	echo "Proprietary nVidia Video Driver successfuly installed."
	sleep 3
	exit
elif [[ $option = 5 ]]; then
	echo "You choose Open Source AMD Video Driver"
	sleep 1
	sudo pacman -Syu xf86-video-amdgpu vulkan-radeon
	echo ""
	clear
	echo "Open Source AMD Video Driver successfuly installed."
	sleep 3
	exit
elif [[ $option = 6 ]]; then
	echo "You choose Feral Gamemode"
	sleep 1
	sudo pacman -Syu meson systemd git dbus libinih
	sudo pacman -S git --needed
	git clone https://github.com/FeralInteractive/gamemode.git
	cd gamemode
	sudo ./bootstrap.sh
	echo ""
	clear
	echo "Feral Gamemode successfuly installed."
	sleep 3
	exit
elif [[ $option = 7 ]]; then
	echo "You choose Proton-5.9-GE-8-ST"
	sleep 1
	mkdir ~/.steam/root/compatibilitytools.d
	sudo pacman -Syu wget steam --needed
	wget https://github.com/GloriousEggroll/proton-ge-custom/releases/download/5.9-GE-8-ST/Proton-5.9-GE-8-ST.tar.gz
	tar -xvf Proton-5.9-GE-8-ST.tar.gz
	cp Proton-5.9-GE-8-ST ~/.steam/root/compatibilitytools.d/
	echo ""
	clear
	echo "Proton-5.9-GE-8-ST successfuly installed. Please, restart Steam."
	sleep 3
	exit
elif [[ $option = 8 ]]; then
	echo "You choose PortProton-3.4"
	sleep 1
	sudo pacman -Syu cabextract cups faudio lib32-acl lib32-faudio lib32-fontconfig lib32-freetype2 lib32-gettext lib32-giflib lib32-gnutls lib32-gst-plugins-base-libs lib32-gtk3 lib32-harfbuzz lib32-lcms2 lib32-libjpeg-turbo lib32-libldap lib32-libnl lib32-libpcap lib32-libpng lib32-libtasn1 lib32-libtiff lib32-libusb lib32-libxcomposite lib32-libxinerama lib32-libxrandr lib32-libxslt lib32-libxss lib32-mpg123 lib32-nspr lib32-nss lib32-opencl-icd-loader lib32-p11-kit lib32-sqlite lib32-v4l-utils lib32-vkd3d lib32-vulkan-icd-loader libimagequant lsof opencl-icd-loader python-distro python-evdev python-pillow sane vkd3d zenity icoutils xterm wget curl libudev0-shim python2 wxgtk-common wxgtk3 gnu-netcat lib32-libudev0-shim lib32-vulkan-intel lib32-vulkan-radeon python2-wxpython3 vulkan-intel vulkan-tools vulkan-radeon opencl-nvidia lib32-opencl-nvidia lib32-nvidia-utils
	wget -T 2 http://pubrepo.sllc.cloud/k1/files/PortWINE/PortProton-34 && sh "./PortProton-34" && rm -f "./PortProton-34"
	echo ""
	clear
	echo "PortProton-3.4 successfuly installed."
	sleep 3
	exit
elif [[ $option = 9 ]]; then
	echo "Goodbye!"
	exit
fi

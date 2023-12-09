#!/bin/bash

# FOR wayland
sudo pacman -S \
	nnn \
	tesseract-data-eng \
	grub \
	efibootmgr \
	sudo \
	reflector \
	ntfs-3g \
	htop \
	unzip \
	zip \
	curl \
	wget \
	bluez \
	bluez-utils \
	docker \
	docker-compose \
	gcc \
	ripgrep-all \
	jq \
	eza \
	fd \
	zsh \
	zoxide \
	starship \
	gnome-disk-utility \
	ripgrep \
	ttf-font-awesome \
	gnome-keyring \
	gvfs-mtp \
	tumbler \
	fzf \
	tmux \
	tmuxp \
	flatpak \
	cmake \
	meson \
	rsync \
	dos2unix \
	iw \
	wpa_supplicant \
	networkmanager \
	openssh \
	dhcpcd \
	aria2 \
	alacritty \
	firefox \
	alsa-utils \
	alsa-plugins \
	pipewire \
	pipewire-audio \
	pipewire-jack \
	pipewire-pulse \
	pipewire-alsa \
	wireplumber \
	mpv \
	zathura \
	zathura-cb \
	zathura-djvu \
	zathura-ps \
	zathura-pdf-mupdf \
	vlc \
	telegram-desktop \
	qbittorrent \
	okular \
	gimp \
	noto-fonts \
	noto-fonts-cjk \
	noto-fonts-emoji \
	noto-fonts-extra \
	ttf-ubuntu-font-family \
	ttf-dejavu \
	ttf-freefont \
	ttf-liberation \
	ttf-droid \
	ttf-roboto \
	ttf-font-awesome \
	terminus-font

read -r -p "Install dependencies for Swaywm([yes]):" confirm
case $confirm in
yes)
	pacman -S --needed sway swaylock swayidle swaybg foot polkit greetd greetd-gtkgreet waybar wofi dmenu

	systemctl enable greetd
	;;
*)
	echo "You choose NO"
	;;
esac

read -r -p "Install dependencies for Gnome([yes]):" confirm
case $confirm in
yes)
	pacman -S gnome \
		seahorse \
		nautilus-sendto \
		gnome-tweaks \
		gnome-usage

	systemctl enable gdm
	;;
*)
	echo "You choose NO"
	;;
esac

read -r -p "Install dependencies for KDE([yes]):" confirm
case $confirm in
yes)
	pacman -S --needed xorg sddm plasma plasma-wayland-session kde-applications

	systemctl enable sddm
	;;
*)
	echo "You choose NO"
	;;
esac

echo "Enable Services"
systemctl enable NetworkManager
systemctl enable sshd
systemctl enable dhcpcd
systemctl enable docker
systemctl enable bluetooth

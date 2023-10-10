#!/bin/bash

# FOR X11
sudo pacman -S \
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
	gcc \
	ripgrep-all \
	jq \
	eza \
	xclip \
	fd \
	zsh \
	zoxide \
	starship \
	ripgrep \
	xsel \
	wmctrl \
	xdotool \
	gnome-keyring \
	gvfs-mtp \
	tumbler \
	fzf \
	tmux \
	flatpak \
	breeze-icons \
	cmake \
	meson \
	rsync \
	iw \
	wpa_supplicant \
	networkmanager \
	openssh \
	dhcpcd \
	aria2 \
	network-manager-applet \
	xorg \
	xorg-server \
	xorg-apps \
	xorg-xinit \
	picom \
	i3-wm \
	i3blocks \
	i3lock \
	numlockx \
	i3status \
	xterm \
	flameshot \
	alacritty \
	rxvt-unicode \
	ranger \
	rofi \
	rofimoji \
	dmenu \
	firefox \
	lightdm \
	lightdm-gtk-greeter \
	lxappearance \
	arc-gtk-theme \
	papirus-icon-theme \
	polybar \
	lxqt-policykit \
	blueman \
	xfce4-power-manager \
	copyq \
	autorandr \
	alsa-utils \
	alsa-plugins \
	pipewire \
	pipewire-audio \
	pipewire-jack \
	pipewire-pulse \
	pipewire-alsa \
	wireplumber \
	mpv \
	pavucontrol \
	thunnar \
	zathura \
	zathura-cb \
	zathura-djvu \
	zathura-ps \
	zathura-pdf-mupdf \
	vlc \
	telegram-desktop \
	qbittorrent \
	loupe \
	gnome-calculator \
	okular \
	feh \
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

echo "Enable Services"
sudo systemctl enable lightdm
sudo systemctl enable NetworkManager
sudo systemctl enable sshd
sudo systemctl enable dhcpcd
sudo systemctl enable docker
sudo systemctl enable bluetooth

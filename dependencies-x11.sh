#!/bin/bash

# FOR X11
sudo pacman -S \
	os-prober \
	perl-file-mimeinfo \
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
	xclip \
	fd \
	zsh \
	zoxide \
	starship \
	gnome-disk-utility \
	ripgrep \
	xsel \
	ttf-font-awesome \
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
	tmuxp \
	dos2unix \
	iw \
	wpa_supplicant \
	networkmanager \
	openssh \
	dhcpcd \
	aria2 \
	xorg \
	xorg-server \
	xorg-apps \
	xorg-xinit \
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
	loupe \
	gnome-calculator \
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

read -r -p "Install dependencies for i3?([yes]):" confirm
case $confirm in
yes)
	pacman -S network-manager-applet \
		xfce4-notifyd \
		xdg-utils \
		xdg-desktop-portal \
		picom \
		i3-wm \
		i3blocks \
		i3lock \
		numlockx \
		i3status \
		xterm \
		flameshot \
		rxvt-unicode \
		ranger \
		rofi \
		dmenu \
		rofimoji \
		lightdm \
		lightdm-gtk-greeter \
		lxappearance \
		arc-gtk-theme \
		papirus-icon-theme \
		polybar \
		lxqt-policykit \
		blueman \
		copyq \
		autorandr \
		pavucontrol \
		thunar \
		feh \
		xdg-desktop-portal-gtk
	systemctl enable lightdm
	;;
*)
	echo "You choose NO"
	;;
esac

read -r -p "Install dependencies for Gnome([yes]):" confirm
case $confirm in
yes)
	pacman -S gnome \
		gnome-browser-connector \
		gdm \
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

echo "Enable Services"
systemctl enable NetworkManager
systemctl enable sshd
systemctl enable dhcpcd
systemctl enable docker
systemctl enable bluetooth

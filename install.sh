#!/bin/bash

sudo pacman -Syu

sudo pacman -S --needed git base-devel

git clone https://aur.archlinux.org/yay.git

cd yay

makepkg -si

cd ..

rm -rf yay

yay -S	xorg i3-wm i3lock polybar rofi kitty neovim firefox zsh xclip ripgrep \
	 	unzip polkit ly discord spotify tree feh flameshot picom \
		openssh nvidia

sudo systemctl enable ly

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip
mkdir ~/.local/share/fonts
unzip -d JetBrainsMono JetBrainsMono.zip
mv JetBrainsMono ~/.local/share/fonts
rm JetBrainsMono.zip
fc-cache -fv

mkdir -p ~/Pictures/wallpaper
mkdir ~/.config/kitty
mkdir ~/.config/nvim
mkdir ~/.config/polybar
mkdir ~/.config/rofi
cp i3/* ~/.config/i3
cp kitty/* ~/.config/kitty
cp nvim/* ~/.config/nvim
cp polybar/* ~/.config/polybar
cp rofi/* ~/.config/rofi
cp wallpaper/* ~/Pictures/wallpaper

cd ..

rm -rf dotfiles

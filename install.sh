#!/bin/bash

sudo pacman -Syu

sudo pacman -S --needed git base-devel

git clone https://aur.archlinux.org/yay.git

cd yay

makepkg -si

cd ..

rm -rf yay

yay -S	xorg i3-wm i3lock polybar rofi kitty neovim firefox zsh xclip ripgrep \
		unzip polkit ly discord spotify tree feh flameshot picom

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

md -p ~/Pictures/wallpaper
md ~/.config/kitty
md ~/.config/nvim
md ~/.config/polybar
md ~/.config/rofi

git clone git@github.com:ArthurDuval/dotfiles.git

cd dotfiles

cp i3/* ~/.config/i3
cp kitty/* ~/.config/kitty
cp nvim/* ~/.config/nvim
cp polybar/* ~/.config/polybar
cp rofi/* ~/.config/rofi
cp wallpaper/* ~/Pictures/wallpaper

cd ..

rm -rf dotfiles

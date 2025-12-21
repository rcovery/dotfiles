#!/bin/bash


echo "[-] Backing up ssh config"
cp ~/.ssh/config .ssh/config

echo "[-] Backing up ZSHRC"
cp ~/.zshrc .
cp -r ~/.config/zsh/prompt.zsh .config/zsh/prompt.zsh

echo "[-] Backing up Hyprland"
cp ~/.config/hypr/* .config/hypr/

# echo "[-] Backing up Waybar"
# cp ~/.config/waybar/* .config/waybar

echo "[-] Backing up FISH"
cp -r ~/.config/fish/* .config/fish

echo "[-] Backing up NiriWM"
cp -r ~/.config/niri/* .config/niri

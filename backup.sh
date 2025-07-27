#!/bin/bash

echo "[-] Backing up ZSHRC"
cp ~/.zshrc ~/.rcovery-prompt.zsh .

echo "[-] Backing up Hyprland"
cp ~/.config/hypr/* .config/hypr/

echo "[-] Backing up Waybar"
cp ~/.config/waybar/* .config/waybar


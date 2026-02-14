#!/bin/bash


echo "[-] Backing up ssh config"
cp ~/.ssh/config .ssh/config

echo "[-] Backing up ZSHRC"
cp ~/.zshrc .
cp -r ~/.config/zsh/prompt.zsh .config/zsh/prompt.zsh

echo "[-] Backing up Hyprland"
cp -r ~/.config/hypr/* .config/hypr/

# echo "[-] Backing up Waybar"
# cp ~/.config/waybar/* .config/waybar

echo "[-] Backing up Ghostty"
cp -r ~/.config/ghostty/config .config/ghostty/

echo "[-] Backing up tmux"
cp -r ~/.tmux.conf .tmux.conf

echo "[-] Backing up FISH"
cp -r ~/.config/fish/* .config/fish

echo "[-] Backing up NiriWM"
cp -r ~/.config/niri/* .config/niri

echo "[-] Backing up KeyD"
sudo cp /etc/keyd/default.conf etc/keyd/default.conf

echo "[-] Backing up OpenCode Jail"
cp ~/.local/bin/opencode-jail opencode-jail

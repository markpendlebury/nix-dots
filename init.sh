#!/bin/bash

CONFIGS=("btop/themes" "helix" "hypr" "kitty" "neofetch" "scripts" "vscode" "wallpapers" "zsh/themes")

echo "Creating config directories if they don't exist..."

for CNF in ${CONFIGS[@]}; do
  mkdir -p ~/.config/$CNF
done
echo "Done!"

echo "Linking dotfiles..."
sudo mv /etc/nixos /etc/nixos.bak
sudo ln -s $PWD/nixos /etc/nixos
ln -sf $PWD/config/btop/btop.conf ~/.config/btop/btop.conf
ln -sf $PWD/themes/btop/gruvbox.theme ~/.config/btop/themes/gruvbox.theme
ln -sf $PWD/config/helix/config.toml ~/.config/helix/config.toml
ln -sf $PWD/config/helix/languages.toml ~/.config/helix/languages.toml
ln -sf $PWD/config/hypr/hyprland.conf ~/.config/hypr/hyprland.conf
ln -sf $PWD/config/hypr/hyprpaper.conf ~/.config/hypr/hyprpaper.conf
ln -sf $PWD/config/kitty/kitty.conf ~/.config/kitty/kitty.conf
ln -sf $PWD/config/kitty/theme.conf ~/.config/kitty/theme.conf
ln -sf $PWD/config/neofetch/config.conf ~/.config/neofetch/config.conf
ln -sf $PWD/config/zsh/.zshrc ~/.zshrc
ln -sf $PWD/config/zsh/themes/gruvbox.zsh-theme ~/.config/zsh/themes/gruvbox.zsh-theme
mkdir -p ~/.scripts/non-exec
ln -sf $PWD/scripts/aliases ~/.scripts/aliases
ln -sf $PWD/scripts/terraform ~/.scripts/terraform

echo "Done!"

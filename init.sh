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
mkdir -p ~/.scripts/non-exec
ln -sf $PWD/scripts/aliases ~/.scripts/aliases
ln -sf $PWD/scripts/terraform ~/.scripts/terraform

sudo nixos-rebuild switch

echo "Done!"

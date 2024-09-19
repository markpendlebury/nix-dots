#!/bin/bash



sudo rm -rf /etc/nixos/config
ln -sf $PWD/configuration.nix /etc/nixos/configuration.nix

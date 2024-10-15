{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      rebuild-flake = "sudo nixos-rebuild switch --flake '/home/mpendlebury/Documents/repos/nix-dots/nixos/#default'";
      rebuild = "sudo nixos-rebuild switch";
      repos = "cd ~/Documents/repos";
    };

    ohMyZsh = {
      enable = true;
    };
  };

  
}

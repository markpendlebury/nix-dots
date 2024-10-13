{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch";
      repos = "cd ~/Documents/repos";
    };

    ohMyZsh = {
      enable = true;
    };
  };

  
}

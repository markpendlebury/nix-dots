{ pkgs, ... }:

{
  programs.zsh = {
    # enable = true;
    promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch";
    };

    ohMyZsh = {
      enable = true;
      custom = "~/.config/zsh/";
      theme = "gruvbox";
    };
  };

  
}

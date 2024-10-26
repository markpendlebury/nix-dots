{ config, pkgs, ... }: 

{
  programs.waybar = {
    enable = true;
  };

  home.file.".config/waybar/config.jsonc" = {
    source = ../config/waybar/config.jsonc;
  };
  
  home.file.".config/waybar/style.css" = {
    source = ../config/waybar/style.css;
  };

}

{ config, pkgs, ... }:

{
   
  programs.git = {
    enable = true;
  };

  programs.firefox = {
    enable = true;
  };

  
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [];
}

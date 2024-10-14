# Edit this configuration file to define" what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ 
      ./system.nix
      ./desktop.nix
      ./services.nix
      ./applications.nix
       /etc/nixos/hardware-configuration.nix
      ./zsh/default.nix
    ];


  fonts.packages = with pkgs; [
  ( nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
    SUDO_EDITOR = "hx";
  };
      
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.mpendlebury = {
    isNormalUser = true;
    description = "Mark Pendlebury";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    # shell = pkgs.bash;
    packages = with pkgs; [
      helix
      btop
      kitty
      lazygit
      neofetch
      fzf
      git
    ];
  };


  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;



  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}

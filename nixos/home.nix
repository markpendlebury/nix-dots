{ config, pkgs, ... }:
let
  gruvboxPlus = import ./gruvbox-plus.nix { inherit pkgs; };
in
{

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  imports = [
    ./firefox.nix
    ./waybar.nix
    ./vscode.nix
    ./wofi.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "mpendlebury";
  home.homeDirectory = "/home/mpendlebury";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
    helix
    btop
    kitty
    lazygit
    neofetch
    fzf
    networkmanager
    obsidian
    gtk-engine-murrine
    gnome-themes-extra
    ];


  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    ".config/btop/btop.conf".source = ../config/btop/btop.conf;
    ".config/btop/themes/gruvbox.theme".source = ../config/btop/gruvbox.theme;

    "config/neofetch/config.conf".source = ../config/neofetch/config.conf;

    ".config/helix/config.toml".source = ../config/helix/config.toml;
    ".config/helix/languages.toml".source = ../config/helix/languages.toml;

    ".config/hypr/hyprland.conf".source = ../config/hypr/hyprland.conf;

    ".config/kitty/kitty.conf".source = ../config/kitty/kitty.conf;
    ".config/kitty/theme.conf".source = ../config/kitty/theme.conf;

    ".config/neofetch/config.conf".source = ../config/neofetch/config.conf;

    ".zshrc".source = ../config/zsh/.zshrc;
    ".config/zsh/themes/gruvbox.zsh-theme".source = ../config/zsh/gruvbox.zsh-theme;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/mpendlebury/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
  };


  gtk = {
    enable = true;

    cursorTheme = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Mordern-Ice";  
    };

    theme = {
      package = pkgs.gruvbox-gtk-theme;
      name = "gruvbox-gtk-theme";
    };

    iconTheme = {
      package = gruvboxPlus;
      name = "gruvboxplus";
    };
  };

    
    
}

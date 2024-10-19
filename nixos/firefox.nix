{ config, pkgs, ... }:

{
  # Configuration for managing firefox using home-manager
  # Most of this config inspiration came from this post: 
  # https://discourse.nixos.org/t/declare-firefox-extensions-and-settings/36265

  
 


  programs.firefox = {
    enable = true;
    profiles = {
      default = {
        id = 0;
        name = "default";
        isDefault = true;
        settings = {
          "browser.startup.homepage" = "https://chevron.elesoft.dev";
          "browser.search.defaultenginename" = "Google";
          "browser.search.order.1" = "Google";
          "privacy.clearOnShutdown.cookies" = true;
        };
       };
      };
    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptominidg = true;
        Fingerprinting = true;
      };
      DisablePocket = true;
      DisableFirefoxAccounts = true;
      DisableAccounts = true;
      OverrideFirstRunPage = "https://chevron.elesoft.dev";
      OverridePostUpdatePage = "https://chevron.elesoft.dev";
      DontCheckDefaultBrowser = true;
      DisplayBookmarksToolbar = "always";
      DisplayMenuBar = "default-on";
      PasswordManagerEnabled = false;
      

    
    /* ---- EXTENSIONS ---- */
    # Check about:support for extension/add-on ID strings.
    # Valid strings for installation_mode are "allowed", "blocked",
    # "force_installed" and "normal_installed".
    ExtensionSettings = {
      "*".installation_mode = "blocked"; # blocks all addons except the ones specified below
      # uBlock Origin:
      "uBlock0@raymondhill.net" = {
        install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
        installation_mode = "force_installed";
        default_area = "menupanel";
      };
     # Bitwarden
      "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
        install_url = "https://addons.mozilla.org/firefox/downloads/file/4363548/bitwarden_password_manager-2024.10.0.xpi";
        installation_mode = "force_installed";
        default_area = "navbar";
      };
      # Gruvbox Dark Theme
      "{7c4b7a20-26d8-4788-a840-71fa26d332e0}" = {
        install_url = "https://addons.mozilla.org/firefox/downloads/file/3792120/gruvbox_medium_dark-2.0.xpi";
        installation_mode = "force_installed";
      };
      # Vimium
      "{d7742d87-e61d-4b78-b8a1-b469842139fa}" = {
        install_url = "https://addons.mozilla.org/firefox/downloads/file/4259790/vimium_ff-2.1.2.xpi";
        installation_mode = "force_installed";
        default_area = "menupanel";
      };
      # Consent-o-matic
      "gdpr@cavi.au.dk" = {
        install_url = "https://addons.mozilla.org/firefox/downloads/file/4362793/consent_o_matic-1.1.3.xpi";
        installation_mode = "force_installed";
        default_area = "menupanel";
      };
      # New Tab Override
      "newtaboverride@agenedia.com" = {
        install_url = "https://addons.mozilla.org/firefox/downloads/file/4303770/new_tab_override-16.0.1.xpi";
        installation_mode = "force_installed";
        default_area = "menupanel";
      };
      
      # "" = {
      #   install_url = "";
      #   installation_mode = "force_installed";
      # };
      
      # "" = {
      #   install_url = "";
      #   installation_mode = "force_installed";
      # };
    };
    
    };

  };


  
}

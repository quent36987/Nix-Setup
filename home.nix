{ config, pkgs, lib, ... }:

let
  unstable = import <nixos-unstable> { config.allowUnfree = true; };
in
{
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # Overview
    htop
    neofetch
    feh
    gnupg

     # Tools
    i3lock-fancy
    pavucontrol
    arandr

    # Dev tools
    any-nix-shell
    gitAndTools.gitflow
    nodejs

    # Fonts
    font-awesome
    fira-code
    fira-code-symbols

    # Fun
    unstable.discord
    spotify
    brave
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "vinetos";
  home.homeDirectory = "/home/vinetos";

  programs = {
    home-manager.enable = true;
    neovim = import ./nvim.nix { inherit pkgs; };

    alacritty = import ./alacritty.nix { inherit pkgs; };    

    git = {
      enable = true;
      userName = "Valentin Chassignol";
      userEmail = "Vinetosdev"+"@"+"gmail"+"."+"com";
    };
  };

  fonts.fontconfig.enable = true;
  
  services = {
    polybar = import ./polybar.nix { inherit pkgs; };
    gpg-agent = {
      enable = true;

      enableSshSupport = true;
      pinentryFlavor = "curses";
    };
  };

  xsession.windowManager.i3 = import ./i3.nix {inherit pkgs lib; };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "20.09";
}

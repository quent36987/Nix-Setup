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
    zip 
    unzip 
    wget 
    feh 
    gnupg 

    # Tools
    i3lock-fancy
    light
    shutter

    # Java dev
    gradle 
    adoptopenjdk-bin
    unstable.idea.idea-ultimate

    # C dev
    gcc 
    gnumake 
    unstable.idea.clion

    # Fonts
    roboto 
    source-code-pro 
    jetbrains-mono
    
    # Fun
    unstable.discord 
    steam
  ];
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "vinetos";
  home.homeDirectory = "/home/vinetos";

  programs = {
    home-manager.enable = true;
    neovim.enable = true;

    alacritty = import ./alacritty.nix { inherit pkgs; };    

    git = {
      enable = true;
      userName = "Valentin Chassignol";
      userEmail = "Vinetosdev"+"@"+"gmail"+"."+"com";
    };
  };
  
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

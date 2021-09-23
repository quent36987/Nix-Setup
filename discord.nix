{ config, pkgs, ... }:

let 
  url = https://discord.com/api/download?platform=linux&format=tar.gz;

in {
  nixpkgs.overlays = [(self: super: { discord = super.discord.overrideAttrs (_: { src = builtins.fetchTarball url; });})];

  home.packages = with pkgs; [
    discord
  ];
}

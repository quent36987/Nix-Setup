{ config, pkgs, ... }:

let 
  url = https://discord.com/api/download?platform=linux&format=tar.gz;

in {
  home.packages = with pkgs; [
    #gdb
    #gcc
    #cmake
    #gnumake
    
  ];

  programs = {
    fish = {
      enable = true;
      promptInit = ''
         any-nix-shell fish --info-right | source
       '';
       shellAliases = {
         ll = "ls -lh";
         la = "ls -a";
         gc = "gcc -Wextra -Wall -Werror -std=c99 -pedantic";
      };
     };
  };
}

{ pkgs, ... }:

{
  enable = true;
  vimAlias = true;

  extraConfig = ''
    set expandtab
    set tabstop=4
    set shiftwidth=4
    set nu
    set autoindent
    set smartindent

    set nocompatible   
    syntax on
    ;
  '';

  plugins = with pkgs.vimPlugins; [ 
    vim-polyglot
  ];
}

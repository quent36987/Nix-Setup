{ pkgs, ... }:
let
  vim_folder = /home/quentin.goujon/afs/.confs/config/nixpkgs/editor/neovim;
  vim_plugins = /home/quentin.goujon/afs/.confs/config/nixpkgs/editor/neovim/plugins;
  vim_lua = /home/quetin.goujon/afs/.confs/config/nixpkgs/editor/neovim/lua;

  feline-nvim = pkgs.vimUtils.buildVimPlugin {
    pname = "feline.nvim";
    version = "2021-09-26";
    src = pkgs.fetchFromGitHub {
      owner = "famiu";
      repo = "feline.nvim";
      rev = "a67897405f23cce54473d2afbc1a7df63688b815";
      sha256 = "1wi2rqbkp6hz454kxi5fznb0lkac59f99ffj0s0snzzq21d3k5d5";
    };
    meta.homepage = "https://github.com/famiu/feline.nvim/";
  };
in
{
  enable = true;
  vimAlias = true;
  viAlias = true;

  extraConfig = ''
    source ${vim_folder}/settings.vim
    source ${vim_plugins}/airline/nord.vim
    source ${vim_plugins}/lsp.vim
  '';

  plugins = with pkgs.vimPlugins; [ 
    # StatusBar
    vim-airline

    # Navigation
    nvim-web-devicons
    telescope-nvim
    nerdtree

    # LSP
    nvim-lspconfig
    vim-polyglot

    # Completion
    nvim-treesitter
    nvim-compe

    # Eyecandy
    vim-css-color    # Color previewer
    indentLine
    nord-vim
  ];
}

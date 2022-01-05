pkgs:

{
  enable = true;
  vimAlias = true;
  vimdiffAlias = true;
  withPython3 = true;

  plugins = with pkgs.vimPlugins; [
    nerdtree
    lightline-vim
    coc-nvim
    vim-nix
    rust-vim
    coc-rust-analyzer
  ];

  extraConfig = builtins.readFile ./neovim-extra.cfg;
}

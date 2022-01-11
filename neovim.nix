pkgs:

{
  enable = true;
  vimAlias = true;
  vimdiffAlias = true;
  withPython3 = true;

  plugins = with pkgs.vimPlugins; [
    nerdtree
    lightline-vim
    vim-nix
    rust-vim
    coc-nvim
    coc-rust-analyzer
  ];

  coc = {
    enable = true;
    settings = builtins.readFile ./coc-settings.json;
  };

  extraConfig = builtins.readFile ./neovim-extra.cfg;
}

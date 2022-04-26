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
    vim-snippets
    vim-surround
    vim-autoformat
    coc-nvim
    coc-rust-analyzer
    coc-snippets
    coc-texlab
    coc-spell-checker
  ];

  coc = {
    enable = true;
    settings = {
      "rust-analyzer.serverPath" = "rust-analyzer";
    };
  };

  extraConfig = builtins.readFile ./neovim-extra.cfg;
}

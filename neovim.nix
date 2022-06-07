pkgs:

let 
  vimtla = pkgs.vimUtils.buildVimPlugin {
    name = "vim-tla";
    src = pkgs.fetchFromGitHub {
      owner = "florentc";
      repo = "vim-tla";
      rev = "220145ef791ac8d64d2c319eb2940b59da17d6ca";
      sha256 = "YdXBzxB5yfpPJJ1wVRdl6i1rPDzgwrxB1Onlkixk4/c=";
    };
  };
in{
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
    vimtla
  ];

  coc = {
    enable = true;
    settings = {
      "rust-analyzer.serverPath" = "rust-analyzer";
      "java.jdt.ls.vmargs" = "-noverify -Xmx1G -XX:+UseG1GC -XX:+UseStringDeduplication -Xlog:disable -Xlog:all=warning:stderr:uptime,level,tags";
    };
  };

  extraConfig = builtins.readFile ./neovim-extra.cfg;
}

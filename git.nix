pkgs:

{
  enable = true;
  delta = {
    enable = true;
  };
  userEmail = "cjj39@cam.ac.uk";
  userName = "cjen1";
  extraConfig = {
    init.defaultBranch = "main";
    core.editor = "vim";
  };
  ignores = [
    "*.swp"
    ];
}

{pkgs, passwords, lib}:

{

  systemd.user.startServices = true;

  services.lorri.enable = true;

  services.spotifyd = {
    enable = true;
    settings = {
      global = {
        username = "Cjen1";
        password = passwords.spotifyd;
        device_name = "graphite-hm";
      };
    };
  };

  services.syncthing.enable = true;

  home.sessionVariables = { TERMINAL = "alacritty"; };

  home.packages = with pkgs; [
    tectonic
    vivaldi vivaldi-ffmpeg-codecs vivaldi-widevine
    krb5
    spotify-tui
    okular
    protonvpn-cli
    playerctl
    tmux
    tlaplusToolbox
    signal-desktop
    nodejs
    gnumake
    unzip
    zoom-us
    vlc
    discord
    magic-wormhole
    deluge
  ];
  programs = {
    fish = {
      enable = true;
      shellInit = ''
      direnv hook fish | source
      '';
    };
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
    alacritty.enable = true;
    neovim = import ./neovim.nix pkgs;
    rofi = {
      enable = true;
      location= "top";
    };
    git = import ./git.nix pkgs;
  };

  xsession = {
    enable = true;
    scriptPath = ".hm-xsession";
    windowManager.i3 = import ./i3.nix {pkgs=pkgs; lib=lib;};
  };

  xdg.configFile."nvim/coc-settings.json".text = builtins.readFile ./coc-settings.json;
}

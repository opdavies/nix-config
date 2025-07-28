{
  config,
  inputs,
  outputs,
  system,
  ...
}:
let
  pkgs = import inputs.nixpkgs {
    inherit system;

    config.allowUnfree = true;

    overlays = [
      outputs.overlays.additions
      outputs.overlays.stable-packages
    ];
  };

  inherit (pkgs) lib;

  inherit (config.xdg)
    cacheHome
    configHome
    dataHome
    stateHome
    ;
in
{
  home.username = "opdavies";
  home.homeDirectory = "/home/${config.home.username}";

  home.packages = with pkgs; [
    cachix
    delta
    entr
    gcc
    git
    git-crypt
    gnupg
    inotify-tools
    jq
    killall
    lua
    mob
    pv
    simple-http-server
    sshs
    tldr
    tree
    tree-sitter
    unzip
    w3m
    watchexec
    wget
    xclip
    xdg-utils
    zbar
  ];

  programs.home-manager.enable = true;

  home.sessionVariables = {
    EDITOR = "nvim";
    IMAPFILTER_HOME = "${configHome}/imapfilter";
    LANG = "en_GB.UTF-8";
    LC_ALL = "en_GB.UTF-8";
    LC_CTYPE = "en_GB.UTF-8";
    PASSWORD_STORE_DIR = "${dataHome}/pass";
    PATH = lib.concatStringsSep ":" [
      "$PATH"
      "$HOME/go/bin"
      "./vendor/bin"
      "./node_modules/.bin"
    ];
    PULUMI_SKIP_UPDATE_CHECK = "true";
    W3M_DIR = "${stateHome}/w3m";
    WGETRC = "${configHome}/wgetrc";
    XDG_CONFIG_HOME = config.xdg.configHome;
    XDG_DATA_HOME = dataHome;
    XDG_STATE_HOME = stateHome;
  };

  xdg = {
    configFile = {
      "${config.home.sessionVariables.WGETRC}".text = ''
        hsts-file = "${cacheHome}/wget-hsts"
      '';
    };

    userDirs = {
      enable = true;

      extraConfig = {
        XDG_REPOS_DIR = "${config.home.homeDirectory}/Code";
      };
    };
  };

  # Nicely reload system units when changing configs.
  systemd.user.startServices = "sd-switch";

  home.stateVersion = "22.05"; # Please read the comment before changing.
}

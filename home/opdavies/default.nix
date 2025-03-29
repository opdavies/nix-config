{
  config,
  headless ? false,
  hostname,
  inputs,
  outputs,
  self,
  system,
  username,
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

  inherit (config.xdg)
    cacheHome
    configHome
    dataHome
    stateHome
    ;

  inherit (pkgs) lib;

  shared-config = import "${self}/lib/shared/home-manager.nix" {
    inherit
      config
      hostname
      inputs
      lib
      pkgs
      self
      username
      ;
  };

  shared-packages = import "${self}/lib/shared/home-manager-packages.nix" {
    inherit
      headless
      inputs
      pkgs
      username
      ;
  };
in
{
  imports =
    [
      ../common
      shared-config
      ./modules
    ]
    ++ pkgs.lib.optionals (!headless) [
      ./desktop
    ];

  home.packages = shared-packages;

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
}

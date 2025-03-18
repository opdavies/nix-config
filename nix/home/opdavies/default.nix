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

  inherit (config.xdg) cacheHome configHome;
  inherit (pkgs) lib;

  shared-config = import "${self}/nix/lib/shared/home-manager.nix" {
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

  shared-packages = import "${self}/nix/lib/shared/home-manager-packages.nix" {
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
      ./modules/node.nix
      shared-config
    ]
    ++ pkgs.lib.optionals (!headless) [
      ./desktop
    ];

  home.packages = shared-packages;

  home.sessionVariables = {
    EDITOR = "nvim";
    LANG = "en_GB.UTF-8";
    LC_ALL = "en_GB.UTF-8";
    LC_CTYPE = "en_GB.UTF-8";
    PASSWORD_STORE_DIR = "${config.xdg.dataHome}/pass";
    PATH = lib.concatStringsSep ":" [
      "$PATH"
      "$HOME/go/bin"
      "./vendor/bin"
      "./node_modules/.bin"
    ];
    PULUMI_SKIP_UPDATE_CHECK = "true";
    W3M_DIR = "${config.xdg.stateHome}/w3m";
    WGETRC = "${configHome}/wgetrc";
    XDG_CONFIG_HOME = "${config.xdg.configHome}";
    XDG_DATA_HOME = "${config.xdg.dataHome}";
    XDG_DOCUMENTS_DIR = "$HOME/Documents";
    XDG_REPOS_DIR = "$HOME/Code";
  };

  xdg.configFile = {
    "${config.home.sessionVariables.WGETRC}".text = ''
      hsts-file = "${cacheHome}/wget-hsts"
    '';
  };
}

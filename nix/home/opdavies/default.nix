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
      shared-config
    ]
    ++ pkgs.lib.optionals (!headless) [
      ./desktop
    ];

  home.packages = shared-packages;

  home.sessionVariables = {
    DOCUMENTS = "$HOME/Documents";
    EDITOR = "nvim";
    LANG = "en_GB.UTF-8";
    LC_ALL = "en_GB.UTF-8";
    LC_CTYPE = "en_GB.UTF-8";
    PATH = lib.concatStringsSep ":" [
      "$PATH"
      "$HOME/go/bin"
      "./vendor/bin"
      "./node_modules/.bin"
    ];
    PULUMI_SKIP_UPDATE_CHECK = "true";
    REPOS = "$HOME/Code";
    XDG_CONFIG_HOME = "${config.xdg.configHome}";
  };
}

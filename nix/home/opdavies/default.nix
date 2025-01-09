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
  imports = [ shared-config ];

  home.packages =
    shared-packages
    ++ pkgs.lib.optionals (!headless) (
      with pkgs;
      [
        build-glove80
        gscan2pdf
        meslo-lg
        obs-studio
        okular
        pamixer
        pavucontrol
        xcape
        xsel
      ]
    );

  home.sessionVariables = {
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
    RIPGREP_CONFIG_PATH = "$HOME/.config/ripgrep/config";
  };
}

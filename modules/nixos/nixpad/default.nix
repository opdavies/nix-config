{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.nixpad;
in
{
  options.nixpad = {
    enable = lib.mkEnableOption "Enable nixpad configuration";
  };

  config = lib.mkIf cfg.enable {
    services.xserver = {
      enable = true;

      desktopManager.cinnamon.enable = true;
      displayManager.lightdm.enable = true;
    };

    programs.firefox.enable = true;

    environment.systemPackages = with pkgs; [
      git
      libreoffice
    ];

    nix.gc = {
      automatic = true;
      dates = "Mon 4:00";
      options = "--delete-older-than 30d";
    };
  };
}

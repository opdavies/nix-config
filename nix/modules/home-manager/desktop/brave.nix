{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

{
  options.homeManagerModules.brave.enable = mkEnableOption "Enable brave";

  config = mkIf config.homeManagerModules.brave.enable {
    programs.chromium = {
      enable = true;
      package = pkgs.brave;

      commandLineArgs = [
        "--password-store=basic"
      ];

      extensions = [
        "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
        "eimadpbcbfnmbkopoojfekhnkhdbieeh" # Dark Reader
        "chphlpgkkbolifaimnlloiipkdnihall" # OneTab
        "nffaoalbilbmmfgbnbgppjihopabppdk" # Video Speed Controller
        "dbepggeogbaibhgnhhndojpepiihcmeb" # Vimium
        "bfbameneiokkgbdmiekhjnmfkcnldhhm" # Web Developer
      ];
    };
  };
}

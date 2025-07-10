{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.features.cli.${service};
  service = "sxhkd";

  inherit (lib) getExe mkIf mkEnableOption;
in
{
  options.features.cli.${service} = {
    enable = mkEnableOption "Enable ${service}";
  };

  config = mkIf cfg.enable {
    xsession.enable = true;

    services.${service} = {
      enable = true;

      keybindings = {
        "{_, shift +, super +}XF86MonBrightness{Down,Up}" =
          "${getExe pkgs.brightnessctl} set {5%-,10%-,10%,+5%,+10%,100%} --quiet";
        "super + BackSpace" = "/home/opdavies/sysact";
        "super + shift + b" = "/etc/profiles/per-user/opdavies/bin/bookmarkthis";
        "super + shift + i" =
          "${pkgs.xdotool}/bin/xdotool type $(cat ~/.local/share/snippets.txt | grep -v '^#' | grep -v '^$' | sort | dmenu -i -l 50 | cut -d' ' -f1)";
        "super + shift + p" = "${getExe pkgs.passmenu-otp} -i";
        "super + x; {1, 2, 3, 4}" = "st {notes, newsboat, nmtui, bluetuith}";
        "@F3" = "${getExe pkgs.displayselect}";
        "@F9" = "/home/opdavies/.local/bin/mounter";
        "@F10" = "/home/opdavies/.local/bin/unmounter";
      };
    };
  };
}

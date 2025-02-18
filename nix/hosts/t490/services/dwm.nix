{
  config,
  lib,
  pkgs,
  self,
  ...
}:

with lib;

{
  options.features.desktop.dwm.enable = mkEnableOption "Enable dwm";

  config = mkIf config.features.desktop.dwm.enable {
    services = {
      dwm-status = {
        enable = true;

        order = [
          "audio"
          "backlight"
          "battery"
          "cpu_load"
          "network"
          "time"
        ];
      };

      xserver = {
        displayManager.startx.enable = true;

        windowManager.dwm = {
          enable = true;

          package = pkgs.dwm.overrideAttrs (oldAttrs: {
            patches = with pkgs; [
              "${self}/patches/dwm/add-custom-commands-and-keys.patch"
              "${self}/patches/dwm/change-mod-key.patch"

              (fetchpatch {
                url = "https://dwm.suckless.org/patches/hide_vacant_tags/dwm-hide_vacant_tags-6.4.diff";
                sha256 = "GIbRW0Inwbp99rsKLfIDGvPwZ3pqihROMBp5vFlHx5Q=";
              })

              (fetchpatch {
                url = "https://dwm.suckless.org/patches/pertag/dwm-pertag-20200914-61bb8b2.diff";
                sha256 = "wRZP/27V7xYOBnFAGxqeJFXdoDk4K1EQMA3bEoAXr/0=";
              })
            ];
          });
        };
      };
    };

    systemd.user.services.dwm-status.serviceConfig.Restart = "on-failure";

    environment.systemPackages = with pkgs; [
      dmenu
      dmenu-bluetooth
      networkmanager_dmenu

      (st.override {
        patches = with pkgs; [
          "${self}/patches/st/change-font.patch"

          (fetchpatch {
            url = "https://st.suckless.org/patches/anysize/st-anysize-20220718-baa9357.diff";
            sha256 = "yx9VSwmPACx3EN3CAdQkxeoJKJxQ6ziC9tpBcoWuWHc=";
          })
        ];
      })

      xdotool
    ];
  };
}

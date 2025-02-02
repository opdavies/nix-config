{ inputs, self, ... }:

{
  additions =
    final: prev:
    import ../pkgs {
      inherit prev;

      pkgs = final;
    };

  modifications = final: prev: {
    dwm = prev.dwm.override {
      patches = [
        "${self}/patches/dwm/add-custom-commands-and-keys.patch"
        "${self}/patches/dwm/change-mod-key.patch"
        "${self}/patches/dwm/change-termcmd.patch"
        "${self}/patches/dwm/dwm-hide_vacant_tags-6.4.diff"
      ];
    };
  };

  stable-packages = final: _prev: {
    nixpkgs-2405 = import inputs.nixpkgs-2405 {
      config.allowUnfree = true;
      system = final.system;
    };

    nixpkgs-2411 = import inputs.nixpkgs-2411 {
      config.allowUnfree = true;
      system = final.system;
    };
  };
}

{ inputs, ... }:

{
  additions =
    final: prev:
    import ../pkgs {
      inherit prev;

      pkgs = final;
    };

  modifications = final: prev: {
    dwm = import ./mods/dwm { inherit prev; };
  };

  stable-packages = final: _prev: {
    nixpkgs-2411 = import inputs.nixpkgs-2411 {
      config.allowUnfree = true;
      system = final.system;
    };
  };
}

{ inputs, ... }:

{
  additions =
    final: prev:
    import ../packages {
      inherit prev;

      pkgs = final;
    };

  modifications = final: prev: {
    dwm = import ./mods/dwm { inherit prev; };
  };

  stable-packages = final: _prev: {
    stable = import inputs.nixpkgs-stable {
      system = final.system;
    };
  };
}

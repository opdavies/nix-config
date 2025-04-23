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
  };
}

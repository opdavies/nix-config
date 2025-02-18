{ inputs, ... }:

{
  additions =
    final: prev:
    import ../pkgs {
      inherit prev;

      pkgs = final;
    };

  modifications = final: prev: {
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

{ inputs, username, ... }:

{
  imports = [
    ../common
    ../../users/opdavies
  ];

  features = {
    cli = {
      docker.enable = true;
    };
  };

  wsl = {
    enable = true;
    defaultUser = username;
  };

  services.syncthing.enable = true;

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

  nix = {
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 7d";
    };

    optimise.automatic = true;

    settings = {
      auto-optimise-store = true;

      experimental-features = [
        "nix-command"
        "flakes"
      ];

      warn-dirty = false;
    };
  };
}

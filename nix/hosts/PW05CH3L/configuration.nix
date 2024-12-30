{
  headless ? false,
  hostname,
  inputs,
  outputs,
  pkgs,
  self,
  system,
  username,
  ...
}:

{
  home-manager = {
    extraSpecialArgs = {
      inherit
        hostname
        inputs
        outputs
        headless
        self
        system
        username
        ;
    };
    useGlobalPkgs = true;
    useUserPackages = true;

    users."${username}" = import "${self}/nix/home/${username}";
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
    };

    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.stable-packages
    ];
  };

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

  # # Enable networking
  # networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/London";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  # Configure console keymap
  console.keyMap = "uk";

  users.users.${username} = {
    description = "Oliver Davies";
    isNormalUser = true;

    extraGroups = [
      "docker"
      "media"
      "networkmanager"
      "wheel"
    ];

    packages = with pkgs; [ ];
  };

  security.sudo.wheelNeedsPassword = false;

  environment.systemPackages =
    with pkgs;
    [
    ]
    ++ pkgs.lib.optionals (!headless) [
    ];

  system.stateVersion = "22.11";

  nix = {
    extraOptions = ''
      trusted-users = root ${username}
    '';

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

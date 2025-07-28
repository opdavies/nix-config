{
  hostname,
  inputs,
  outputs,
  pkgs,
  self,
  stateVersion,
  system,
  username,
  ...
}:

{
  imports = [
    ./users

    inputs.home-manager.nixosModules.home-manager

    outputs.nixosModules.default
  ];

  nix = {
    settings = {
      auto-optimise-store = true;

      download-buffer-size = "104857600";

      experimental-features = [
        "nix-command"
        "flakes"
      ];

      warn-dirty = false;
    };
  };

  programs.zsh.enable = true;

  users.defaultUserShell = pkgs.zsh;

  environment.systemPackages = with pkgs; [
    cryptsetup
    fastfetch
    mermaid-cli
    mkcert
  ];

  home-manager = {
    backupFileExtension = "backup";

    extraSpecialArgs = {
      inherit
        hostname
        inputs
        outputs
        self
        system
        username
        ;
    };
    useGlobalPkgs = true;
    useUserPackages = true;

    users."${username}" = import ./home.nix;
  };

  nixpkgs = {
    config = {
      permittedInsecurePackages = [ "electron-27.3.11" ];
    };

    overlays = [
      inputs.nur.overlays.default

      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.stable-packages
    ];
  };

  nix.extraOptions = ''
    trusted-users = root ${username}
  '';

  networking.hostName = hostname;

  time.timeZone = "Europe/London";

  i18n = {
    defaultLocale = "en_GB.UTF-8";

    extraLocaleSettings = {
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
  };

  console.keyMap = "uk";

  security.sudo.wheelNeedsPassword = false;

  system.stateVersion = stateVersion;
}

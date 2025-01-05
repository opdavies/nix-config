{ pkgs, ... }:

{
  users.users.opdavies = {
    description = "Oliver Davies";
    isNormalUser = true;

    extraGroups = [
      "docker"
      "networkmanager"
      "wheel"
    ];

    packages =
      with pkgs;
      [ ]
      ++ pkgs.lib.optionals (!headless) [
        brave
        firefox
      ];
  };
}

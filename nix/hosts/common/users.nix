{ username, ... }:

{
  users = {
    users.${username} = {
      isNormalUser = true;
      description = "Oliver Davies";

      extraGroups = [
        "docker"
        "networkmanager"
        "wheel"
      ];

      packages = [ ];
    };

    defaultUserShell = pkgs.zsh;
  };
}

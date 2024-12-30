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

    defaultUserShell = "/etc/profiles/per-user/${username}/bin/zsh";
  };
}

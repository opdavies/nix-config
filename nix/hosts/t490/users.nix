{ pkgs, username, ... }:

{
  users.users.${username} = {
    extraGroups = [ "media" ];

    packages = with pkgs; [
      android-tools
      via
    ];
  };

  users.groups.media = { };
}

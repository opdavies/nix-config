{ pkgs, username, ... }:

{
  users.users.${username} = {
    extraGroups = [ "media" ];

    packages = with pkgs; [
      abook
      android-tools
      via
    ];
  };

  users.groups.media = { };
}

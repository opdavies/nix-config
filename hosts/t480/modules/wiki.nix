{ lib, ... }:

with lib;

{
  home-manager.users.opdavies =
    { config, pkgs, ... }:
    {
      home.packages = with pkgs; [
        (pkgs.writeShellApplication (
          let
            remoteIpAddresses = [
              "116.203.11.255"
              "192.168.1.116"
            ];

            wikiPath = "${config.xdg.userDirs.documents}/wiki";
          in
          {
            name = "wiki-push";

            text = builtins.concatStringsSep "\n" (
              map (ipAddress: ''
                ${getExe pkgs.rsync} -avz --update \
                  --delete --delete-after \
                  ${wikiPath}/ ${ipAddress}:${wikiPath} "$@"
              '') remoteIpAddresses
            );
          }
        ))
      ];
    };
}

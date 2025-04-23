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
              "nixedo.local"
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

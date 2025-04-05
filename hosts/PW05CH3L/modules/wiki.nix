{ lib, ... }:

with lib;

{
  home-manager.users.opdavies =
    { config, pkgs, ... }:
    {
      home =
        let
          remoteIpAddress = "192.168.1.111";
          wikiPath = "${config.xdg.userDirs.documents}/wiki";
        in
        {
          packages = [
            (pkgs.writeShellApplication {
              name = "wiki-pull";

              text = ''
                ${getExe pkgs.rsync} -avz --update \
                  ${remoteIpAddress}:${wikiPath}/ ${wikiPath} "$@"
              '';
            })

            (pkgs.writeShellApplication {
              name = "wiki-push";

              text = ''
                ${getExe pkgs.rsync} -avz --update \
                  ${wikiPath}/ ${remoteIpAddress}:${wikiPath} "$@"
              '';
            })
          ];
        };
    };
}

{
  config,
  lib,
  pkgs,
  ...
}:

{
  homeManagerModules = {
    neovim.enable = true;

    notes = {
      enable = true;
      directory = "$HOME/Documents/wiki/tfw-notes";
    };

    tmux.enable = true;
    tmux-sessionizer.enable = true;
  };

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
            ${lib.getExe pkgs.rsync} -avz --update \
              ${remoteIpAddress}:${wikiPath}/ ${wikiPath} "$@"
          '';
        })

        (pkgs.writeShellApplication {
          name = "wiki-push";

          text = ''
            ${lib.getExe pkgs.rsync} -avz --update \
              ${wikiPath}/ ${remoteIpAddress}:${wikiPath} "$@"
          '';
        })
      ];

      sessionVariables = {
        WAYLAND_DISPLAY = "";
      };
    };
}

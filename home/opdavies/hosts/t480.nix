{ config, pkgs, ... }:

{
  homeManagerModules = {
    newsboat.enable = true;

    notes = {
      enable = true;
      directory = "$HOME/Documents/wiki/notes";
    };

    tmux.enable = true;
    tmux-sessionizer.enable = true;
  };

  home.packages = with pkgs; [
    backup-websites
    displayselect
    isync
    upload-to-files

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
            ${lib.getExe pkgs.rsync} -avz --update \
              --delete --delete-after \
              ${wikiPath}/ ${ipAddress}:${wikiPath} "$@"
          '') remoteIpAddresses
        );
      }
    ))
  ];

  programs.neomutt = {
    enable = true;

    vimKeys = true;
  };
}

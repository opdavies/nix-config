{ lib, pkgs, ... }:

pkgs.writeShellApplication {
  name = "backup-websites";

  text = ''
    backup_path="''${HOME}/server-backup"

    mkdir -p "''${backup_path}"

    ${lib.getExe pkgs.rsync} -avzP ssh.oliverdavies.uk:/var/www/vhosts/ "''${backup_path}" --delete-after
  '';
}

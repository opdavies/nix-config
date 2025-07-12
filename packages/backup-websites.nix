{ pkgs, ... }:

pkgs.writeShellApplication {
  name = "backup-websites";

  runtimeInputs = with pkgs; [ rsync ];

  text = ''
    backup_path="''$HOME/server-backup"

    mkdir -p "''$backup_path"

    rsync -avzP nixedo.oliverdavies.uk:/var/www/vhosts/ "''$backup_path" --delete-after
  '';
}

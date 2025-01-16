{ pkgs }:

pkgs.writeShellApplication {
  name = "upload-to-files";

  text = ''
    ${pkgs.rsync}/bin/rsync -avz --info=progress2 "$1" ssh.oliverdavies.uk:/var/www/vhosts/files.oliverdavies.uk
  '';
}

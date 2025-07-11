{ pkgs, writeShellApplication }:

writeShellApplication {
  name = "set-background";

  runtimeInputs = with pkgs; [ xwallpaper ];

  text = ''
    xwallpaper --zoom "''${XDG_REPOS_DIR}/personal/nix-config/wallpaper/wallpaper.jpg"
  '';
}

{ pkgs, ... }:

{
  programs.thunar = {
    enable = true;

    plugins = with pkgs.xfce; [
      thunar-archive-plugin
    ];
  };

  environment.systemPackages = with pkgs; [ xfce.tumbler ];
}

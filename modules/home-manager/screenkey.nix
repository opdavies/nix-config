{ pkgs, ... }:

{
  home.packages = with pkgs; [ screenkey ];

  xdg.configFile."screenkey.json".text = builtins.toJSON {
    key_mode = "composed";
    mods_mode = "emacs";
    persist = true;
    size = "small";
    timeout = 0.25;
  };
}

{
  flake.modules.homeManager.gui =
    { pkgs, ... }:
    {
      programs.librewolf.profiles.default.extensions.packages =
        with pkgs.nur.repos.rycee.firefox-addons; [
          awesome-rss
          bitwarden
          darkreader
          onetab
          tree-style-tab
          ublock-origin
          videospeed
          vimium
          web-developer
        ];
    };
}

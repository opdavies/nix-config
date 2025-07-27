{
  flake.modules.homeManager.gui.programs.librewolf.profiles.default.search.engines = {
    # TODO: Drupal.org users.
    # TODO: Mastodon.
    # TODO: GitHub.
    # TODO: Forgejo.
    drupal_projects = {
      name = "Drupal.org projects";
      urls = [ { template = "https://www.drupal.org/project/{searchTerms}"; } ];
      definedAliases = [ "@dp" ];
    };

    nixvim = {
      name = "Nixvim options search";
      urls = [ { template = "https://nix-community.github.io/nixvim/search/?query={searchTerms}"; } ];
      definedAliases = [ "@nxv" ];
    };
  };
}

{ lib, ... }:

{
  flake.modules.homeManager.base =
    { config, ... }:
    {
      options.programs.tmux-sessionizer = {
        searchPaths = lib.mkOption {
          default = [ config.home.homeDirectory ];
          type = lib.types.listOf lib.types.str;
          description = "List of search paths for tmux-sessionizer to use.";
        };

        # TODO: add TS_EXTRA_SEARCH_PATHS.
        # TODO: add TS_MAX_DEPTH.
        # TODO: add TS_SESSION_COMMANDS once I figure out what they're for.
      };

      config = {
        xdg.configFile."tmux-sessionizer/tmux-sessionizer.conf".text = ''
          TS_SEARCH_PATHS=(${builtins.concatStringsSep " " config.programs.tmux-sessionizer.searchPaths})
          TS_SESSION_COMMANDS=(nvim .)
        '';
      };
    };
}

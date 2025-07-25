{lib,...}:
{
  flake.modules.homeManager.base =
    { config, ... }:
    {
      options.programs.notes.directory = lib.mkOption {
        default = "${config.xdg.userDirs.documents}/notes";
        type = lib.types.str;
      };

      config.home.sessionVariables.NOTES_DIRECTORY = config.programs.notes.directory;
    };
}

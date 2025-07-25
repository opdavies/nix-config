{
  flake.modules.homeManager.base =
    { config, ... }:
    {
      programs.notes.directory = "${config.xdg.userDirs.documents}/wiki/notes";
    };
}

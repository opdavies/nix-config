{ inputs, ... }:

{
  flake.modules.homeManager.base =
    { pkgs, ... }:
    {
      home.packages = [
        (pkgs.writeShellApplication rec {
          name = "heightwidth";

          runtimeInputs = [ pkgs.ffmpeg ];

          text = builtins.readFile "${inputs.rwxrob-dot}/scripts/${name}";
        })
      ];
    };
}

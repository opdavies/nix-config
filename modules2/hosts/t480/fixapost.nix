{ inputs, ... }:

{
  flake.modules.homeManager.base =
    { pkgs, ... }:
    {
      home.packages = [
        (pkgs.writeShellApplication rec {
          name = "fixapost";

          runtimeInputs = [ pkgs.coreutils ];

          text = builtins.readFile "${inputs.rwxrob-dot}/scripts/${name}";
        })
      ];
    };
}

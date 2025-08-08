{ inputs, pkgs }:

pkgs.writeShellApplication rec {
  name = "vic";

  runtimeInputs = with pkgs; [ neovim tmux ];

  text = builtins.readFile "${inputs.rwxrob-dot}/scripts/${name}";
}

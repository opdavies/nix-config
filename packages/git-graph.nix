{ pkgs }:

pkgs.writeShellApplication {
  name = "git-graph";

  runtimeInputs = with pkgs; [ git ];

  text = ''
    # Based on https://github.com/sdaschner/dotfiles/blob/master/bin/git-graph.

    git log \
      --abbrev-commit \
      --all \
      --graph \
      --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%ae>%Creset"
  '';
}
